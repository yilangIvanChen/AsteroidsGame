class Enemy extends Floater {
  protected double rotSpeed, speed;

  public Enemy(double x, double y) {
    isDead = false;
    rotSpeed = 2.3;
    speed = 2.5;
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
    pushMatrix();
    translate(x, y);
    angle = atan2((float)myCenterX, (float)myCenterY);
    angle -= PI/2;
    popMatrix();
    if (myCenterX >= x)
      myCenterX -= Math.cos(angle)*speed;
    if (myCenterX < x)
      myCenterX += Math.cos(angle)*speed;
    if (myCenterY >= y)
      myCenterY += Math.sin(angle)*speed;
    if (myCenterY < y)
      myCenterY -= Math.sin(angle)*speed;
    super.move();
  }

  public void checkCollide(double distance) {
    if (distance < 25)
      isDead = true;
  }

  public boolean checkDead() {
    return isDead;
  }
}
