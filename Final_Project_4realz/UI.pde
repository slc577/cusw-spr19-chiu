void render(Traffic traffic, float offsetX, float offsetY) {
  for (Vehicle vehicle : traffic.vehicles.values()) {
    final float locX = vehicle.loc.x;
    final int row = (int)(locX / globals.WIDTH);
    final float newX = (row % 2 == 0) ? locX : globals.WIDTH - locX % globals.WIDTH;
    final float newY = row * 100 + (row % 2 == 0 ? 1 : -1) * vehicle.loc.y;
    vehicle.render(newX + offsetX, newY + offsetY);
  }
}
