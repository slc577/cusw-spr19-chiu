MercatorMap mercatorMap;
PImage backgroundImage;

ArrayList<POI> busStops;
ArrayList<Way> busRoutes;
ArrayList<Way> badRoads;

// constants
float POI_RADIUS = 6;
color POI_COLOR = #4BA3C3;

float BUS_ROUTE_WEIGHT = 1;
color BUS_ROUTE_COLOR = #CCE6F4;

float ROAD_WEIGHT = 4;
color ROAD_COLOR = #F24236;
ArrayList<String> BAD_CONDITIONS;

void setup(){
  size(1000, 675);
  mercatorMap = new MercatorMap(width, height, 42.3883, 42.3354, -71.1210, -71.0069, 0); // Boston
  backgroundImage = loadBackground("data/images/boston_dark.png");

  busStops = new ArrayList<POI>();
  busRoutes = new ArrayList<Way>();
  badRoads = new ArrayList<Way>();

  // establish which road conditions are "bad"
  BAD_CONDITIONS =  new ArrayList<String>();
  BAD_CONDITIONS.add("deficient");
  BAD_CONDITIONS.add("poor");
  BAD_CONDITIONS.add("intolerable");

  // load JSON data
  JSONArray areaFeatures = loadJSONFeatures("data/gis/boston_unfiltered.json");
  parsePOIData(areaFeatures);
}

void draw(){
  image(backgroundImage, 0, 0);
}
