///////////////////////////////////VARIABLES/////////////////////////////////////

Spaceship pleasespeedineedthis = new Spaceship();
Star[] benjaminneyman = new Star[49];

////////////////////////////////DRAWING STUFF////////////////////////////////////////


public void setup() {
  size(600, 600);
  background(150, 60, 255);
  for (int i = 0; i<benjaminneyman.length; i++) {
    benjaminneyman[i] = new Star((int)(Math.random()*86)+86*i,(int)(Math.random()*86)+86*i);
    benjaminneyman[i].show();
  }
}
public void draw() {
  pleasespeedineedthis.show();
}
