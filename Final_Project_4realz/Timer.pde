class Timer {
  private int waitTime;
  private final int maxWaitTime;
  private int previousTime;

  Timer(int waitTime, int maxWaitTime) {
    this.waitTime = waitTime;
    this.maxWaitTime = maxWaitTime;
    this.previousTime = millis();
  }

  boolean trigger(float minSpawnTimeMs) {
    if (millis() - this.previousTime >= this.waitTime) {
      this.previousTime = millis();
      this.setWaitTime( (int)random(minSpawnTimeMs, this.maxWaitTime) );
      return true;
    }
    return false;
  }

  private void setWaitTime(int newWaitTime) {
    this.waitTime = newWaitTime;
  }
}
