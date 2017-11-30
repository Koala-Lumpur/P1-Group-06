class Pages {
  int animX, animY;
  int animSpeedX = 120;
  int animSpeedY = 70;

  Pages() {
  }
  void frontPage() {
    image(imgFP, 0, heightScalePos, width, int(heightScale));
  }

  void pageChange(PImage img) {
    image(img, 0, heightScale-animY, animX, animY);
    if (animX < width) {
      if (animX > width-(animSpeedX*resScaleX)) {
        animX = width;
      } else {
        animX+=animSpeedX*resScaleX;
      }
    } else {
      animX = width;
    }
    if (animY < heightScale) {
      if (animY > heightScale-(animSpeedY*resScaleY)) {
        animY = int(heightScale);
      } else {
        animY+=animSpeedY*resScaleY;
      }
    } else {
      animY = int(heightScale);
    }
    if (animX == width && animY == heightScale) {
      animX = width;
      animY = int(heightScale);
      page1 = false;
    }
  }

  void goHome(PImage img) {
    image(img, 0, int(heightScale)-animY, animX, animY);
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
      pageHow = false;
      homeAnim = false;
    }
  }
}