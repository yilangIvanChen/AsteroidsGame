/*
to do (or not to do):
to the ship: shoot stuff; hp; level and exp system (exponential exp req); stats; abilities and cooldowns
to the enemies: increasing hp per wave; follow ship around
potential abilities: bullet spread(w/ hyperspace); funny sharp shadow dash; nade/molly
-smth to prevent abuse of edge jumping

class tree planning
      Floater
        ^
       / \
   ship   enemy
            ^
       /    |    \
   normal fast,  slow,
         low hp  tanky
          
*/

///////////////////////////////////VARIABLES/////////////////////////////////////////////////

Enemy a = new Enemy(100,100);
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
    financiallystable.accelerate(.1);
  if (pressingS)
    financiallystable.accelerate(-.1);
  if (pressingA)
    financiallystable.turn(3);
  if (pressingD)
    financiallystable.turn(-3);
  if (pressingSpace)
    financiallystable.brake();
  financiallystable.speedLimit();
  financiallystable.move();
  financiallystable.show();
  a.show();
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
  if (key == 'q') {
    financiallystable.setSpaceshipX((int)(Math.random()*750)+25);
    financiallystable.setSpaceshipY((int)(Math.random()*750)+25);
    financiallystable.setDirection(Math.random()*360);
    financiallystable.setSpeedX(0);
    financiallystable.setSpeedY(0);
  }
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
