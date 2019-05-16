public class Globals {
  // agent rendering constants
  final float WIDTH = 1250;
  final float HEIGHT = 600;
  final color BG_COLOR = color(200);
  final color CAR_COLOR = color(255, 0, 0);
  final color BUS_COLOR = color(255);

  // car constants
  final float VEHICLE_WIDTH = 10;
  final float CAR_LENGTH = 15;
  final float BUS_LENGTH = 25;

  // road constants
  final float START_X = 0;
  final float END_X = WIDTH * 2;
  final float LANE1_Y = -VEHICLE_WIDTH;
  final float LANE2_Y = VEHICLE_WIDTH;
  final float LANE_WIDTH = VEHICLE_WIDTH * 2;

  // traffic constants
  final float SPEED_LIMIT = 10;
  final float SWITCH_SPEED = SPEED_LIMIT * 2;
  final float MIN_HEADWAY = CAR_LENGTH * 0.25;
  final float SLOWDOWN_HEADWAY = CAR_LENGTH * 2;
  final float SWITCH_HEADWAY = CAR_LENGTH;

  final Traffic TRAFFIC_BUS = new Traffic();
  final Traffic TRAFFIC_RIDESHARE = new Traffic();

  final int MAX_VEHICLES = 10000;
  final Timer VEHICLE_TIMER = new Timer(500, 700);
  final Timer BUS_TIMER = new Timer(10000, 15000);
  
  final float MIN_VEHICLE_SPAWN_TIME_MS = 100;
  final float MIN_BUS_SPAWN_TIME_MS = 10000;
}
