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

ArrayList <Enemy> jasontrieu = new ArrayList <Enemy>();
Spaceship financiallystable = new Spaceship();

boolean pressingW = false;
boolean pressingS = false;
boolean pressingD = false;
boolean pressingA = false;
boolean pressingSpace = false;
boolean rPressed = false;

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
      benjaminneyman[j][i].show();//////////////stars
  }

  willSpawn = Math.random();
  if (willSpawn < spawnRate)
    jasontrieu.add(new Enemy((int)(Math.random()*600)+150, (int)(Math.random()*700)+50));
  spawnRate += .000005;

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
    pew.add(new Bullet(financiallystable));
    shootCD = true;
    bulletsShot++;
  }



  shootCDtimer++;//////////shoot cd
  if (shootCDtimer == 15) {
    shootCDtimer = 0;
    shootCD = false;
  }

  if (bulletsShot == 18 || rPressed) {///////////reloading
    checkReload = true;
    reloadTimer++;
    if (reloadTimer == 150) {
      bulletsShot = 0;
      checkReload = false;
      reloadTimer = 0;
      rPressed = false;
    }
  }

  for (int i = pew.size()-1; i >= 0; i--) {
    if (pew.size() > 0) {
      pew.get(i).move();
      pew.get(i).show();
    }
    if (pew.get(i).checkDead())
      pew.remove(i);
  }

  financiallystable.move();
  financiallystable.show();

  for (int i = 0; i < jasontrieu.size(); i++) {/////////////////////enemies
    jasontrieu.get(i).move(financiallystable);
    jasontrieu.get(i).show();
  }

  for (int i = jasontrieu.size()-1; i >= 0; i--) {/////////////////////enemies
    jasontrieu.get(i).checkCollide(dist(jasontrieu.get(i).getCenterX(), jasontrieu.get(i).getCenterY(), financiallystable.getCenterX(), financiallystable.getCenterY()));
    if (jasontrieu.get(i).checkDead()) {
      jasontrieu.remove(i);
      break;
    }
    for (int j = pew.size()-1; j >= 0; j--) {
      jasontrieu.get(i).checkCollide(dist(jasontrieu.get(i).getCenterX(), jasontrieu.get(i).getCenterY(), pew.get(j).getCenterX(), pew.get(j).getCenterY()));
      if (jasontrieu.get(i).checkDead()) {
        jasontrieu.remove(i);
        pew.remove(j);
        break;
      }
    }
  }

  noStroke();///////////////////////UI
  fill(167);
  rect(0, 0, 100, 800);
  stroke(#E8BC1C);
  strokeWeight(2);
  fill(#FFD439);
  rect(5, 5+5*bulletsShot, 42, 90-5*bulletsShot);
  stroke(#42D821);
  fill(#59FF39);
  rect(53, 5, 42, 90);
  if (checkReload){
    fill(0);
    textSize(14);
    text("Reloading...", financiallystable.getCenterX()-35, financiallystable.getCenterY()-55);
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
    rPressed = true;
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
