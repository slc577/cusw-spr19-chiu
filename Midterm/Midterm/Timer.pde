class Timer {
  private int waitTime;
  private int previousTime;
  Timer(int waitTime) {
    this.waitTime = waitTime;
    this.previousTime = millis();
  }
  
  boolean trigger() {
    if (millis() - this.previousTime >= this.waitTime) {
      this.previousTime = millis();
      return true;
    }
    return false;
  }
  
  private void setWaitTime(int newWaitTime) {
    this.waitTime = newWaitTime;
  }
}
