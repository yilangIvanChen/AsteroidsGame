class Spaceship extends Floater {
  Spaceship() {
    corners = 14;
    xCorners = new int[]{-28, -24, -24, -20, -20, -16, -16, 20, 20, 8, -16, -24, -24, -28};
    yCorners = new int[]{-4, -4, -8, -6, -16, -16, -8, -4, 4, 8, 8, 12, 8, 8};
    myCenterX = 400;
    myCenterY = 400;
    myColor = (#D6E7FF);
    myXspeed = 0;
    myYspeed = 0;
  }

  ///////////////getters for the asteroids later

  public int getSpaceshipX() {
    return (int)myCenterX;
  }

  public int getSpaceshipY() {
    return (int)myCenterY;
  }

  ///////////////////setters (prob for the hyperspace thing)

  public void setSpaceshipX(int x) {
    myCenterX = x;
  }

  public void setSpaceshipY(int y) {
    myCenterY = y;
  }
  
  ///////////////////movement

}
