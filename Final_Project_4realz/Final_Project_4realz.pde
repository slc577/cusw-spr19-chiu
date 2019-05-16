Globals globals = new Globals();
int VEHICLE_ID = 0;

void setup() {
  size(1250, 600);
  frameRate(60);
  rectMode(CENTER);
}

void draw() {
  background(globals.BG_COLOR);

  if (globals.VEHICLES.size() < globals.MAX_VEHICLES && globals.TIMER.trigger()) {
    globals.VEHICLES.put(VEHICLE_ID, new Vehicle(globals.START_TOP, globals.END_TOP));
    VEHICLE_ID = (VEHICLE_ID + 1) % globals.MAX_VEHICLES;
  }

  ArrayList<Integer> vehiclesToRemove = new ArrayList<Integer>();

  for (int id : globals.VEHICLES.keySet()) {
    Vehicle vehicle = globals.VEHICLES.get(id);

    if (vehicle.moveToDest()) {
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
