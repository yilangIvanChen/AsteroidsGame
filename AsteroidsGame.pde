///////////////////////////////////VARIABLES/////////////////////////////////////////////////

Spaceship financiallystable = new Spaceship();
Star[][] benjaminneyman = new Star[8][8];

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
  
  if (keyPressed){
   if (key == 'w')
    financiallystable.accelerate(.2);
  if (key == 's')
    financiallystable.accelerate(-.2);
  if (key == 'a')
    financiallystable.turn(1.5);
  if (key == 'd')
    financiallystable.turn(-1.5);
  if (key == 'w' && key == 'r')///////////////////ask about how to make mulitple keys register
    System.out.println("adfjalsdfkj");
  }
    
  financiallystable.move();
  financiallystable.constantDecel();
  financiallystable.show();
}


////////////////////////////////////KEY PRESSING STUFF///////////////////////////////////////













