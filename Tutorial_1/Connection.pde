class Connection {
  private Person origin;
  private Person destination;
  private String type;
  
  Connection(Person origin, Person destination, String type) {
    this.origin = origin;
    this.destination = destination;
    this.type = type;
  }
  
  void drawConnection() {
    strokeWeight(5);
    stroke(122, 200);
    line(origin.getX(), origin.getY(), destination.getX(), destination.getY());
    
    text(type, (origin.getX() + destination.getX()) / 2, (origin.getY() + destination.getY()) / 2);
  }
}
