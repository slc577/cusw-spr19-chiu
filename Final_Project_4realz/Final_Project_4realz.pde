Globals globals = new Globals();
int VEHICLE_ID = 0;

void setup() {
  size(1250, 600);
  frameRate(60);
  rectMode(CENTER);

  // globals.TRAFFIC.vehicles.put(-1, new Vehicle(globals.WIDTH / 2, globals.LANE1_Y, 0));
  // globals.TRAFFIC.vehicles.put(1, new Vehicle(0, globals.LANE1_Y, 0));
}

void draw() {
  background(globals.BG_COLOR);

  // draw roads
  noStroke();
  fill(0);
  rect(width/2, 100, width, globals.CAR_WIDTH * 4);
  rect(width/2, 150, width, globals.CAR_WIDTH * 4);

  // draw traffic
  if (globals.TRAFFIC.vehicles.size() < globals.MAX_VEHICLES && globals.CAR_TIMER.trigger()) {
    globals.TRAFFIC.spawn(VEHICLE_ID);
    updateId();
  }

  globals.TRAFFIC.update();
  render(globals.TRAFFIC, 0, 100);
}

void updateId() {
  VEHICLE_ID = (VEHICLE_ID + 1) % globals.MAX_VEHICLES;
}
