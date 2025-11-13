class Enemy extends Floater {
  Enemy(double x, double y) {
    corners = 3;
    xCorners = new int[]{-4, -4, 4};
    yCorners = new int[]{-4, 4, 0};
    myCenterX = x;
    myCenterY = y;
  }
}
