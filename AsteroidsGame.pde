///////////////////////////////////VARIABLES/////////////////////////////////////////////////

Spaceship financiallystable = new Spaceship();
Star[][] benjaminneyman = new Star[8][8];
boolean pressingW = false;
boolean pressingS = false;
boolean pressingD = false;
boolean pressingA = false;
boolean pressingSpace = false;

////////////////////////////////DRAWING STUFF/////////////////////////////////////////////////


public void setup() {
  size(800, 800);
  background(150, 60, 255);
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++) {
      benjaminneyman[j][i] = new Star((int)(Math.random()*114)+114*i, (int)(Math.random()*114)+114*j);
      benjaminneyman[j][i].show();
    }
  }
}
public void draw() {
  background(150, 60, 255);
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++)
      benjaminneyman[j][i].show();
  }

  if (pressingW)
    financiallystable.accelerate(.2);
  if (pressingS)
    financiallystable.accelerate(-.2);
  if (pressingA)
    financiallystable.turn(2);
  if (pressingD)
    financiallystable.turn(-2);
  if (pressingSpace)
    financiallystable.brake();
    
  financiallystable.speedLimit();
  financiallystable.move();
  financiallystable.show();
}


////////////////////////////////////KEY PRESSING STUFF///////////////////////////////////////


public void keyPressed() {
  if (key == 'w')
    pressingW = true;
  if (key == 's')
    pressingS = true;
  if (key == 'a')
    pressingA = true;
  if (key == 'd')
    pressingD = true;
  if (key == ' ')
    pressingSpace = true;
}

public void keyReleased() {
  if (key == 'w')
    pressingW = false;
  if (key == 's')
    pressingS = false;
  if (key == 'a')
    pressingA = false;
  if (key == 'd')
    pressingD = false;
  if (keyCode == ' ')
    pressingSpace = false;
}
