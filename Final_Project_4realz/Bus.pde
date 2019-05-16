class Bus extends Vehicle {
  protected int nextStopIndex;
  protected boolean atStop;
  protected Timer stopTimer;
  protected final ArrayList<Float> stops;

  public Bus(float locX, float locY, float speed, Traffic traffic, ArrayList<Float> stops) {
    super(locX, locY, speed, traffic);
    this.stops = stops;

    super.vLength = globals.BUS_LENGTH;
    super.fillColor = globals.BUS_COLOR;

    this.nextStopIndex = 0;
    this.currentDest = new PVector(stops.get(this.nextStopIndex), this.finalDest.y);

    this.atStop = false;
    this.stopTimer = new Timer(globals.MIN_BUS_STOP_WAIT_MS, globals.MAX_BUS_STOP_WAIT_MS);
  }

  protected float getSpeed() {
    final float obstacleDistance = getObstacleDistance();
    final float stopDistance = abs(this.currentDest.x - this.loc.x);

    if (obstacleDistance < stopDistance && obstacleDistance < globals.SLOWDOWN_HEADWAY) {
      final float dist = max(obstacleDistance - globals.MIN_HEADWAY, 0);
      final float desiredSpeed = dist / (globals.SLOWDOWN_HEADWAY - globals.MIN_HEADWAY) * globals.SPEED_LIMIT;
      if (desiredSpeed <= this.speed) {
        return desiredSpeed;
      }
    } else if (stopDistance < obstacleDistance && stopDistance < globals.SLOWDOWN_HEADWAY) {
      final float desiredSpeed = min(1, stopDistance / (globals.SLOWDOWN_HEADWAY)) * globals.SPEED_LIMIT;
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

    if (this.atStop) {
      if (!this.stopTimer.trigger())
        return false;
      else {
        this.atStop = false;
        if (this.nextStopIndex == 1) {
          globals.BUS_PASSENGERS.update(-(55 - (int)random(globals.MIN_BUS_CAPACITY, globals.MAX_BUS_CAPACITY)));
        }
      }

      return false;
    }

    // check if vehicle has approached final destination
    if (abs(this.finalDest.x - this.loc.x) < 5) {
      return true;
    }

    this.speed = this.atStop ? 0 : max(this.getSpeed(), 0);

    // check if vehicle has approached current destination
    if (this.currentDest.x < this.loc.x || abs(this.currentDest.x - this.loc.x) < globals.CAR_LENGTH/2) {
      this.atStop = true;
      this.nextStopIndex++;
      this.currentDest = new PVector(stops.get(this.nextStopIndex), this.finalDest.y);
      this.stopTimer.setWaitTime();
    }

    PVector stepVect = new PVector(this.vectToDest.x, this.vectToDest.y).setMag(this.speed);
    this.loc.add(stepVect);
    this.vectToDest = PVector.sub(this.currentDest, this.loc);
    return false;
  }
}
