class Bus extends Vehicle {
  public Bus(float locX, float locY, float speed, Traffic traffic) {
    super(locX, locY, speed, traffic);

    super.vWidth = globals.VEHICLE_WIDTH;
    super.vLength = globals.BUS_LENGTH;
    super.fillColor = globals.BUS_COLOR;
  }
  
  protected boolean canSwitch(float aheadX, float behindX) {
    return false;
  }
}
