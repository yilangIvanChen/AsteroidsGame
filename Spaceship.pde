class Spaceship extends Floater {
  public Spaceship() {
    health = 100;
    isDead = false;
    corners = 14;
    xCorners = new int[]{-28, -24, -24, -20, -20, -16, -16, 20, 20, 8, -16, -24, -24, -28};
    yCorners = new int[]{-4, -4, -8, -6, -16, -16, -8, -4, 4, 8, 8, 12, 8, 8};
    myCenterX = 400;
    myCenterY = 400;
    myColor = #D6E7FF;
    myStroke = #80AAE3;
    myXspeed = 0;
    myYspeed = 0;
  }


  public void brake() {
    if (myXspeed > 0)///////////////////constantly decels to zero (not accurate to space but womp womp)
      myXspeed -= .1;
    if (myXspeed < 0)
      myXspeed += .07;
    if (myYspeed > 0)
      myYspeed -= .1;
    if (myYspeed < 0)
      myYspeed += .07;
  }

  public void move() {
    if (myXspeed > 4)////////////////////limits speed to my thing playable
      myXspeed = 4;
    if (myXspeed < -3)
      myXspeed = -3;
    if (myYspeed > 4)
      myYspeed = 4;
    if (myYspeed < -3)
      myYspeed = -3;
    super.move();
  }
}
