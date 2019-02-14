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
  
  for (Person p : people) {
    p.update();
    p.drawPerson();
  }
}

void mousePressed() {
  for (Person p : people) {
    if (p.selectionEvent()) {
      break;
    }
  }
}

void mouseReleased() {
  for (Person p : people) {
    p.locked = false;
  }
}
