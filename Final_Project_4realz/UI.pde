final Timer DASHBOARD_TIMER = new Timer(1000, 1001);
float BUS_AVG = 0;
float RIDESHARE_AVG = 0;

void render(Traffic traffic, float offsetX, float offsetY) {
  for (Vehicle vehicle : traffic.getVehicles()) {
    final float locX = vehicle.loc.x;
    final int row = (int)(locX / globals.WIDTH);
    final float newX = (row % 2 == 0) ? globals.WIDTH - locX % globals.WIDTH : locX % globals.WIDTH;
    final float newY = row * 50 + (row % 2 == 0 ? -1 : 1) * vehicle.loc.y;
    vehicle.render(newX + offsetX, newY + offsetY);
  }
}

void render(Passengers passengers, float offsetX, float offsetY) {
  final float locX = passengers.loc.x;
  final int row = (int)(locX / globals.WIDTH);
  final float newX = (row % 2 == 0) ? globals.WIDTH - locX % globals.WIDTH : locX % globals.WIDTH;
  final float newY = row * 50 + (row % 2 == 0 ? -1 : 1) * passengers.loc.y;
  passengers.render(newX + offsetX, newY + offsetY);
}

void renderAnalytics() {
  noStroke();
  fill(255);
  textSize(28);
  textAlign(CENTER, CENTER);
  
  text("AVERAGE TRIP TIME FOR PRIVATE CARS", globals.WIDTH / 2, globals.HEIGHT - 100);
  text(String.format("BUSES: %.1f min", BUS_AVG), globals.WIDTH / 3, globals.HEIGHT);
  text(String.format("RIDESHARE: %.1f min", RIDESHARE_AVG), globals.WIDTH * 2 / 3, globals.HEIGHT);
}
