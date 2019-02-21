int previousTime;
int ripplePeriod;
int colorRate;

int nextColor;

ArrayList<Ripple> rippleList;

void setup() {
  size(640, 360);
  frameRate(60);
  background(255);
  
  previousTime = 0;
  ripplePeriod = 1000;
  colorRate = 10;
  nextColor = 0;
  
  rippleList = new ArrayList<Ripple>();
}

void draw() {
  background(255);

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

  fill(255, 66, 92);
  textSize(16);
  text(String.format("Period: %d ms", ripplePeriod), 10, 20);
  text(String.format("Ripple Count: %d", rippleList.size()), 10, 40);
}

void keyPressed(){
  if(key == CODED)
  {
    if (keyCode == LEFT) {
      ripplePeriod = max(300, ripplePeriod - 50);
    }

    else if(keyCode == RIGHT) {
      ripplePeriod = min(10000, ripplePeriod + 50);
    }
  }
}
