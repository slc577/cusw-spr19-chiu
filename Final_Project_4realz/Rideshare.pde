class Rideshare extends Bus {
  Rideshare(float locX, float locY, float speed, Traffic traffic, ArrayList<Float> stops) {
    super(locX, locY, speed, traffic, stops);
    super.vLength = globals.CAR_LENGTH;
    super.fillColor = globals.RIDESHARE_COLOR;

    super.stopTimer = new Timer(globals.MIN_RIDESHARE_WAIT_MS, globals.MAX_RIDESHARE_WAIT_MS);
  }

  protected float getSpeed() {
    if (this.GASGASGAS)
      return globals.SWITCH_SPEED;

    final float obstacleDistance = getObstacleDistance();

    final float targetX = this.loc.x + globals.LANE_WIDTH * 2;
    final boolean canSwitch = canSwitch(targetX + this.vLength/2, this.loc.x - this.vLength*1.5);
    if ( this.loc.x > stops.get(0) && !sameSign(this.originalLane, this.finalDest.y) && obstacleDistance > globals.SLOWDOWN_HEADWAY*2 && canSwitch) {
      this.updateDest(targetX, this.finalDest.y * -1);
      return globals.SWITCH_SPEED;
    }

    if (obstacleDistance < globals.SLOWDOWN_HEADWAY) {
      final float dist = max(obstacleDistance - globals.MIN_HEADWAY, 0);

      if (this.loc.x > stops.get(0) && obstacleDistance > globals.SWITCH_HEADWAY && canSwitch) {
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

    if (this.atStop) {
      if (!this.stopTimer.trigger())
        return false;
      else {
        this.atStop = false;
        if (this.nextStopIndex == 1) {
          globals.RIDESHARE_PASSENGERS.update(-4);
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
      this.currentDest = new PVector(stops.get(this.nextStopIndex % stops.size()), this.finalDest.y);
      this.stopTimer.setWaitTime();
    }

    PVector stepVect = new PVector(this.vectToDest.x, this.vectToDest.y).setMag(this.speed);
    this.loc.add(stepVect);
    this.vectToDest = PVector.sub(this.currentDest, this.loc);
    return false;
  }
}
