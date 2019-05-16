class Passengers {
  int numWaitingAtMIT;
  PVector loc;

  Passengers(float locX, float locY) {
    this.numWaitingAtMIT = 5;
    this.loc = new PVector(locX, locY);
    //this.loc = new PVector(20, -20);
  }

  void update(int deltaQuantity) {
    this.numWaitingAtMIT = max(0, this.numWaitingAtMIT + deltaQuantity);

    if (deltaQuantity > 0) {
      final int numCarsNeeded = (int)this.numWaitingAtMIT / 4;
      for (int i = 0; i < numCarsNeeded - globals.RIDESHARE_TIMERS.size(); i++) {
        globals.RIDESHARE_TIMERS.add(new Timer(globals.MIN_RIDESHARE_SPAWN_TIME_MS, globals.MAX_RIDESHARE_SPAWN_TIME_MS));
      }
    }
  }

  void render(float locX, float locY) {
    noStroke();
    fill(0);
    ellipse(locX, locY, 50, 50);

    fill(255);
    textSize(28);
    textAlign(CENTER, CENTER);
    text(this.numWaitingAtMIT, locX, locY);
  }
}
