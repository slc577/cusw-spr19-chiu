// Represents people in our class

class Person {
  private String name;
  private String year;
  PVector screenLocation;
  
  private boolean locked;
  
  Person(String name, String year) {
    this.name = name;
    this.year = year;
    
    this.screenLocation = new PVector(width/2, height/2);
    this.locked = false;
  }
  
  String getYear() {
    return this.year;
  }
  
  float getX() {
    return this.screenLocation.x;
  }
  
  float getY() {
    return this.screenLocation.y;
  }
  
  boolean hoverEvent() {
    float distX = abs(mouseX - screenLocation.x);
    float distY = abs(mouseY - screenLocation.y);
    return distX*distX + distY*distY <= 30*30;
  }
  
  boolean selectionEvent() {
    this.locked = hoverEvent() && mousePressed;
    return this.locked;
  }
  
  void randomLocation() {
    screenLocation = new PVector(random(0, width), random(0, height));
  }
  
  void update() {
    if (this.locked) {
      screenLocation = new PVector(mouseX, mouseY);
    }
  }
  
  void drawPerson() {
    noStroke();
    
    color fillColor = hoverEvent() ? color(#FFFF00) : color(255);
    
    fill(fillColor);
    circle(screenLocation.x, screenLocation.y, 30);
    
    text(this.name + "\nYear: " + this.year, screenLocation.x+30, screenLocation.y+30);
  }
}
