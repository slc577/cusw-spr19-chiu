void setup() {
  //fullScreen();
  size(1100, 700);
  frameRate(60);
  rectMode(CENTER);
  
  init();
}

void draw() {
  background(BG_COLOR);
  
  // draw traffic network
  if (!pause) {
    trafficTop.update(false);
    trafficBot.update(false);
    trafficMid.update(true);
    lightTop.update();
    lightBot.update();
  }
  
  trafficTop.renderRoads();
  trafficBot.renderRoads();
  trafficMid.renderRoads();
  
  trafficTop.renderVehicles();
  trafficBot.renderVehicles();
  trafficMid.renderVehicles();
  
  lightTop.render();
  lightBot.render();
  
  if (selectLightTop) {
    noStroke();
    fill(selectGreen ? color(66, 244, 140) : color(244, 92, 65));
    circle(lightTop.getLoc().x, lightTop.getLoc().y, 50);
    
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    final int cycleTime = selectGreen ? lightTop.getGreenCycleMs() : lightTop.getRedCycleMs();
    text(String.format("%.1f", cycleTime / 1000.0), lightTop.getLoc().x, lightTop.getLoc().y);
  }
  else if (selectLightBot) {
    noStroke();
    fill(selectGreen ? color(66, 244, 140) : color(244, 92, 65));
    circle(lightBot.getLoc().x, lightBot.getLoc().y, 50);
    
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    final int cycleTime = selectGreen ? lightBot.getGreenCycleMs() : lightBot.getRedCycleMs();
    text(String.format("%.1f", cycleTime / 1000.0), lightBot.getLoc().x, lightBot.getLoc().y);
  }
  
  noStroke();
  fill(0);
  textSize(18);
  textAlign(LEFT, BASELINE);
  text("1. Click on the traffic lights to adjust cycle lengths\n" +
    "2. Press <g> or <r> to select green or red cycle\n" +
    "3. Use UP and DOWN arrow keys to change lengths", 20, 30);
}

void init() {
  // initialize traffic lights
  lightTop = new Light(width / 2, height / 3);
  lightBot = new Light(width / 2, height * 2 / 3);
  
  // initialize traffic networks
  trafficTop = new Traffic(JUNCTION_X_TOP, JUNCTION_Y_TOP, new Light[] {lightTop}, SPEED_LIMIT_TOP, 1000);
  trafficBot = new Traffic(JUNCTION_X_BOT, JUNCTION_Y_BOT, new Light[] {lightBot}, SPEED_LIMIT_TOP, 500);
  trafficMid = new Traffic(JUNCTION_X_MID, JUNCTION_Y_MID, new Light[] {lightTop, lightBot}, SPEED_LIMIT_MID, 2000);
}
