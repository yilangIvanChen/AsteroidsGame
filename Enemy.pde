class Enemy extends Floater {
  private double rotSpeed;

  public Enemy(double x, double y) {
    rotSpeed = 1.4;
    corners = 8;
    xCorners = new int[]{18, 9, 14, 0, -18, -9, -14, 0};
    yCorners = new int[]{14, 0, -18, -9, -14, 0, 18, 9};
    myCenterX = x;
    myCenterY = y;
    myXspeed = .8;
    myYspeed = .8;
    myColor = #EA2626;
    myStroke = #BC1E29;
  }

  public void move() {
    turn(rotSpeed);
    super.move();
  }
}
