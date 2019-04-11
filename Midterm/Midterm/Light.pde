class Light extends Waypoint {
  private boolean isGreen;
  private int timeGreenMs;
  private int timeRedMs;
  private final Timer timer;

  public Light(float locX, float locY) {
    super(locX, locY, 50, GREEN_LIGHT);
    this.isGreen = true;
    this.timeGreenMs = 3000;
    this.timeRedMs = 3000;
    this.timer = new Timer(this.timeGreenMs);
  }
  
  public Light(float locX, float locY, int timeGreenMs, int timeRedMs) {
    super(locX, locY, 50, GREEN_LIGHT);
    this.isGreen = true;
    this.timeGreenMs = timeGreenMs;
    this.timeRedMs = timeRedMs;
    this.timer = new Timer(this.timeGreenMs);
  }

  boolean isGreen() {
    return this.isGreen;
  }
  
  int getGreenCycleMs() {
    return this.timeGreenMs;
  }
  
  void setGreenCycleMs(int timeMs) {
    this.timeGreenMs = timeMs;
  }
  
  int getRedCycleMs() {
    return this.timeRedMs;
  }
  
  void setRedCycleMs(int timeMs) {
    this.timeRedMs = timeMs;
  }
  
  void change() {
    this.isGreen = !this.isGreen;
    this.setFillColor( this.isGreen ? GREEN_LIGHT : RED_LIGHT );
  }
  
  void update() {
    if (this.timer.trigger()) {
      this.change();
      this.timer.setWaitTime( this.isGreen ? this.timeGreenMs : this.timeRedMs );
    }
  }
}
