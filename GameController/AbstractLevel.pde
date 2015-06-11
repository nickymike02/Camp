abstract class AbstractLevel implements Level {

  abstract void levelSetup();
  abstract void levelDraw();

  void advance() {
    lockedControls = true;
    //remove all projectiles
    for (int i = 0; i < sprites.size (); i++) {
      if (sprites.get(i) instanceof ProjectileSprite) {
        sprites.remove(i);
      }
    }
    player.velocity = new PVector(0, -8);
    if (player.position.y < 0 - 3 * player.radius) {
      stage++;
      if (stage > levels.size() - 1) {
        endGame("win");
      } else {
        currentLevel = levels.get(stage);
      }
    }
  }
}
