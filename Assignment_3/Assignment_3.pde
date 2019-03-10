MercatorMap mercatorMap;
PImage backgroundImage;
ArrayList<Station> stations;

void setup() {
  size(1000, 675);
  frameRate(40);

  mercatorMap = new MercatorMap(width, height, MAP_TOP, MAP_BOTTOM, MAP_LEFT, MAP_RIGHT, 0);
  backgroundImage = loadBackground(darkBostonImg);

  Table stationsTable = loadTable(bikeStationsCSV);
  stations = loadStations(stationsTable);
  println(stations.size());
}

void draw() {
  image(backgroundImage, 0, 0);

  for (Station s : stations) {
    s.draw();
  }
}
