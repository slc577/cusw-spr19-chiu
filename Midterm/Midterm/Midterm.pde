void setup() {
  //fullScreen();
  size(1100, 700);
  frameRate(60);
  rectMode(CENTER);
  
  init();
}

void draw() {
  background(BG_COLOR);
  
  // draw road
  road.render();
  
  if (carTimer.trigger()) {
    traffic.add(new Vehicle(traffic.size(), road, lights, CAR_WIDTH, CAR_HEIGHT, CAR_COLOR));
    
    carTimer.setWaitTime( (int)random(300, 500) );
  }
  
  for (Vehicle v : traffic) {
    v.moveToDest();
    v.render();
  }
  
  for (Light l : lights) {
    l.render();
  }
  
  text(frameRate, 25, 25);
}

void init() {
  carTimer = new Timer(500);
  traffic = new ArrayList<Vehicle>();
  
  road = new Route(JUNCTION_X, JUNCTION_Y);
  lights = new ArrayList<Light>();
  lights.add(new Light(450, 150));
  lights.add(new Light(500, 400));
}
