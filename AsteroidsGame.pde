/*
to do (or not to do):
 
 -hp/collision (health bar?)
 -enemies randomly spawn on outer edge
 -abilities: bullet spread (w/ hyperspace, med cd); funny sharp shadow dash; throwable nade
 -ability cooldowns
 -reloading (done, add ui and remove bullet when outside of border or collision)
 
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

Star[][] benjaminneyman = new Star[8][8];

ArrayList <Enemy> jason = new ArrayList <Enemy>();
Spaceship financiallystable = new Spaceship();

boolean pressingW = false;
boolean pressingS = false;
boolean pressingD = false;
boolean pressingA = false;
boolean pressingSpace = false;
boolean RPressed = false;

ArrayList <Bullet> pew = new ArrayList <Bullet>();
boolean shootCD = false;
int shootCDtimer = 0;
boolean checkReload = false;
int bulletsShot = 0;
int reloadTimer = 0;

double spawnRate = .0135;
double willSpawn;

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
      benjaminneyman[j][i].show();//////////stars
  }

  willSpawn = Math.random();
  if (willSpawn < spawnRate)
    jason.add(new Enemy((int)(Math.random()*700), (int)(Math.random()*700)));
  spawnRate += .00000005;

  if (pressingW)///////////////////////////movement
    financiallystable.accelerate(.1);
  if (pressingS)
    financiallystable.accelerate(-.1);
  if (pressingA)
    financiallystable.turn(3);
  if (pressingD)
    financiallystable.turn(-3);
  if (pressingSpace)
    financiallystable.brake();
  if (mousePressed && mouseButton == LEFT && !shootCD && !checkReload) {/////////////////////bullets
    pew.add(new Bullet(financiallystable.getCenterX(), financiallystable.getCenterY(), financiallystable.getDirection()));
    pew.get(pew.size()-1).accelerate(23);
    shootCD = true;
    bulletsShot++;
  }
  shootCDtimer++;
  if (shootCDtimer == 10) {
    shootCDtimer = 0;
    shootCD = false;
  }

  if (bulletsShot == 24 || RPressed) {
    checkReload = true;
    reloadTimer++;
    if (reloadTimer == 60) {
      bulletsShot = 0;
      checkReload = false;
      reloadTimer = 0;
      RPressed = false;
    }
  }

  for (int i = pew.size()-1; i >= 0; i--) {
    pew.get(i).move();
    pew.get(i).show();
  }

  financiallystable.speedLimit();
  financiallystable.move();
  financiallystable.show();

  for (int i = 0; i < jason.size(); i++) {/////////////////////enemies
    jason.get(i).move(financiallystable.getCenterX(), financiallystable.getCenterY());
    jason.get(i).show();
  }

  for (int i = jason.size()-1; i >= 0; i--) {/////////////////////enemies
    jason.get(i).checkCollide(dist(jason.get(i).getCenterX(), jason.get(i).getCenterY(), financiallystable.getCenterX(), financiallystable.getCenterY()));
    if (jason.get(i).checkDead())
      jason.remove(i);
  }
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
  if (key == 'r')
    RPressed = true;
  if (key == 'q') {
    financiallystable.setCenterX((int)(Math.random()*750)+25);
    financiallystable.setCenterY((int)(Math.random()*750)+25);
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
