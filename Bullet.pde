class Bullet extends Floater {
  
  Bullet(double x, double y) {
    corners = 4;
    xCorners = new int[]{1,1,-7,-7};
    yCorners = new int[]{1,-1,-1,1};
    myCenterX = x;
    myCenterY = y;
  }
}
