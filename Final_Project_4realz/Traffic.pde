class Traffic {
  private final HashMap<Integer, Vehicle> vehicles;
  private float aggregateTripTimeS;
  private int numCarTrips;

  Traffic() {
    this.vehicles = new HashMap<Integer, Vehicle>();
    this.aggregateTripTimeS = 0;
    this.numCarTrips = 0;
  }

  Vehicle get(int id) {
    return this.vehicles.get(id);
  }

  void spawnCar(int vehicleID, boolean whichLane) {
    final float lane = whichLane ? globals.LANE1_Y : globals.LANE2_Y;
    vehicles.put(vehicleID, new Vehicle(globals.START_X, lane, globals.SPEED_LIMIT, this));
  }

  void spawnBus(int vehicleID) {
    vehicles.put(vehicleID, new Bus(globals.START_X, globals.LANE2_Y, globals.SPEED_LIMIT, this, globals.BUS_STOPS));
  }

  void spawnRideshare(int vehicleID) {
    vehicles.put(vehicleID, new Rideshare(globals.START_X, globals.LANE2_Y, globals.SPEED_LIMIT, this, globals.RIDESHARE_STOPS));
  }

  float update() {
    ArrayList<Integer> vehiclesToRemove = new ArrayList<Integer>();

    for (int id : vehicles.keySet()) {
      Vehicle vehicle = vehicles.get(id);

      if (vehicle.moveToDest(id)) {
        if (!(vehicle instanceof Bus || vehicle instanceof Rideshare)) {
          this.aggregateTripTimeS = this.aggregateTripTimeS + (float)vehicle.currentWaitTimeMS()/1000.0;
          this.numCarTrips++;
        }

        vehiclesToRemove.add(id);
      }
    }

    for (int id : vehiclesToRemove) {
      vehicles.remove(id);
    }
    
    return this.aggregateTripTimeS / this.numCarTrips;
  }

  ArrayList<Vehicle> getVehicles() {
    return new ArrayList<Vehicle>(this.vehicles.values());
  }
}
