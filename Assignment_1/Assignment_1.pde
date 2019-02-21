int previousTime;
int ripplePeriod;

ArrayList<Ripple> rippleList;

void setup() {
  size(640, 360);
  frameRate(60);
  
  previousTime = 0;
  ripplePeriod = 1000;
  
  rippleList = new ArrayList<Ripple>();
}

void draw() {
  if (millis() - previousTime > ripplePeriod) {
    previousTime = millis();
    
    // create another ripple
  }
}
