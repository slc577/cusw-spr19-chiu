class Traffic {
  private final HashMap<Integer, Vehicle> vehicles;

  Traffic() {
    this.vehicles = new HashMap<Integer, Vehicle>();
  }

  Vehicle get(int id) {
    return this.vehicles.get(id);
  }

  void spawn() {
    vehicles.put(VEHICLE_ID, new Vehicle(globals.START_X, globals.LANE1_Y, globals.SPEED_LIMIT));
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

  void renderVehicles() {
    for (Vehicle v : vehicles.values()) {
      v.render();
    }
  }
}
