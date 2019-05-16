Globals globals = new Globals();
int VEHICLE_ID = 0;

void setup() {
  size(1250, 600);
  frameRate(60);
  rectMode(CENTER);

  globals.VEHICLES.put(-1, new Vehicle(width/2, globals.LANE1_Y, 0));
}

void draw() {
  background(globals.BG_COLOR);

  if (globals.VEHICLES.size() < globals.MAX_VEHICLES && globals.TIMER.trigger()) {
    globals.VEHICLES.put(VEHICLE_ID, new Vehicle(globals.START_X, globals.LANE1_Y, globals.SPEED_LIMIT));
    VEHICLE_ID = (VEHICLE_ID + 1) % globals.MAX_VEHICLES;
  }

  ArrayList<Integer> vehiclesToRemove = new ArrayList<Integer>();

  for (int id : globals.VEHICLES.keySet()) {
    Vehicle vehicle = globals.VEHICLES.get(id);

    if (vehicle.moveToDest(id)) {
      vehiclesToRemove.add(id);
    }
  }

  for (int id : vehiclesToRemove) {
    globals.VEHICLES.remove(id);
  }

  for (Vehicle v : globals.VEHICLES.values()) {
    v.render();
  }
}
