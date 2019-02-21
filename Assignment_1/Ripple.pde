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
    this.growthRate = 2;
  }

  boolean screenFilled() {
    return this.centerX + this.radius > width * 2.2
      && this.centerX - this.radius < -width * 2.2;
  }

  color getColor() {
    return this.rippleColor;
  }

  void update() {
    this.radius = this.radius + this.growthRate;
  }

  void render() {
    noStroke();
    fill(rippleColor);
    circle(this.centerX, this.centerY, this.radius);
  }
}
