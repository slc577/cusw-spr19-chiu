class Ripple {
  private float centerX;
  private float centerY;
  private float radius;
  private float growthRate;
  
  Ripple(float x, float y) {
    this.centerX = x;
    this.centerY = y;
    
    this.radius = 0;
    this.growthRate = 5;
  }
}
