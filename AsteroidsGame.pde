///////////////////////////////////VARIABLES/////////////////////////////////////

Spaceship pleasespeedineedthis = new Spaceship();
Star[] benjaminneyman = new Star[49];

////////////////////////////////DRAWING STUFF////////////////////////////////////////


public void setup() {
  size(800, 800);
  background(150, 60, 255);
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++) {
      benjaminneyman[i] = new Star((int)(Math.random()*114)+114*i, (int)(Math.random()*114)+114*j);
      benjaminneyman[i].show();
    }
  }
}
public void draw() {
  pleasespeedineedthis.show();
}
