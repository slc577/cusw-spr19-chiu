MercatorMap mercatorMap;
PImage backgroundImage;

ArrayList<POI> busStops;

// constants
float POI_RADIUS = 6;
color POI_COLOR = #4BA3C3;

void setup(){
  size(1000, 675);
  mercatorMap = new MercatorMap(width, height, 42.3883, 42.3354, -71.1210, -71.0069, 0); // Boston
  backgroundImage = loadBackground("data/images/boston_dark.png");

  busStops = new ArrayList<POI>();

  // load JSON data
  JSONArray areaFeatures = loadJSONFeatures("data/gis/boston_unfiltered.json");
  parsePOIData(areaFeatures);
}

void draw(){
  image(backgroundImage, 0, 0);
}
