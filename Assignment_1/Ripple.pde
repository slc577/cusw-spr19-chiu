class Ripple {
  private float centerX;
  private float centerY;
  private float radius;
  private float growthRate;
  
  Ripple(float x, float y) {
    this.centerX = x;
    this.centerY = y;
    
    this.radius = 50;
    this.growthRate = 5;
  }

  void render() {
    noStroke();
    fill(244, 66, 92);
    circle(this.centerX, this.centerY, this.radius);
  }
}
