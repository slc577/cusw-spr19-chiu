MercatorMap mercatorMap;
PImage backgroundImage;

void setup(){
  size(1000, 675);
  mercatorMap = new MercatorMap(width, height, 42.3883, 42.3354, -71.1210, -71.0069, 0); // Boston
  backgroundImage = loadBackground("data/images/boston_dark.png");
}

void draw(){
  image(backgroundImage, 0, 0);
}
