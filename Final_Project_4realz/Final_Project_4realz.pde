Globals globals = new Globals();
int VEHICLE_ID = 0;

void setup() {
  size(1250, 600);
  frameRate(60);
  rectMode(CENTER);

  globals.TRAFFIC.vehicles.put(-1, new Vehicle(width/2, globals.LANE1_Y, 0));
}

void draw() {
  background(globals.BG_COLOR);

  if (globals.TRAFFIC.vehicles.size() < globals.MAX_VEHICLES && globals.CAR_TIMER.trigger()) {
    globals.TRAFFIC.spawn();
    updateId();
  }

  globals.TRAFFIC.update();
  globals.TRAFFIC.renderVehicles();
}

void updateId() {
  VEHICLE_ID = (VEHICLE_ID + 1) % globals.MAX_VEHICLES;
}
