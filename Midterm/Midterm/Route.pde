class Route {
  private ArrayList<Waypoint> waypoints;

  public Route(float[] POINT_X, float[] POINT_Y) {
    this.waypoints = new ArrayList<Waypoint>();
    for (int jnCount = 0; jnCount < POINT_X.length; jnCount++) {
      this.waypoints.add(new Waypoint(POINT_X[jnCount], POINT_Y[jnCount]));
    }
  }

  PVector get(int index) {
    return this.waypoints.get(index).getVector();
  }
  
  int size() {
    return this.waypoints.size();
  }
  
  void render() {
    stroke(ROAD_COLOR);
    strokeWeight(ROAD_WIDTH);
    
    for (int jn = 0; jn < this.waypoints.size() - 1; jn++) {
      PVector startVect = this.get(jn);
      PVector endVect = this.get(jn+1);
      line(startVect.x, startVect.y, endVect.x, endVect.y);
    }
  }
}
