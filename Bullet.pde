class Bullet extends Floater {
  
  Bullet(double x, double y, double direction) {
    corners = 4;
    xCorners = new int[]{1,1,-15,-15};
    yCorners = new int[]{1,-1,-1,1};
    myCenterX = x;
    myCenterY = y;
    myColor = #FFD91A;
    myStroke = #FFD91A;
    myPointDirection = direction;
  }
}
