final int playersTeam = 1;
final int enemiesTeam = 2;
int playerLives = 3;
int playerSpeedLimit = 8;
int enemySpeedLimit = 4;
int stage = 0;
boolean invincible = false;
boolean lockedControls = true;
boolean[] keys = new boolean[3];
ArrayList<Sprite> sprites = new ArrayList<Sprite>();
ArrayList<Sprite> enemies = new ArrayList<Sprite>();
ArrayList<Level> levels = new ArrayList<Level>();

Level currentLevel;
ShapeFactory factory;
HostileSprite player;
float playerControllerLine;
PShape lifeIcon;

void setup() {
  size(displayWidth, displayHeight, P2D);
  noCursor();

  factory = new ShapeFactory();
  lifeIcon = factory.getBasicPlayer().getChild(0); //the chassis
  playerControllerLine = 0.85 * height;
  player = spawnPlayer();
  sprites.add(player);
  enemies.add(player);

  levels.add(new LevelOne());
  for (Level level : levels) {
    level.levelSetup();
  }
  currentLevel = levels.get(0);
}

void draw() {
  background(25);
  showPlayerLives();
  if(playerLives == 0) {
    endGame("lose");
  }
  currentLevel.levelDraw();
  if (!lockedControls) {
    controlPlayer();
  }
  
  for (int i = 0; i < sprites.size (); i++) {
    sprites.get(i).updateAndDisplay();
  }
}

boolean sketchFullScreen() {
  return true;
}

HostileSprite spawnPlayer() {
  PVector startingPosition = new PVector(0.5 * width, 0.85 * height);
  PVector initialVelocity = new PVector(0, 0);
  PShape graphic = factory.getBasicPlayer();
  int radius = 40;
  return new HostileSprite(playersTeam, radius, graphic, startingPosition, initialVelocity);
}

void controlPlayer() {
  if (keys[0]) {
    if (isLeftBound(player))
      player.position.x = 2 * player.radius;
    else
      player.position.x -= playerSpeedLimit;
  }
  if (keys[1]) {
    if (isRightBound(player)) {
      player.position.x = width - 2 * player.radius;
    } else {
      player.position.x += playerSpeedLimit;
    }
  }
  if (keys[2]) {
    player.fire(new PVector(0, -10));
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT)
      keys[0] = true;
    if (keyCode == RIGHT)
      keys[1] = true;
    if (keyCode == 61440)
      saveFrame("data/" + System.currentTimeMillis() + ".jpg");
  }
  if (key == 'f' || key == 'F' || key == ' ')
    keys[2] = true;
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT)
      keys[0] = false;
    if (keyCode == RIGHT)
      keys[1] = false;
  }
  if (key == 'f' || key == 'F')
    keys[2] = false;
}

boolean isLeftBound(AbstractSprite sprite) {
  int leftBoundary = 2 * sprite.radius;
  if (sprite.position.x <= leftBoundary)
    return true;
  else
    return false;
}

boolean isRightBound(AbstractSprite sprite) {
  int rightBoundary = width - 2 * sprite.radius;
  if (sprite.position.x >= rightBoundary)
    return true;
  else
    return false;
}

void showPlayerLives() {
  for (int i = 0; i < playerLives; i++) {
    shape(lifeIcon, 60 + i * 100, height - 40);
  }
}

void endGame(String condition) {
  if(condition.equals("lose")) {
    cursor();
    textAlign(CENTER);
    textSize(48);
    text("Game Over", width/2, height/2);
    noLoop();
  } else if(condition.equals("win")) {
    cursor();
    textAlign(CENTER);
    textSize(48);
    text("You Beat the Game", width/2, height/2);
    noLoop();    
  }
}
