int previousTime;
int ripplePeriod;
int colorRate;

int nextColor;

ArrayList<Ripple> rippleList;

void setup() {
  size(640, 360);
  frameRate(60);
  
  previousTime = 0;
  ripplePeriod = 1000;
  colorRate = 10;
  nextColor = 0;
  
  rippleList = new ArrayList<Ripple>();
}

void draw() {
  if (millis() - previousTime > ripplePeriod) {
    previousTime = millis();
    nextColor = (nextColor + colorRate) % 255;
    
    // create another ripple
    Ripple newRipple = new Ripple(mouseX, mouseY, color(nextColor));
    rippleList.add(newRipple);
  }

  for (Ripple r : rippleList) {
    r.update();
    r.render();
  }
}
