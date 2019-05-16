public class Globals {
  // agent rendering constants
  final float WIDTH = 1250;
  final float HEIGHT = 600;
  final color BG_COLOR = color(200);
  final color CAR_COLOR = color(255, 0, 0);

  // car constants
  final float CAR_WIDTH = 10;
  final float CAR_LENGTH = 15;

  // road constants
  final float START_X = 0;
  final float END_X = WIDTH * 2;
  final float LANE1_Y = 0;

  // traffic constants
  final float SPEED_LIMIT = 10;
  final float MIN_HEADWAY = CAR_LENGTH * 0.25;
  final float SLOWDOWN_HEADWAY = CAR_LENGTH * 10;

  // traffic variables
  final Traffic TRAFFIC = new Traffic();

  final int MAX_VEHICLES = 10000;
  final Timer CAR_TIMER = new Timer(500, 1000);
  final float MIN_SPAWN_TIME_MS = 300;
}
