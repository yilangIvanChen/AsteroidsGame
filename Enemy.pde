class Enemy extends Floater {
  private double rotSpeed, speed;

  public Enemy(double x, double y) {
    rotSpeed = 2.3;
    speed = 1.7;
    corners = 8;
    xCorners = new int[]{18, 9, 14, 0, -18, -9, -14, 0};
    yCorners = new int[]{14, 0, -18, -9, -14, 0, 18, 9};
    myCenterX = x;
    myCenterY = y;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    myColor = #EA2626;
    myStroke = #BC1E29;
  }

  public void move(float x, float y) {
    float angle;
    turn(rotSpeed);
    angle = atan((float)((myCenterY-y)/(myCenterX-x)));
    if (myCenterX >= x)
      myCenterX -= Math.cos(angle)*speed;
    if (myCenterX < x)
      myCenterX += Math.cos(angle)*speed;
    if (myCenterY >= y)
      myCenterY -= Math.sin(angle)*1.7;
    if (myCenterY < y)
      myCenterY += Math.sin(angle)*1.7;
    super.move();
  }
}

