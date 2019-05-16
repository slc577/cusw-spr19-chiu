public class Globals {
  // agent rendering constants
  final float WIDTH = 1250;
  final float HEIGHT = 600;
  final color BG_COLOR = color(200);
  final color CAR_COLOR = color(255, 0, 0);

  // car constants
  final float CAR_WIDTH = 10;
  final float CAR_LENGTH = 15;

  // road variables
  final float START_X = 30;
  final float END_X = WIDTH - 30;
  final float LANE1_Y = 100;

  // movement constants
  final float SPEED_LIMIT = 10;
  final float MIN_HEADWAY = CAR_LENGTH * 0.25;
  final float SLOWDOWN_HEADWAY = CAR_LENGTH * 10;

  final HashMap<Integer, Vehicle> VEHICLES = new HashMap<Integer, Vehicle>();
  final int MAX_VEHICLES = 10000;
  final Timer TIMER = new Timer(500, 1000);
  final float MIN_SPAWN_TIME_MS = 300;
}
