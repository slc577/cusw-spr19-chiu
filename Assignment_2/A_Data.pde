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
  }
}
