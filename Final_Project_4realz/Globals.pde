public class Globals {
  // agent rendering constants
  final float WIDTH = 1250;
  final float HEIGHT = 600;
  final color BG_COLOR = color(200);
  final color CAR_COLOR = color(255, 0, 0);
  final color BUS_COLOR = color(255);
  final color RIDESHARE_COLOR = color(255, 255, 0);

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
  final float SPEED_LIMIT = 1.5;
  final float ACCELERATION = 0.04;
  final float SWITCH_SPEED = SPEED_LIMIT * 0.7;
  final float MIN_HEADWAY = CAR_LENGTH * 0.25;
  final float SLOWDOWN_HEADWAY = CAR_LENGTH * 1.5;
  final float SWITCH_HEADWAY = CAR_LENGTH*1;

  final Traffic TRAFFIC_BUS = new Traffic();
  final Traffic TRAFFIC_RIDESHARE = new Traffic();
  final int MAX_VEHICLES = 10000;

  // bus stops
  final float MIT_X = 300;
  final float HARVARD_X = END_X - MIT_X;
  final int NUM_BUS_STOPS_BETWEEN = 2;
  final ArrayList<Float> BUS_STOPS = new ArrayList<Float>();

  // timer constants
  final int MIN_VEHICLE_SPAWN_TIME_MS = 150;
  final int MAX_VEHICLE_SPAWN_TIME_MS = 300;
  final Timer VEHICLE_TIMER = new Timer(MIN_VEHICLE_SPAWN_TIME_MS, MAX_VEHICLE_SPAWN_TIME_MS);
  
  final int MIN_BUS_SPAWN_TIME_MS = 10000;
  final int MAX_BUS_SPAWN_TIME_MS = 15000;
  final Timer BUS_TIMER = new Timer(MIN_BUS_SPAWN_TIME_MS, MAX_BUS_SPAWN_TIME_MS);
  final int MIN_BUS_STOP_WAIT_MS = 2000;
  final int MAX_BUS_STOP_WAIT_MS = 3000;
  
  final int MIN_RIDESHARE_SPAWN_TIME_MS = 3000;
  final int MAX_RIDESHARE_SPAWN_TIME_MS = 8000;
  final ArrayList<Timer> RIDESHARE_TIMERS = new ArrayList<Timer>();
  final int MIN_RIDESHARE_WAIT_MS = 700;
  final int MAX_RIDESHARE_WAIT_MS = 1500;
}
