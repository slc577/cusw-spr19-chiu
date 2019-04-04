class Vehicle {
  private final Route route;
  private final ArrayList<Light> lights;
  private final float vWidth, vHeight;
  private final color fillColor;
  
  private final int id;

  private PVector loc;
  private PVector destination;
  private int destIndex;
  private int lightIndex;

  private float angleToDest;
  private PVector vectToDest;
  
  
  public Vehicle(int id, Route route, ArrayList<Light> lights, float vWidth, float vHeight, color fillColor) {
    this.id = id;
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
  
  PVector getLoc() {
    return new PVector(loc.x, loc.y);
  }
  
  private float getVelocity() {
    if (this.id > 0) {
      Vehicle carAhead = traffic.get(this.id - 1);
      float distance = PVector.sub(carAhead.getLoc(), this.loc).mag();
      
      if (distance < 100) {
        float dist = max(distance - 55, 0);
        return (dist / 45.0) * SPEED_LIMIT;
      }
    }
    
    
    
    return SPEED_LIMIT;
  }

  public boolean moveToDest() {
    float velocity = this.getVelocity();
    if (velocity != SPEED_LIMIT) {
      println(velocity);
    }
    
    if (velocity <= 0) {
      return true;
    }
    
    PVector stepVect = new PVector(this.vectToDest.x, this.vectToDest.y).setMag(velocity);
    this.loc.add(stepVect);

    this.vectToDest = PVector.sub(this.destination, this.loc);
    this.angleToDest = this.getAngleToDest(this.vectToDest);
    
    // check if vehicle has approached traffic light
    if (this.lightIndex < 2 && PVector.sub(this.lights.get(lightIndex).getVector(), this.loc).mag() < 50) {
      this.lightIndex++;
    }

    if (this.vectToDest.mag() < ARRIVAL_RADIUS) {
      this.destIndex++;
      
      if (this.destIndex >= this.route.size()) {
        return false;
      }
      this.destination = this.route.get(this.destIndex);
    }
    
    return true;
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
