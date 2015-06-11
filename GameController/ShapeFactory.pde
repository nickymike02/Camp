class ShapeFactory {
  PShape basicBullet;
  PShape basicPlayer;
  PShape basicEnemy;

  ShapeFactory() {
    buildBasicPlayer();
    buildBasicEnemy();
  }

  PShape getBasicBullet() { 
    return basicBullet;
  }

  PShape getBasicPlayer() {
    return basicPlayer;
  }

  PShape getBasicEnemy() {
    return basicEnemy;
  }

  void buildBasicBullet() {
    basicBulletRadius = 20;
    basicBullet = createShape(ELLIPSE, -10, -10, 20, 20);
    basicBullet.setStroke(color(255));
    basicBullet.setStrokeWeight(4);
    basicBullet.setFill(color(127));
  }


  void buildBasicPlayer() {
    basicPlayer = createShape(GROUP);
    PShape chassis = createShape();
    chassis.beginShape();
    chassis.fill(100);
    chassis.vertex(0, -30);
    chassis.vertex(30, 30);
    chassis.vertex(-30, 30);
    chassis.endShape();
    basicPlayer.addChild(chassis);
  }

  void buildBasicEnemy() {
    basicEnemy = createShape (GROUP);
    PShape chassis = createShape();
    chassis.beginShape();
    chassis.fill(0, 100, 255);
    chassis.vertex(-25, -25);
    chassis.vertex(25, -25);
    chassis.vertex(25, 25);
    chassis.vertex(-25, 25);
    chassis.endShape();
    basicEnemy.addChild(chassis);
  }
}

