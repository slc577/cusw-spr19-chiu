PImage loadBackground(String imageFileName) {
  /* Load and resize background image */
  PImage background = loadImage(imageFileName);
  background.resize(width, height);

  return background;
}

JSONArray loadJSONFeatures(String jsonFilename) {
  JSONObject areaJSONData = loadJSONObject(jsonFilename);
  JSONArray areaJSONFeatures = areaJSONData.getJSONArray("features");

  return areaJSONFeatures;
}

void parsePOIData(JSONArray areaFeatures) {
  for (int i = 0; i < areaFeatures.size(); i++) {
    JSONObject feature = areaFeatures.getJSONObject(i);
    JSONObject geometry = feature.getJSONObject("geometry");
    String geometryType = geometry.getString("type");

    // not using polygons today. sorry lil buddies
    if (geometryType.equals("Polygon")) {
      continue;
    }

    JSONObject properties = feature.getJSONObject("properties");

    // collect bus stop POIs
    if (geometryType.equals("Point") && "bus_stop".equals(properties.getString("highway"))) {
      float lat = geometry.getJSONArray("coordinates").getFloat(1);
      float lon = geometry.getJSONArray("coordinates").getFloat(0);
      POI poi = new POI(lat, lon, POI_RADIUS, POI_COLOR);
      busStops.add(poi);
      continue;
    }

    // here we know the feature is a way
    boolean isBusRoute = "bus".equals(properties.getString("route"));
    boolean isBadRoad = properties.getString("highway") != null && BAD_CONDITIONS.contains(properties.getString("condition"));

    // skip if way is neither bus route nor bad road
    if ( !(isBusRoute || isBadRoad) ) {
      continue;
    }

    // collect linestrings to create ways
    if (geometryType.equals("LineString")) {
      ArrayList<PVector> coords = new ArrayList<PVector>();
      JSONArray coordinates = geometry.getJSONArray("coordinates");
      for (int j = 0; j < coordinates.size(); j++) {
        float lat = coordinates.getJSONArray(j).getFloat(1);
        float lon = coordinates.getJSONArray(j).getFloat(0);

        coords.add(new PVector(lat, lon));
      }

      //Create the Way with the coordinate PVectors
      if (isBusRoute) {
        Way way = new Way(coords, BUS_ROUTE_COLOR, BUS_ROUTE_WEIGHT);
        busRoutes.add(way);
      }
      else {
        Way way = new Way(coords, ROAD_COLOR, ROAD_WEIGHT);
        badRoads.add(way);
      }
    }

    // collect multilinestrings to create ways
    else if (geometryType.equals("MultiLineString")) {
      JSONArray linestrings = geometry.getJSONArray("coordinates");

      for (int j = 0; j < linestrings.size(); j++) {
        ArrayList<PVector> coords = new ArrayList<PVector>();

        JSONArray coordinates = linestrings.getJSONArray(j);
        for (int k = 0; k < coordinates.size(); k++) {
          float lat = coordinates.getJSONArray(k).getFloat(1);
          float lon = coordinates.getJSONArray(k).getFloat(0);

          coords.add(new PVector(lat, lon));
        }

        if (isBusRoute) {
        Way way = new Way(coords, BUS_ROUTE_COLOR, BUS_ROUTE_WEIGHT);
        busRoutes.add(way);
        }
        else {
          Way way = new Way(coords, ROAD_COLOR, ROAD_WEIGHT);
          badRoads.add(way);
        }
      }
    }
  }
}
