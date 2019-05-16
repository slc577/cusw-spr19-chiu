class Timer {
  private int waitTime;
  private final int maxWaitTime;
  private float minWaitTimeMs;

  Timer(int minWaitTimeMs, int maxWaitTime) {
    this.maxWaitTime = maxWaitTime;
    this.minWaitTimeMs = minWaitTimeMs;
    setWaitTime();
  }

  boolean trigger() {
    if (millis() >= this.waitTime) {
      this.setWaitTime();
      return true;
    }
    return false;
  }

  private void setWaitTime() {
    this.waitTime = millis() + (int)random(this.minWaitTimeMs, this.maxWaitTime);
  }
}
