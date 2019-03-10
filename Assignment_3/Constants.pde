// file names
final String bikeStationsCSV = "data/Hubway_Stations_as_of_July_2017.csv";
final String bikeTripsCSV = "data/201902-bluebikes-tripdata.csv";
final String darkBostonImg = "data/boston_dark.png";

// bounding box for Boston image
final float MAP_TOP = 42.3883;
final float MAP_BOTTOM = 42.3354;
final float MAP_LEFT = -71.1210;
final float MAP_RIGHT = -71.0069;

// peak hour
final int MORNING_PEAK_START = 6;
final int MORNING_PEAK_END = 10;

// bike station csv column indices
final int STATION_NAME = 1;
final int STATION_LAT = 2;
final int STATION_LON = 3;

// bike station ids
final int AIRPORT_ID = 214;
final int COPLEY_ID = 36;
final int KENDALL_ID = 189;
final int LECHMERE_ID = 90;
final int SOUTH_STATION_ID = 22;

// bike trip csv column indices
final int TRIP_DURATION = 0;
final int START_TIME = 1;
final int STOP_TIME = 2;
final int START_STATION_ID = 3;
final int START_STATION_NAME = 4;
final int START_STATION_LAT = 5;
final int START_STATION_LON = 6;
final int END_STATION_ID = 7;
final int END_STATION_NAME = 8;
final int END_STATION_LAT = 9;
final int END_STATION_LON = 10;
final int BIKE_ID = 11;
final int USER_TYPE = 12;
final int BIRTH_YEAR = 13;
final int GENDER = 14;
