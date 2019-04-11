class Traffic {
  private final HashMap<Integer, Vehicle> vehicles;
  private Route road;
  private Light[] lights;
  private Timer carTimer;
  private final float speedLimit;
  private final float timerMaxMs;
  private int carCount;
  
  Traffic(float[] ROAD_X, float[] ROAD_Y, Light[] lights, float speedLimit, float timerMaxMs) {
    this.vehicles = new HashMap<Integer, Vehicle>();
    this.road = new Route(ROAD_X, ROAD_Y);
    this.lights = lights;
    
    this.speedLimit = speedLimit;
    this.timerMaxMs = timerMaxMs;
    this.carTimer = new Timer(0);
    this.carCount = 0;
  }
  
  Vehicle get(int id) {
    return this.vehicles.get(id);
  }
  
  void update(boolean reverse) {
    if (this.carTimer.trigger()) {
      this.vehicles.put(this.carCount, new Vehicle(this.carCount, this.road, this.lights, CAR_WIDTH, CAR_HEIGHT, CAR_COLOR));
      
      if (this.vehicles.containsKey(this.carCount - 1)) {
        this.vehicles.get(this.carCount).setIdAhead(this.carCount - 1);
        this.vehicles.get(this.carCount - 1).setIdBehind(this.carCount);
      }
      
      this.carCount++;
      this.carTimer.setWaitTime( (int)random(MIN_SPAWN_TIME_MS, this.timerMaxMs) );
    }
    
    int removeCarId = -1; // once IDs overflow, this will be quite the bug
    int removeCarIdBehind = -1; // see above
    for (Vehicle vehicle : this.vehicles.values()) {
      // calculate distance to nearest obstacle
      
      final int idAhead = vehicle.getIdAhead();
      final float velocity = this.vehicles.containsKey(idAhead)
        ? vehicle.getVelocity(this.speedLimit, reverse,this.vehicles.get(idAhead))
        : vehicle.getVelocity(this.speedLimit, reverse);
      
      if (vehicle.moveToDest(velocity, reverse)) {
        removeCarId = vehicle.getId();
        removeCarIdBehind = vehicle.getIdBehind();
      }
    }
    
    // remove car
    if (this.vehicles.containsKey(removeCarIdBehind)) {
      this.vehicles.get( removeCarIdBehind ).setIdAhead( -1 );
    }
    
    this.vehicles.remove(removeCarId);
  }
  
  void renderRoads() {
    this.road.render();
  }
  
  void renderVehicles() {
    for (Vehicle vehicle : this.vehicles.values()) {
      vehicle.render();
    }
  }
}
