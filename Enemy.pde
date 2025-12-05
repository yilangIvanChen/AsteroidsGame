class Enemy extends Floater {
  protected double rotSpeed, speed;

  public Enemy(double x, double y) {
    health = 10;
    isDead = false;
    rotSpeed = 3;
    speed = 1.5;
    corners = 8;
    xCorners = new int[]{18, 9, 14, 0, -18, -9, -14, 0};
    yCorners = new int[]{14, 0, -18, -9, -14, 0, 18, 9};
    myCenterX = x;
    myCenterY = y;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    myColor = #40A7FF;
    myStroke = #0C75CE;
  }

  public Enemy() {
  }

  public void move(Spaceship ship) {
    turn(rotSpeed);
    if (myCenterY < ship.getCenterY())
      myCenterY += speed;
    if (myCenterY > ship.getCenterY())
      myCenterY -= speed;
    if (myCenterX < ship.getCenterX())
      myCenterX += speed;
    if (myCenterX > ship.getCenterX())
      myCenterX -= speed;
    super.move();
  }

  public void dmgTaken() {
    if (health < 6) {
      myColor = #EA2626;
      myStroke = #BC1E29;
      speed = 1.5;
      rotSpeed = 3;
    } else if (health < 11) {
      myColor = #40A7FF;
      myStroke = #0C75CE;
      speed = 1.5;
      rotSpeed = 3;
    }
  }

  public boolean checkCollide(Floater object) {
    boolean why = false;
    if (dist((float)myCenterX, (float)myCenterY, object.getCenterX(), object.getCenterY()) < 25)
      why = true;
    return why;
  }
}
