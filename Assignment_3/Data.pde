PImage loadBackground(String imageFileName) {
  /* Load and resize background image */
  PImage background = loadImage(imageFileName);
  background.resize(width, height);

  return background;
}

HashMap<String, Station> loadStations(Table stationsTable) {
  HashMap<String, Station> stationsMap = new HashMap<String, Station>();
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
    stationsMap.put(stationName, new Station(stationName, stationLat, stationLon, 5, #B1E5F2));
  }
  return stationsMap;
}

void parseTrips(Table tripTable) {
  for (int rowCount = 1; rowCount < tripTable.getRowCount(); rowCount++) {
    TableRow row = tripTable.getRow(rowCount);

    // only consider data for selected stations
    int endStationId = row.getInt(END_STATION_ID);
    if (endStationId != AIRPORT_ID && endStationId != BU_CENTRAL_ID && endStationId != CENTRAL_SQ_ID && endStationId != COPLEY_ID && endStationId != KENDALL_ID && endStationId != LECHMERE_ID && endStationId != SOUTH_STATION_ID) {
      continue;
    }

    Time startTime = new Time(row.getString(START_TIME));
    if (startTime.hour > MORNING_PEAK_END) {
      continue; // this trip cannot end before peak hour ends
    }

    Time endTime = new Time(row.getString(STOP_TIME));
    if (endTime.hour < MORNING_PEAK_START) {
      continue;
    }

    String stationName = row.getString(END_STATION_NAME);
    if (!stations.containsKey(stationName)) {
      continue;
    }

    Trip t = new Trip(endTime.year - row.getInt(BIRTH_YEAR), row.getInt(GENDER) );
    stations.get(stationName).addTrip(t);
  }
}

void calculateMetrics() {
  for (Station s : stations.values()) {
    // skip stations without trips
    if (s.getNumTrips() == 0) {
      continue;
    }

    s.calculateAvgAge();
    s.calculateGenderRatio();
  }
}

void setAgeColors() {
  float minAvgAge = (float)Integer.MAX_VALUE;
  float maxAvgAge = -1;
  for (Station s : stations.values()) {
    // skip stations without trips
    if (s.getNumTrips() == 0) {
      continue;
    }

    float avgAge = s.getAvgAge();
    if (avgAge < minAvgAge) {
      minAvgAge = avgAge;
    }

    if (avgAge > maxAvgAge) {
      maxAvgAge = avgAge;
    }
  }
  assert minAvgAge <= maxAvgAge;
  minAge = minAvgAge;
  maxAge = maxAvgAge;

  for (Station s : stations.values()) {
    // skip stations without trips
    if (s.getNumTrips() == 0) {
      continue;
    }

    float inter = (s.getAvgAge() - minAvgAge) / (maxAvgAge - minAvgAge);
    s.setAgeColor(lerpColor(MIN_AGE_COLOR, MAX_AGE_COLOR, 1-inter));
  }

  println(minAvgAge, maxAvgAge);
}

void setGenderColors() {
  for (Station s : stations.values()) {
    // skip stations without trips
    if (s.getNumTrips() == 0) {
      continue;
    }
    s.setGenderColor(lerpColor(MIN_GENDER_COLOR, MAX_GENDER_COLOR, 1-s.getGenderRatio()));
  }
}

void setRadiusToNumTrips() {
  // get min and max number of trips
  int minTrips = Integer.MAX_VALUE;
  int maxTrips = -1;
  for (Station s : stations.values()) {
    int numTrips = s.getNumTrips();
    // skip stations without trips
    if (numTrips == 0) {
      continue;
    }

    if (numTrips < minTrips) {
      minTrips = numTrips;
    }

    if (numTrips > maxTrips) {
      maxTrips = numTrips;
    }
  }
  assert minTrips <= maxTrips;

  for (Station s : stations.values()) {
    int numTrips = s.getNumTrips();
    // skip stations without trips
    if (numTrips == 0) {
      continue;
    }

    float newRadius = (float)(numTrips - minTrips) / (float)(maxTrips - minTrips) * (float)(MAX_RADIUS - MIN_RADIUS) + (float)MIN_RADIUS;
    s.setRadius(newRadius);
  }
}
