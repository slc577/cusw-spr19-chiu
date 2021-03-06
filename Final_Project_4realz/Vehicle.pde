class Vehicle {
  protected final float originalLane;
  protected PVector finalDest;
  protected PVector currentDest;
  protected float speed;
  protected float vWidth, vLength;
  protected color fillColor;

  protected PVector loc;
  protected PVector vectToDest;
  protected boolean GASGASGAS;

  protected final Traffic traffic;
  protected final int spawnTime;

  public Vehicle(float locX, float locY, float speed, Traffic traffic) {
    this.originalLane = locY;
    this.finalDest = new PVector(globals.END_X, locY);
    this.currentDest = new PVector(globals.END_X, locY);
    this.speed = speed;
    this.traffic = traffic;
    this.vWidth = globals.VEHICLE_WIDTH;
    this.vLength = globals.CAR_LENGTH;
    this.fillColor = globals.CAR_COLOR;

    this.loc = new PVector(locX, locY);

    this.vectToDest = PVector.sub(this.currentDest, this.loc);
    this.GASGASGAS = false;
    this.spawnTime = millis();
  }
  
  protected int currentWaitTimeMS() {
    return millis() - this.spawnTime;
  }

  protected boolean sameSign(float a, float b) {
    return (a < 0) == (b < 0);
  }

  protected float getObstacleDistance() {
    float minDistance = Float.POSITIVE_INFINITY;
    for (final Vehicle v : traffic.getVehicles()) {
      if (v == this)
        continue;

      if ( !sameSign(v.loc.y, this.loc.y) )
        continue;

      if (v.loc.x < this.loc.x)
        continue;

      final float distance = (v.loc.x - v.vLength/2) - (this.loc.x + this.vLength/2);
      if (distance < minDistance)
        minDistance = distance;
    }

    return minDistance;
  }

  protected boolean canSwitch(float aheadX, float behindX) {
    for (final Vehicle v : traffic.getVehicles()) {
      if (v == this)
        continue;

      if ( sameSign(v.loc.y, this.loc.y) )
        continue;

      if (v.loc.x + v.vLength/2 > behindX && v.loc.x - v.vLength/2 < behindX)
        return false;

      if (v.loc.x - v.vLength/2 < aheadX && v.loc.x - v.vLength/2 > behindX)
        return false;
    }

    return true;
  }

  protected void updateDest(float targetX, float targetY) {
    this.GASGASGAS = !this.GASGASGAS;
    this.currentDest = new PVector(targetX, targetY);
    this.finalDest = new PVector(this.finalDest.x, targetY);
  }

  protected float getSpeed() {
    if (this.GASGASGAS)
      return globals.SWITCH_SPEED;

    final float obstacleDistance = getObstacleDistance();

    final float targetX = this.loc.x + globals.LANE_WIDTH * 2;
    final boolean canSwitch = canSwitch(targetX + this.vLength/2, this.loc.x - this.vLength*1.5);
    //if ( !sameSign(this.originalLane, this.finalDest.y) && obstacleDistance > globals.SLOWDOWN_HEADWAY*2 && canSwitch) {
    //    this.updateDest(targetX, this.finalDest.y * -1);
    //    return globals.SWITCH_SPEED;
    //  }

    if (obstacleDistance < globals.SLOWDOWN_HEADWAY) {
      final float dist = max(obstacleDistance - globals.MIN_HEADWAY, 0);

      if (obstacleDistance > globals.SWITCH_HEADWAY && canSwitch) {
        this.updateDest(targetX, this.finalDest.y * -1);
        return globals.SWITCH_SPEED;
      }

      final float desiredSpeed = dist / (globals.SLOWDOWN_HEADWAY - globals.MIN_HEADWAY) * globals.SPEED_LIMIT;
      if (desiredSpeed <= this.speed) {
        return desiredSpeed;
      }
    }

    return min(globals.SPEED_LIMIT, this.speed + globals.ACCELERATION);
  }

  public boolean moveToDest(int id) {
    if (id < 0) {
      return false;
    }

    // check if vehicle has approached final destination
    if (this.finalDest.x <= this.loc.x) {
      return true;
    }

    // check if vehicle has approached current destination
    if (this.currentDest.x <= this.loc.x) {
      this.updateDest(this.finalDest.x, this.finalDest.y);
    }

    this.speed = max(this.getSpeed(), 0);
    PVector stepVect = new PVector(this.vectToDest.x, this.vectToDest.y).setMag(this.speed);
    this.loc.add(stepVect);
    this.vectToDest = PVector.sub(this.currentDest, this.loc);

    return false;
  }

  protected float getAngleToDest() {
    float rawAngle = PVector.angleBetween(new PVector(0, -1), this.vectToDest);
    final int sign = vectToDest.x > 0 ? 1 : -1;
    return sign * rawAngle + PI;
  }

  public void render() {
    pushMatrix();
    translate(this.loc.x, this.loc.y);
    rotate(this.getAngleToDest());

    noStroke();
    fill(fillColor);
    rect(0, 0, vWidth, vLength);
    // triangle(-10, -5, 10, -5, 0, 50); // uncomment for angle testing
    popMatrix();
  }

  public void render(float locX, float locY) {
    pushMatrix();
    translate(locX, locY);
    rotate(this.getAngleToDest());

    noStroke();
    fill(fillColor);
    rect(0, 0, vWidth, vLength);
    // triangle(-10, -5, 10, -5, 0, 50); // uncomment for angle testing
    popMatrix();
  }
}
