class EnemyFast extends Enemy {
  public EnemyFast(double x, double y) {
    health = 15;
    rotSpeed = 6;
    speed = 3;
    corners = 8;
    xCorners = new int[]{18, 9, 14, 0, -18, -9, -14, 0};
    yCorners = new int[]{14, 0, -18, -9, -14, 0, 18, 9};
    myCenterX = x;
    myCenterY = y;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    myColor = #FFE689;
    myStroke = #DBB118;
  }
}
