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
  final PVector START_TOP = new PVector(30, 100);
  final PVector START_BOT = new PVector(30, 100+CAR_WIDTH*1.5);

  final PVector END_TOP = new PVector(WIDTH - 30, 100);
  final PVector END_BOT = new PVector(WIDTH - 30, 100+CAR_WIDTH*1.5);

  // movement constants
  final float SPEED_LIMIT = 1.5;

  final float ARRIVAL_RADIUS = 10;
  final float MIN_SPAWN_TIME_MS = 300;

  final HashMap<Integer, Vehicle> VEHICLES = new HashMap<Integer, Vehicle>();
  final int MAX_VEHICLES = 10000;
  final Timer TIMER = new Timer(500, 1000);
}
