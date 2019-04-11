Traffic trafficTop;
Traffic trafficBot;
Traffic trafficMid;

Light lightTop;
Light lightBot;

// agent rendering constants
final float WIDTH = 1100;
final float HEIGHT = 700;
final color BG_COLOR = color(200);
final color CAR_COLOR = color(255, 0, 0);
final color ROAD_COLOR = color(0);
final float ROAD_WIDTH = 15;
final color GREEN_LIGHT = color(66, 244, 140, 200);
final color RED_LIGHT = color(244, 92, 65, 200);

// road variables
final float[] JUNCTION_X_TOP = {30, WIDTH - 30};
final float[] JUNCTION_Y_TOP = {HEIGHT / 3, HEIGHT / 3};

final float[] JUNCTION_X_BOT = {WIDTH - 30, 30};
final float[] JUNCTION_Y_BOT = {HEIGHT * 2 / 3, HEIGHT * 2 / 3};

final float[] JUNCTION_X_MID = {WIDTH / 2, WIDTH / 2};
final float[] JUNCTION_Y_MID = {30, HEIGHT - 30};

// car constants
final float CAR_WIDTH = 10;
final float CAR_HEIGHT = 25;

// movement constants
final float SPEED_LIMIT_TOP = 10;
final float SPEED_LIMIT_BOT = 15;
final float SPEED_LIMIT_MID = 5;

final float ARRIVAL_RADIUS = 10;
final float MIN_HEADWAY = CAR_HEIGHT * 1.25;
final float TARGET_HEADWAY = CAR_HEIGHT * 4;
final float MIN_SPAWN_TIME_MS = 300;

// UI variables
boolean pause = false;
boolean selectLightTop = false;
boolean selectLightBot = false;
boolean selectGreen = true;
