ArrayList<Person> people;

void setup() {
  size(800,600);
  background(0);
  people = new ArrayList<Person>();
  
  for (int i=0; i < 10; i++) {
    Person p = new Person("Person " + i, str(random(1,5)));
    p.randomLocation();
    people.add(p);
  }
}

void draw() {
  fill(255);
  background(0);
  circle(mouseX, mouseY, 30);
  
  for (Person p : people) {
    p.drawPerson();
  }
}
