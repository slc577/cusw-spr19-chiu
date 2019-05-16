class Rideshare extends Vehicle {
  Rideshare(float locX, float locY, float speed, Traffic traffic) {
    super(locX, locY, speed, traffic);
    super.fillColor = globals.RIDESHARE_COLOR;
  }
}
