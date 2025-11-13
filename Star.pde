class Star { //note that this class does NOT extend Floaters
  private int myX, myY;
  private float size;
  public Star(int x, int y) {
    myX = x;
    myY = y;
    size = (float)Math.random()+.4;
  }
  public void show() {
      noStroke();
      fill(255);
      ellipse(myX, myY, 7*size, 7*size);
    }
  }
