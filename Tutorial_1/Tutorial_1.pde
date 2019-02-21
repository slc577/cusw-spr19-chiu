ArrayList<Person> people;
ArrayList<Connection> connections;

void setup() {
  size(800,600);
  background(0);
  
  initialize();
}

void draw() {
  fill(255);
  background(0);
  
  for (Connection c : connections) {
    c.drawConnection();
  }
  
  for (Person p : people) {
    p.update();
    p.drawPerson();
  }
}

void keyPressed() {
  initialize();
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

void initialize() {
  people = new ArrayList<Person>();
  connections = new ArrayList<Connection>();
  
  for (int i=0; i < 10; i++) {
    Person p = new Person("Person " + i, str(int(random(1,5))));
    p.randomLocation();
    people.add(p);
  }
  
  for (int i = 0; i < people.size()-1; i++) {
    Person p1 = people.get(i);
    for (int j = i+1; j < people.size(); j++) {
      Person p2 = people.get(j);
      
      if (!p1.getYear().equals(p2.getYear())) {
        continue;
      }
      
      Connection c = new Connection(p1, p2, "frands");
      connections.add(c);
    }
  }
}
