class Waypoint {
  protected float locX;
  protected float locY;
  protected float radius;
  protected color fillColor;

  Waypoint(float locX, float locY) {
    this.locX = locX;
    this.locY = locY;
    this.radius = 20;
    this.fillColor = color(255);
  }

  Waypoint(float locX, float locY, float radius, color fillColor) {
    this.locX = locX;
    this.locY = locY;
    this.radius = radius;
    this.fillColor = fillColor;
  }

  PVector getLoc() {
    return new PVector(this.locX, this.locY);
  }
  
  float getDistance(PVector point) {
    return PVector.sub(this.getLoc(), point).mag();
  }
  
  void setFillColor(color fillColor) {
    this.fillColor = fillColor;
  }

  void render() {
    fill(this.fillColor);
    noStroke();
    ellipse(this.locX, this.locY, this.radius, this.radius);
  }
}
