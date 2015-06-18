PImage img;
PFont font;

void setup () {
 background(0); 
 img = loadImage("Uncle_Jay.jpg");
 size(img.width, img.height - 20);
 image(img,0,0);
 textAlign(CENTER);
 textSize(100);
 fill (0, 0, 255);
 text("I WANT YOU!", width/2,height-40);
 strokeWeight(10);
 stroke(0,0,255,150);
 line (35,140,650,140);
 textAlign(CENTER);
 textSize(120);
 fill (0, 0, 255);
 text("JAYHAWKS", width/2, 125);
}
