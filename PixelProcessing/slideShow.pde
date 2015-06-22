class SlideShow {

  //class variables
  int currentSlide = 0;
  int slideCounter = 0;
  float delay = 2.0; //seconds
  ArrayList<PImage> images = new ArrayList<PImage>();
  String[] validExtensions = {"png", "jpg", "jpeg", "gif"};
  File[] files;
  File dataFolder;

  //default constructor
  SlideShow() {
    dataFolder = new File(dataPath(""));
    loadImages();
  }
  
  //overloaded constructor
  SlideShow(String folderName) {
    dataFolder = new File(dataPath(folderName));
    loadImages();
  }

  //logic to advance and display the slideshow
  void advance() {
    imageMode(CENTER);
    if(slideCounter + millis() > 1000 * delay * slideCounter) {
      currentSlide++;
      slideCounter++;
      if(currentSlide == images.size()) {
        currentSlide = 0;
      }
    }
    background(0);
    image(images.get(currentSlide), width/2, height/2);
  }
  
  //logic to load images from "data" folder
  void loadImages() {
    //load images
    files = dataFolder.listFiles();
    for(File file : files) {
      if(isImage(file)) {
        images.add(loadImage(file.getName()));
      }
    }
  }
    
  // checks if image is PNG, JPEG, JPG, GIF
  boolean isImage(File file) {
    //i will always be negative 1 when there is no period found
    int i = file.getName().lastIndexOf('.');
    if(i > -1) {
      for(String extension : validExtensions) {
        if(file.getName().substring(i + 1).toLowerCase().equals(extension)) {
          return true;
        }
      }
    }
    return false;
  }
}
