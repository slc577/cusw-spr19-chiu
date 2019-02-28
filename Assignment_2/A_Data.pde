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
