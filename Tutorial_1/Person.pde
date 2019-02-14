// Represents people in our class

class Person {
  private String name;
  private String year;
  PVector screenLocation;
  
  Person(String name, String year) {
    this.name = name;
    this.year = year;
    screenLocation = new PVector(width/2, height/2);
  }
  
  void randomLocation() {
    screenLocation = new PVector(random(0, width), random(0, height));
  }
  
  void drawPerson() {
    noStroke();
    circle(screenLocation.x, screenLocation.y, 30);
    
    text(this.name + "\nYear: " + this.year, screenLocation.x+30, screenLocation.y+30);
  }
}
