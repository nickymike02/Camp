class LevelOne extends AbstractLevel {

  boolean intro = true;
  long timeSinceLastEnemyShot = 0;
  long enemyShotDelay = 400; //ms
  
  LevelOne() {
  }

  void levelSetup() {
    lockedControls = true;
    player.position = new PVector(0.5 * width, height + 6 * player.radius);
    player.velocity = new PVector(0, -3);
  }

  void levelDraw() {
    if (intro)
      playIntro();
    else
      fight();
  }

  void playIntro() {
    if (player.position.y <= playerControllerLine) {
      player.velocity = new PVector(0, 0);
      player.position.y = playerControllerLine;
      lockedControls = false;
      spawnEnemies();
      intro = false;
    }
  }

  void fight() {
    automateEnemies();
    if (levelIsComplete()) {
      advance();
    }
  }

  void spawnEnemies() {
    int radius = 40;
    int enemyRows = 4;
    int enemyCols = width / (4 * radius);
    for (int i = 0; i < enemyRows; i++) {
      for (int j = 0; j < enemyCols; j++) {
        PShape graphic = factory.getBasicEnemy();
        PVector position = new PVector(2*radius + 1 + j*100, 2*radius + i*100);
        PVector velocity = new PVector(enemySpeedLimit, 0);
        HostileSprite enemy = new HostileSprite(enemiesTeam, radius, graphic, position, velocity);
        sprites.add(enemy);
        enemies.add(enemy);
      }
    }
  }

  void automateEnemies() {
    long now = millis();
    int i = (int)random(0, enemies.size());
    HostileSprite enemy = (HostileSprite)enemies.get(i);
    if (now > timeSinceLastEnemyShot + enemyShotDelay && enemy != player) {
      enemy.fire(player, 8);
      timeSinceLastEnemyShot = now;
    }
  }

  boolean levelIsComplete() {
    if (enemies.size() > 1 && enemies.contains(player)) {
      return false;
    } else {
      return true;
    }
  }
}
