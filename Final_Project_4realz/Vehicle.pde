class Vehicle {
  private PVector finalDest;
  private PVector currentDest;
  private final float vWidth, vLength;
  private final color fillColor;

  private PVector loc;

  private float angleToDest;
  private PVector vectToDest;

  public Vehicle(PVector spawnLoc, PVector finalDest) {
    this.finalDest = new PVector(finalDest.x, finalDest.y);
    this.currentDest = new PVector(finalDest.x, finalDest.y);
    this.vWidth = globals.CAR_WIDTH;
    this.vLength = globals.CAR_LENGTH;
    this.fillColor = globals.CAR_COLOR;

    this.loc = new PVector(spawnLoc.x, spawnLoc.y);

    this.vectToDest = PVector.sub(this.currentDest, this.loc);
    this.angleToDest = this.getAngleToDest(this.vectToDest);
  }

  private float getVelocity() {
    return globals.SPEED_LIMIT;
  }

  public boolean moveToDest() {
    println("this", this);
    float velocity = this.getVelocity();
    //println(velocity);
    PVector stepVect = new PVector(this.vectToDest.x, this.vectToDest.y).setMag(velocity);
    //println(stepVect.x, stepVect.y);
    this.loc.add(stepVect);
    //println(this.loc.x, this.loc.y);

    this.vectToDest = PVector.sub(this.currentDest, this.loc);
    this.angleToDest = this.getAngleToDest(this.vectToDest);

    // check if vehicle has approached final destination
    if (PVector.sub(this.finalDest, this.loc).mag() < globals.ARRIVAL_RADIUS) {
      return true;
    }

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
