Globals globals = new Globals();
int VEHICLE_ID = 0;

void setup() {
  size(1250, 650);
  frameRate(60);
  rectMode(CENTER);

  // initialize bus stops
  float distanceBetweenStops = (globals.HARVARD_X - globals.MIT_X) / (globals.NUM_BUS_STOPS_BETWEEN + 1);
  for (int i = 0; i < globals.NUM_BUS_STOPS_BETWEEN+3; i++) {
    globals.BUS_STOPS.add(globals.MIT_X + i * distanceBetweenStops);
  }
  
  globals.RIDESHARE_TIMERS.add(new Timer(globals.MIN_RIDESHARE_SPAWN_TIME_MS, globals.MAX_RIDESHARE_SPAWN_TIME_MS));

  //globals.TRAFFIC_BUS.vehicles.put(-1, new Vehicle(globals.MIT_X+20, globals.LANE1_Y, 0, globals.TRAFFIC_BUS));
  //globals.TRAFFIC_BUS.vehicles.put(-2, new Vehicle(globals.MIT_X+20, globals.LANE2_Y, 0, globals.TRAFFIC_BUS));
  //globals.TRAFFIC.vehicles.put(-2, new Vehicle(globals.WIDTH / 2 + globals.CAR_LENGTH * 4, globals.LANE2_Y, 0));
  //globals.TRAFFIC.vehicles.put(-3, new Vehicle(globals.WIDTH / 2 + globals.CAR_LENGTH * 8, globals.LANE1_Y, 0));
  //globals.TRAFFIC_BUS.vehicles.put(1000, new Bus(0, globals.LANE2_Y, 1, globals.TRAFFIC_BUS));
  //globals.TRAFFIC_BUS.vehicles.put(1, new Vehicle(0, globals.LANE1_Y, 1, globals.TRAFFIC_BUS));
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

  globals.TRAFFIC_BUS.update();
  globals.TRAFFIC_RIDESHARE.update();

  render(globals.TRAFFIC_BUS, 0, 100);
  render(globals.TRAFFIC_RIDESHARE, 0, 350);

  // draw traffic
  if (globals.TRAFFIC_BUS.vehicles.size() >= globals.MAX_VEHICLES)
    return;

  if (globals.TRAFFIC_RIDESHARE.vehicles.size() >= globals.MAX_VEHICLES)
    return;

  if (globals.VEHICLE_TIMER.trigger()) {
    boolean allClear = true;
    for (Vehicle v : globals.TRAFFIC_BUS.getVehicles()) {
      if (v.loc.x < globals.BUS_LENGTH) {
        allClear = false;
        break;
      }
    }

    for (Vehicle v : globals.TRAFFIC_RIDESHARE.getVehicles()) {
      if (v.loc.x < globals.BUS_LENGTH) {
        allClear = false;
        break;
      }
    }

    if (allClear && globals.BUS_TIMER.trigger()) {
      globals.TRAFFIC_BUS.spawnBus(VEHICLE_ID);
    } else if (allClear && globals.RIDESHARE_TIMERS.size() > 0 && globals.RIDESHARE_TIMERS.get(0).trigger()) {
      globals.TRAFFIC_RIDESHARE.spawnRideshare(VEHICLE_ID, random(1) > .5);
      globals.RIDESHARE_TIMERS.remove(0);
    } else if (allClear) {
      final boolean whichLane = random(1) > .5;
      globals.TRAFFIC_BUS.spawnCar(VEHICLE_ID, whichLane);
      globals.TRAFFIC_RIDESHARE.spawnCar(VEHICLE_ID, whichLane);
    }

    updateId();
  }

  // hide the blemishes
  noStroke();
  fill(globals.BG_COLOR);
  rect(width, 200, 50, 50);
  rect(width, 450, 50, 50);
}

void updateId() {
  VEHICLE_ID = (VEHICLE_ID + 1) % globals.MAX_VEHICLES;
}
