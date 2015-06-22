SlideShow ss;

void setup() {
  ss = new SlideShow();
  size(displayWidth, displayHeight);
}

void draw() {
  ss.advance();
}

boolean sketchFullScreen() {
  return true;
}
