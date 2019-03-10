class POI {
  protected float lat;
  protected float lon;
  protected float radius;
  protected color fillColor;

  POI(float lat, float lon, float radius, color fillColor) {
    this.lat = lat;
    this.lon = lon;
    this.radius = radius;
    this.fillColor = fillColor;
  }

  void draw() {
    PVector screenLocation = mercatorMap.getScreenLocation(new PVector(this.lat, this.lon));
    fill(this.fillColor);
    noStroke();
    ellipse(screenLocation.x, screenLocation.y, this.radius, this.radius);
  }
}
