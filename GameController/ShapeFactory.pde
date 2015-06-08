class ShapeFactory {
  PShape basicPlayer;
  PShape basicEnemy;

  ShapeFactory() {
    buildBasicPlayer();
    buildBasicEnemy();
  }
  
  PShape getBasicPlayer() {
    return basicPlayer;
  }

  PShape getBasicEnemy() {
    return basicEnemy;
  }
  
  void buildBasicPlayer() {
    basicPlayer = createShape(ELLIPSE,-30,30,50,50);
    
  }

  void buildBasicEnemy() {
    basicEnemy = createShape (GROUP);
    PShape chassis = createShape();
    chassis.beginShape();
    chassis.fill(random(255),random(255),random(255));
    chassis.vertex(-25, -25);
    chassis.vertex(25, -25);
    chassis.vertex(25, 25);
    chassis.vertex(-25, 25);
    chassis.endShape();
    basicEnemy.addChild(chassis);
  }
}

