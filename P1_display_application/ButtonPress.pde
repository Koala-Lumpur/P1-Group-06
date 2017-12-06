class ButtonPress {

  ButtonPress() {
  }

  void frontPage() {
    if (mouseX > 407*resScaleX && mouseX < 407*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      pageObjView = true;
      println("touched");
    } else if (mouseX > 885*resScaleX && mouseX < 885*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 2");
      beforeQuizPage = true;
    } else if (mouseX > 1440*resScaleX && mouseX < 1440*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 3");
      beforeClassPage = true;
    } else {
      println("nope");
    }
  }
  
  void page3D() {
    if(mouseX > 629*resScaleX && mouseX < 1379*resScaleX &&
    mouseY > 640*resScaleY && mouseY < 892*resScaleY) {
      page3D = true;
      pageObjView = false;
      pages.animX = 0;
      pages.animY = 0;
    }
  }
  
  void quizContinue() {
    if(mouseX > 195*resScaleX && mouseX < 627*resScaleX &&
    mouseY > 570*resScaleY && mouseY < 850*resScaleY) {
      quizPage = true;
      beforeQuizPage = false;
      pages.animX = 0;
      pages.animY = 0;
    }
  }
  
  void homeButton() {
    if (mouseX > homeX && mouseX < homeX+homeSizeX &&
      mouseY > homeY && mouseY < homeY+homeSizeY) {
      modelPressed = false;
      if (quizPage) {
        homeAnim = true;
        beforeQuizPage = true;
      } else if(!page3D) {
        println("test2");
        homeAnim = true;
        frontPage = true;
      } else {
        background(bgColor);
        temple.setVisible(true);
        rotY = 0;
        page3D = false;
        modelNotPressed = true;
        frontPage = true;
      }
    }
  }
}