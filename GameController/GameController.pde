final int screenWidth = 800;
final int screenHeight = 600;
ShapeFactory factory;
PShape enemy;
PShape player;

void setup () {
  size (screenWidth, screenHeight, P2D);
  factory = new ShapeFactory();
  enemy = factory.getBasicEnemy();
  player = factory.getBasicPlayer();
  noCursor();
}

void draw () {
  background(0);
  shape(enemy, 100, 100);
  shape(player,mouseX, 450);
}

