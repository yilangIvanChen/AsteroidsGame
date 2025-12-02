class Bullet extends Floater {

  Bullet(Spaceship ship) {
    corners = 4;
    xCorners = new int[]{1, 1, -15, -15};
    yCorners = new int[]{1, -1, -1, 1};
    myCenterX = ship.getCenterX();
    myCenterY = ship.getCenterY();
    myColor = #FFD91A;
    myStroke = #FFD91A;
    isDead = false;
    myPointDirection = ship.getDirection();
    accelerate(28);
  }
  public void move () {  //override the wrapping screen function    
    myCenterX += myXspeed;    
    myCenterY += myYspeed;  
  
    if (myCenterX > width || myCenterX < 0 || myCenterY > height || myCenterY < 0){
      isDead = true;
    }
  }
}
