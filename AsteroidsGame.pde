

///////////////////////////////////VARIABLES/////////////////////////////////////////////////

Star[][] Stars = new Star[8][8];
PImage dead;

ArrayList <Enemy> Enemies = new ArrayList <Enemy>();
Spaceship Ship = new Spaceship();

boolean pressingW = false;
boolean pressingS = false;
boolean pressingD = false;
boolean pressingA = false;
boolean pressingSpace = false;

ArrayList <Bullet> pew = new ArrayList <Bullet>();
boolean shootCD = false;
int shootCDtimer = 0;
boolean checkReload = false;
int bulletsShot = 0;
int reloadTimer = 0;

double spawnRate = .0135;
double spawnChance;
double willSpawn;

////////////////////////////////DRAWING STUFF/////////////////////////////////////////////////


public void setup() {
  dead = loadImage("skillissue.png");
  size(800, 800);
  background(150, 60, 255);
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++) {
      Stars[j][i] = new Star((int)(Math.random()*114)+114*i, (int)(Math.random()*114)+114*j);
      Stars[j][i].show();
    }
  }
}


public void draw() {
  background(150, 60, 255);
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 8; i++)
      Stars[j][i].show();//////////////stars
  }

  willSpawn = Math.random();
  if (willSpawn < spawnRate) {
    spawnChance = Math.random();
    if (spawnChance < .1)
      Enemies.add(new EnemyFast((int)(Math.random()*600)+150, (int)(Math.random()*700)+50));
    else
      Enemies.add(new Enemy((int)(Math.random()*600)+150, (int)(Math.random()*700)+50));
  }
  spawnRate += .000005;

  if (pressingW)///////////////////////////movement
    Ship.accelerate(.1);
  if (pressingS)
    Ship.accelerate(-.1);
  if (pressingA)
    Ship.turn(3);
  if (pressingD)
    Ship.turn(-3);
  if (pressingSpace)
    Ship.brake();

  if (mousePressed && mouseButton == LEFT && !shootCD && !checkReload) {/////////////////////bullets
    pew.add(new Bullet(Ship));
    shootCD = true;
    bulletsShot++;
  }



  shootCDtimer++;//////////shoot cd
  if (shootCDtimer == 6) {
    shootCDtimer = 0;
    shootCD = false;
  }

  if (bulletsShot == 36) {///////////reloading
    checkReload = true;
    reloadTimer++;
    if (reloadTimer == 120) {
      bulletsShot = 0;
      checkReload = false;
      reloadTimer = 0;
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

  Ship.move();
  Ship.show();

  for (int i = 0; i < Enemies.size(); i++) {/////////////////////enemies
    Enemies.get(i).move(Ship);
    Enemies.get(i).show();
  }

  for (int i = Enemies.size()-1; i >= 0; i--) {
    if (Enemies.get(i).checkCollide(Ship)) {
      Ship.takeDmg(5);
      Enemies.remove(i);
      break;
    }
    for (int j = pew.size()-1; j >= 0; j--) {
      if (Enemies.get(i).checkCollide(pew.get(j))) {
        Enemies.get(i).takeDmg(5);
        Enemies.get(i).dmgTaken();
        pew.remove(j);
        break;
      }
      if (Enemies.get(i).checkDead()) {
        Enemies.remove(i);
        break;
      }
    }
  }

  noStroke();///////////////////////UI
  if (checkReload) {
    fill(0);
    textSize(14);
    text("Reloading...", Ship.getCenterX()-35, Ship.getCenterY()-55);
  }
  fill(167);
  rect(0, 0, 100, 800);
  stroke(#E8BC1C);
  strokeWeight(2);
  fill(#FFD439);
  if (checkReload)
    rect(5, 95-reloadTimer/4*3, 42, reloadTimer/4*3);
  else
    rect(5, 5+90*((float)bulletsShot/36), 42, 90*((36-(float)bulletsShot)/36));
  stroke(#42D821);
  fill(#59FF39);
  rect(53, 5+90*((100-Ship.getHp())/100), 42, 90*(Ship.getHp()/100));

  if (Ship.getHp() <= 0) {
    image(dead, -200, 0, width*1.8, height);
    fill(0);
    textSize(50);
    text("Blawg you suck", 50, 150);
    text("try getting better next time", 50, 500);
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
  if (key == 'q') {
    Ship.setCenterX((int)(Math.random()*750)+25);
    Ship.setCenterY((int)(Math.random()*750)+25);
    Ship.setDirection(Math.random()*360);
    Ship.setSpeedX(0);
    Ship.setSpeedY(0);
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
