PImage loadBackground(String imageFileName) {
  /* Load and resize background image */
  PImage background = loadImage(imageFileName);
  background.resize(width, height);

  return background;
}

ArrayList<Station> loadStations(Table stationsTable) {
  ArrayList<Station> stations = new ArrayList<Station>();
  for (int rowCount = 1; rowCount < stationsTable.getRowCount(); rowCount++) {
    TableRow row = stationsTable.getRow(rowCount);

    float stationLat = row.getFloat(STATION_LAT);
    if (stationLat < MAP_BOTTOM || stationLat > MAP_TOP) {
      continue;
    }

    float stationLon = row.getFloat(STATION_LON);
    if (stationLon < MAP_LEFT || stationLon > MAP_RIGHT) {
      continue;
    }

    String stationName = row.getString(STATION_NAME);
    stations.add(new Station(stationName, stationLat, stationLon, 5, #B1E5F2));
  }
  return stations;
}
