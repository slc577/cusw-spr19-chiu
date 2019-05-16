Globals globals = new Globals();
int VEHICLE_ID = 0;

void setup() {
  size(1250, 650);
  frameRate(60);
  rectMode(CENTER);

  globals.TRAFFIC_BUS.vehicles.put(-1, new Vehicle(globals.WIDTH / 2, globals.LANE1_Y, 0, globals.TRAFFIC_BUS));
  //globals.TRAFFIC.vehicles.put(-2, new Vehicle(globals.WIDTH / 2 + globals.CAR_LENGTH * 4, globals.LANE2_Y, 0));
  //globals.TRAFFIC.vehicles.put(-3, new Vehicle(globals.WIDTH / 2 + globals.CAR_LENGTH * 8, globals.LANE1_Y, 0));
  globals.TRAFFIC_BUS.vehicles.put(1, new Bus(0, globals.LANE1_Y, globals.SPEED_LIMIT, globals.TRAFFIC_BUS));
}

void draw() {
  background(globals.BG_COLOR);

  // draw roads
  noStroke();
  fill(0);
  rect(width/2, 100, width, globals.VEHICLE_WIDTH * 4);
  rect(width/2, 150, width, globals.VEHICLE_WIDTH * 4);
  rect(width/2, 350, width, globals.VEHICLE_WIDTH * 4);
  rect(width/2, 400, width, globals.VEHICLE_WIDTH * 4);

  // draw traffic
  //if (globals.TRAFFIC_BUS.vehicles.size() < globals.MAX_VEHICLES) {
  //  if (globals.VEHICLE_TIMER.trigger(globals.MIN_VEHICLE_SPAWN_TIME_MS)) {
  //    // if bus timer triggers: spawn bus
  //    // else if rideshare timer triggers: spawn rideshare

  //    final boolean whichLane = random(1) > .5;
  //    globals.TRAFFIC_BUS.spawn(VEHICLE_ID, whichLane);
  //    globals.TRAFFIC_RIDESHARE.spawn(VEHICLE_ID, whichLane);
  //    updateId();
  //  }
  //}

  globals.TRAFFIC_BUS.update();
  globals.TRAFFIC_RIDESHARE.update();

  render(globals.TRAFFIC_BUS, 0, 100);
  render(globals.TRAFFIC_RIDESHARE, 0, 350);
}

void updateId() {
  VEHICLE_ID = (VEHICLE_ID + 1) % globals.MAX_VEHICLES;
}
