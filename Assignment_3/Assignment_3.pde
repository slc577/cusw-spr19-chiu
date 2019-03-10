MercatorMap mercatorMap;
PImage backgroundImage;
HashMap<String, Station> stations;
boolean showAge;

float minAge;
float maxAge;

void setup() {
  size(1000, 675);
  frameRate(40);

  mercatorMap = new MercatorMap(width, height, MAP_TOP, MAP_BOTTOM, MAP_LEFT, MAP_RIGHT, 0);
  backgroundImage = loadBackground(darkBostonImg);
  showAge = true;

  Table stationsTable = loadTable(bikeStationsCSV);
  stations = loadStations(stationsTable);

  Table tripsTable = loadTable(bikeTripsCSV);
  parseTrips(tripsTable);

  calculateMetrics();
  setAgeColors();
  setGenderColors();
  setRadiusToNumTrips();
}

void draw() {
  image(backgroundImage, 0, 0);

  for (Station s : stations.values()) {
    s.draw(showAge);
  }

  // display information text
  fill(255);
  textSize(24);
  text("BlueBike Trip Data for 7 Stations", width / 2 - 180, 30);
  if (showAge) {
    textSize(18);
    text("Average User Age (Years)", width / 2 - 100, 70);

    textSize(12);
    text((int)maxAge, width - 70, height - 215);
    text((int)minAge, width - 70, height - 35);
    drawGradient(width - 50, height - 230, 20, 200, MIN_AGE_COLOR, MAX_AGE_COLOR, Y_AXIS);
  }
  else {
    textSize(18);
    text("Gender Ratios of Users (Myster Gender 1 : Mystery Gender 2)", width / 2 - 250, 70);

    textSize(12);
    text("100%", width - 90, height - 215);
    text("0%", width - 70, height - 35);
    drawGradient(width - 50, height - 230, 20, 200, MIN_GENDER_COLOR, MAX_GENDER_COLOR, Y_AXIS);
  }

  textSize(16);
  text("Press any key to switch metrics", 10, height - 20);
}

void drawGradient(int x, int y, float w, float h, color c1, color c2, boolean axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

void keyPressed() {
  showAge = !showAge;
}
