class Pages {
  int animX, animY;
  int animSpeedX = 120;
  int animSpeedY = 90;

  Pages() {
  }
  void frontPage() {
    image(imgFP, 0, 0, width, height);
  }

  void pageChange(PImage img) {
    image(img, 0, height-animY, animX, animY);
    animX += animSpeedX*resScaleX;
    animY += animSpeedY*resScaleY;
    if (animX > width-(animSpeedX*resScaleX)) {
      animX = width;
    }
    if (animY > height-(animSpeedY*resScaleY)) {
      animY = height;
    } 
    if (animX == width || animY == height) {
      animX = width;
      animY = height;
      frontPage = false;
    }
  }

  void animMiddle(PImage img) {
    image(img, width/2-animX/2, height/2-animY/2, animX, animY);
    animX += animSpeedX*resScaleX;
    animY += animSpeedY*resScaleY;
    if (animX > width-(animSpeedX*resScaleX)) {
      animX = width;
    }
    if (animY > height-(animSpeedY*resScaleY)) {
      animY = height;
    } 
    if (animX == width || animY == height) {
      animX = width;
      animY = height;
      frontPage = false;
    }
  }

  void goHome(PImage img) {
    image(img, 0, height-animY, animX, animY);
    if (animX > 0) {
      animX -= animSpeedX*resScaleX;
    } else {
      animX = 0;
    }
    if (animY > 0) {
      animY -=animSpeedY*resScaleY;
    } else {
      animY = 0;
    }
    if (animX == 0 && animY == 0) {
      beforeQuizPage = false;
      pageObjView = false;
      homeAnim = false;
    }
  }
  
  void goHomeMiddle(PImage img) {
    image(img, width/2-animX/2, height/2-animY/2, animX, animY);
    if (animX > 0) {
      animX -= animSpeedX*resScaleX;
    } else {
      animX = 0;
    }
    if (animY > 0) {
      animY -=animSpeedY*resScaleY;
    } else {
      animY = 0;
    }
    if (animX == 0 && animY == 0) {
      quizPage = false;
      homeAnim = false;
    }
  }
}