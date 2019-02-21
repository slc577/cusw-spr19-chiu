int previousTime;
int ripplePeriod;
int colorRate;

int nextColor;
int backgroundColor;

ArrayList<Ripple> rippleList;

void setup() {
  size(640, 360);
  frameRate(60);
  backgroundColor = 255;
  
  previousTime = 0;
  ripplePeriod = 1000;
  colorRate = 10;
  nextColor = 0;
  
  rippleList = new ArrayList<Ripple>();
}

void draw() {
  background(backgroundColor);
  if (millis() - previousTime > ripplePeriod) {
    previousTime = millis();
    nextColor = (nextColor + colorRate) % 255;
    
    // create another ripple
    Ripple newRipple = new Ripple(mouseX, mouseY, color(nextColor));
    rippleList.add(newRipple);
  }

  // remove ripples that have filled screen
  int removeCount = 0;
  for (Ripple r : rippleList) {
    if (r.screenFilled()) {
      removeCount++;
    }
    else {
      break;
    }
  }

  for (int i = 0; i < removeCount; i++) {
    backgroundColor = rippleList.remove(0).getColor();
  }

  // update remaining ripples
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
