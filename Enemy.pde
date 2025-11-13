class Enemy extends Floater {
  Enemy(double x, double y) {
    corners = 8;
    xCorners = new int[]{18, 9, 14, 0, -18, -9, -14, 0};
    yCorners = new int[]{14, 0, -18, -9, -14, 0, 18, 9};
    myCenterX = x;
    myCenterY = y;
    myColor = #EA2626;
    myStroke = #BC1E29;
  }
}
