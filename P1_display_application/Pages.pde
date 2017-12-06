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
    if (animX < width) {
      if (animX > width-(animSpeedX*resScaleX)) {
        animX = width;
      } else {
        animX+=animSpeedX*resScaleX;
      }
    } else {
      animX = width;
    }
    if (animY < height) {
      if (animY > height-(animSpeedY*resScaleY)) {
        animY = height;
      } else {
        animY+=animSpeedY*resScaleY;
      }
    } else {
      animY = height;
    }
    if (animX == width && animY == height) {
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
}