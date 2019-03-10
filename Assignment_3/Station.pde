class Station extends POI {
  private String name;
  private ArrayList<Trip> trips;

  Station(String name, float lat, float lon) {
    super(lat, lon, 0, 0);
    this.name = name;
    this.trips = new ArrayList<Trip>();
  }

  Station(String name, float lat, float lon, float radius, color c) {
    super(lat, lon, radius, c);
    this.name = name;
    this.trips = new ArrayList<Trip>();
  }

  void addTrip(Trip t) {
    trips.add(t);
  }
  
  int getNumTrips() {
    return trips.size();
  }

  void setColor(color c) {
    this.fillColor = c;
  }

  void setRadius(float r) {
    this.radius = r;
  }
  
  void draw() {
    if (trips.size() > 0) {
      super.draw();
    }
  }
}
