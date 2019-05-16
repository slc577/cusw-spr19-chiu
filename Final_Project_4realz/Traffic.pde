class Traffic {
  private final HashMap<Integer, Vehicle> vehicles;

  Traffic() {
    this.vehicles = new HashMap<Integer, Vehicle>();
  }

  Vehicle get(int id) {
    return this.vehicles.get(id);
  }

  void spawn(int vehicleID, boolean whichLane) {
    final float laneY = whichLane ? globals.LANE1_Y : globals.LANE2_Y;
    vehicles.put(vehicleID, new Vehicle(globals.START_X, laneY, globals.SPEED_LIMIT, this));
  }

  void update() {
    ArrayList<Integer> vehiclesToRemove = new ArrayList<Integer>();

    for (int id : vehicles.keySet()) {
      Vehicle vehicle = vehicles.get(id);

      if (vehicle.moveToDest(id)) {
        vehiclesToRemove.add(id);
      }
    }

    for (int id : vehiclesToRemove) {
      vehicles.remove(id);
    }
  }
}
