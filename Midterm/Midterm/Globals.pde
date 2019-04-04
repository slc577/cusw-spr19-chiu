ArrayList<Vehicle> traffic;
ArrayList<Light> lights;
Vehicle car;
Route road;
Timer carTimer;

// graphics constants
final color BG_COLOR = color(200);
final color CAR_COLOR = color(255, 0, 0);
final color ROAD_COLOR = color(0);
final float ROAD_WIDTH = 30;
final color GREEN_LIGHT = color(66, 244, 140, 200);
final color RED_LIGHT = color(244, 92, 65, 200);

// road variables
final float[] JUNCTION_X = {200, 200, 900, 900, 500, 500};
final float[] JUNCTION_Y = {-30, 150, 150, 400, 400, 730};

float ARRIVAL_RADIUS = 10;
float SPEED_LIMIT = 10;

// traffic light variables
final float[] LIGHT_X = {450, 500};
final float[] LIGHT_Y = {150, 400};

// car constants
final float CAR_WIDTH = 20;
final float CAR_HEIGHT = 50;
