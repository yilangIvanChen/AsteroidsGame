class Star { //note that this class does NOT extend Floaters
  private int myX, myY;
  private double type;
  public Star(int x, int y){
  myX = x;
  myY = y;
  type = Math.random();
  }
  public void show(){
    if (type <= 1){
    noStroke();
    ellipse(myX,myY,5,5);
    }
  }
}
