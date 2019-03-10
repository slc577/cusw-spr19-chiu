class Station extends POI {
  private String name;
  private ArrayList<Trip> trips = new ArrayList<Trip>();

  private float avgAge = -1;
  private color avgAgeColor = 0;
  private float genderRatio = -1;
  private color genderRatioColor = 0;

  Station(String name, float lat, float lon) {
    super(lat, lon, 0, 0);
    this.name = name;
  }

  Station(String name, float lat, float lon, float radius, color c) {
    super(lat, lon, radius, c);
    this.name = name;
  }

  void addTrip(Trip t) {
    trips.add(t);
  }

  int getNumTrips() {
    return trips.size();
  }

  void setAgeColor(color c) {
    this.avgAgeColor = c;
  }

  void setGenderColor(color c) {
    this.genderRatioColor = c;
  }

  void setRadius(float r) {
    this.radius = r;
  }

  void calculateAvgAge() {
    int ageSum = 0;
    for (Trip trip : trips) {
      ageSum += trip.getUserAge();
    }

    this.avgAge = (float)ageSum / (float)trips.size();
  }

  void calculateGenderRatio() {
    int mystery1Sum = 0;
    for (Trip trip : trips) {
      if (trip.getUserGender() == 1) {
        mystery1Sum++;
      }
    }

    println(this.name, mystery1Sum, trips.size() - mystery1Sum);
    this.genderRatio = (float)mystery1Sum / (float)trips.size();
  }

  float getAvgAge() {
    return this.avgAge;
  }

  float getGenderRatio() {
    return this.genderRatio;
  }

  void draw(boolean showAge) {
    this.fillColor = showAge ? this.avgAgeColor : this.genderRatioColor;
    if (trips.size() > 0) {
      super.draw();
    }
  }
}
