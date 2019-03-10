class Station extends POI {
  private String name;

  Station(String name, float lat, float lon) {
    super(lat, lon, 0, 0);
    this.name = name;
  }

  Station(String name, float lat, float lon, float radius, color c) {
    super(lat, lon, radius, c);
    this.name = name;
  }

  void setColor(color c) {
    this.fillColor = c;
  }

  void setRadius(float r) {
    this.radius = r;
  }
}
