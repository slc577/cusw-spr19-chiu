class Vehicle {
  private PVector finalDest;
  private PVector currentDest;
  private float speed;
  private final float vWidth, vLength;
  private final color fillColor;

  private PVector loc;

  private float angleToDest;
  private PVector vectToDest;

  public Vehicle(float locX, float locY, float speed) {
    this.finalDest = new PVector(globals.END_X, locY);
    this.currentDest = new PVector(globals.END_X, locY);
    this.speed = speed;
    this.vWidth = globals.CAR_WIDTH;
    this.vLength = globals.CAR_LENGTH;
    this.fillColor = globals.CAR_COLOR;

    this.loc = new PVector(locX, locY);

    this.vectToDest = PVector.sub(this.currentDest, this.loc);
    this.angleToDest = this.getAngleToDest(this.vectToDest);
  }

  private float getObstacleDistance() {
    // return globals.START_X + 700 - this.loc.x - globals.CAR_LENGTH/2;

    float minDistance = Float.POSITIVE_INFINITY;
    for (final Vehicle v : globals.VEHICLES.values()) {
      if (v == this)
        continue;

      if (v.loc.y != this.loc.y)
        continue;

      if (v.loc.x < this.loc.x)
        continue;

      final float distance = (v.loc.x - v.vLength/2) - (this.loc.x + this.vLength/2);
      if (distance < minDistance)
        minDistance = distance;
    }

    return minDistance;
  }

  private float getSpeed() {
    final float obstacleDistance = getObstacleDistance();

    if (obstacleDistance < globals.SLOWDOWN_HEADWAY) {
      final float dist = max(obstacleDistance - globals.MIN_HEADWAY, 0);
      final float desiredSpeed = dist / (globals.SLOWDOWN_HEADWAY - globals.MIN_HEADWAY) * globals.SPEED_LIMIT;

      if (desiredSpeed <= this.speed) {
        return desiredSpeed;
      }
    }

    return min(globals.SPEED_LIMIT, this.speed + 0.05);
  }

  public boolean moveToDest(int id) {
    if (id == -1) {
      return false;
    }

    // check if vehicle has approached final destination
    if (this.finalDest.x <= this.loc.x) {
      return true;
    }

    this.speed = this.getSpeed();
    PVector stepVect = new PVector(this.vectToDest.x, this.vectToDest.y).setMag(this.speed);
    this.loc.add(stepVect);

    this.vectToDest = PVector.sub(this.currentDest, this.loc);
    this.angleToDest = this.getAngleToDest(this.vectToDest);

    return false;
  }

  public void render() {
    pushMatrix();
    translate(this.loc.x, this.loc.y);
    rotate(this.angleToDest);

    noStroke();
    fill(fillColor);
    rect(0, 0, vWidth, vLength);
    // triangle(-10, -5, 10, -5, 0, 50); // uncomment for angle testing
    popMatrix();
  }

  private float getAngleToDest(PVector vectToDest) {
    float rawAngle = PVector.angleBetween(new PVector(0, -1), vectToDest);
    final int sign = vectToDest.x > 0 ? 1 : -1;
    return sign * rawAngle + PI;
  }
}