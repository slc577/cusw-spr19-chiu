class Ripple {
  private float centerX;
  private float centerY;
  private float radius;

  private float growthRate;
  private color rippleColor;
  
  Ripple(float x, float y, color rippleColor) {
    this.centerX = x;
    this.centerY = y;
    this.rippleColor = rippleColor;
    
    this.radius = 50;
    this.growthRate = 5;
  }

  void render() {
    noStroke();
    fill(rippleColor);
    circle(this.centerX, this.centerY, this.radius);
  }
}
