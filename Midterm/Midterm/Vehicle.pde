class Vehicle {
  private final Route route;
  private final Light[] lights;
  private final float vWidth, vHeight;
  private final color fillColor;
  
  private final int id;
  private int idAhead;
  private int idBehind;

  private PVector loc;
  private PVector destination;
  private int destIndex;
  private int lightIndex;

  private float angleToDest;
  private PVector vectToDest;
  
  public Vehicle(int id, Route route, Light[] lights, float vWidth, float vHeight, color fillColor) {
    this.id = id;
    this.idAhead = -1;
    this.idBehind = -1;
    
    this.route = route;
    this.lights = lights;
    this.vWidth = vWidth;
    this.vHeight = vHeight;
    this.fillColor = fillColor;
    
    this.loc = route.get(0);
    this.destIndex = 1;
    this.destination = route.get(this.destIndex);
    
    this.lightIndex = 0;

    this.vectToDest = PVector.sub(this.destination, this.loc);
    this.angleToDest = this.getAngleToDest(this.vectToDest);
  }
  
  int getId() {
    return this.id;
  }
  
  int getIdAhead() {
    return this.idAhead;
  }
  
  void setIdAhead(int idAhead) {
    this.idAhead = idAhead;
  }
  
  int getIdBehind() {
    return this.idBehind;
  }
  
  void setIdBehind(int idBehind) {
    this.idBehind = idBehind;
  }
  
  PVector getLoc() {
    return new PVector(loc.x, loc.y);
  }
  
  float getDistance(PVector point) {
    return PVector.sub(this.getLoc(), point).mag();
  }
  
  Light getNextLight() {
    return this.lights[lightIndex];
  }
  
  private float getSlowdown(float distance) {
    if (distance < TARGET_HEADWAY) {
      float dist = max(distance - MIN_HEADWAY, 0);
      return (dist / (TARGET_HEADWAY - MIN_HEADWAY)) * 1;
    }
    
    return 1;
  }
  
  private float getVelocity(float speedLimit, boolean reverse) {
    if (this.lightIndex >= this.lights.length) {
      return speedLimit;
    }
    // calculate velocity using upcoming traffic light
    final Light nextLight = this.getNextLight();
    if ( nextLight.isGreen()^reverse ) {
      return speedLimit;
    }
    
    // next light is red
    final float distance = nextLight.getDistance(this.loc);
    return speedLimit * this.getSlowdown(distance);
  }
  
  private float getVelocity(float speedLimit, boolean reverse, Vehicle ahead) {
    final float distanceFromCarAhead = ahead.getDistance(this.loc);
    final float velocity = speedLimit * this.getSlowdown(distanceFromCarAhead);
    return min(velocity, this.getVelocity(speedLimit, reverse));
  }
  
  public boolean moveToDest(float velocity, boolean reverse) {
    PVector stepVect = new PVector(this.vectToDest.x, this.vectToDest.y).setMag(velocity);
    this.loc.add(stepVect);

    this.vectToDest = PVector.sub(this.destination, this.loc);
    this.angleToDest = this.getAngleToDest(this.vectToDest);
    
    // check if vehicle has approached next traffic light
    if (this.lightIndex < this.lights.length && (this.getNextLight().isGreen()^reverse) && this.getNextLight().getDistance(this.loc) < 50) {
      this.lightIndex++;
    }

    // check if vehicle has approached next node
    if (this.vectToDest.mag() < ARRIVAL_RADIUS) {
      this.destIndex++;
      
      if (this.destIndex >= this.route.size()) {
        return true;
      }
      this.destination = this.route.get(this.destIndex);
    }
    
    return false;
  }

  public void render() {
    pushMatrix();
    translate(this.loc.x, this.loc.y);
    rotate(this.angleToDest);

    noStroke();
    fill(fillColor);
    rect(0, 0, vWidth, vHeight);
    // triangle(-10, -5, 10, -5, 0, 50); // uncomment for angle testing
    popMatrix();
  }

  private float getAngleToDest(PVector vectToDest) {
    float rawAngle = PVector.angleBetween(new PVector(0, -1), vectToDest);
    final int sign = vectToDest.x > 0 ? 1 : -1;
    return sign * rawAngle + PI;
  }
}
