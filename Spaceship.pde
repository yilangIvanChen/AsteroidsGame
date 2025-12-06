class Spaceship extends Floater {
  public Spaceship() {
    health = 10000;
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

  public void limitSpeed() {
    if (myXspeed > 4)////////////////////limits speed to my thing playable
      myXspeed = 4;
    if (myXspeed < -3)
      myXspeed = -3;
    if (myYspeed > 4)
      myYspeed = 4;
    if (myYspeed < -3)
      myYspeed = -3;
  }

  public void hyperspace() {
    myCenterX = (int)(Math.random()*650)+125;
    myCenterY = (int)(Math.random()*750)+25;
    myPointDirection = Math.random()*360;
    myXspeed = 0;
    myYspeed = 0;
  }

  public void heal(int heal) {
    health += heal;
    if (health > 100)
      health = 100;
  }
}
