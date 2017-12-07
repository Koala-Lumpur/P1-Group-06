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

  void pageObjectViewer() {
    if (mouseX > 629*resScaleX && mouseX < 1379*resScaleX &&
      mouseY > 640*resScaleY && mouseY < 892*resScaleY) {
      page3D = true;
      pageObjView = false;
      pages.animX = 0;
      pages.animY = 0;
    }
  }

  void quizContinue() {
    if (mouseX > 195*resScaleX && mouseX < 627*resScaleX &&
      mouseY > 570*resScaleY && mouseY < 850*resScaleY) {
      quizPage = true;
      beforeQuizPage = false;
      pages.animX = 0;
      pages.animY = 0;
    }
  }

  void quizAnswer() {
    if (mouseX > 457*resScaleX && mouseX < 1587*resScaleX &&
      mouseY > 525*resScaleY && mouseY < 660*resScaleY) {
      quizWrong = true;
      quizPage = false;
      println("depressed");
    } else if (mouseX > 457*resScaleX && mouseX < 1578* resScaleX &&
      mouseY > 825*resScaleY && mouseY < 960*resScaleY) {
      quizCorrect = true;
      quizPage = false;
    } else if (mouseX > 457*resScaleX && mouseX < 1587*resScaleX &&
      mouseY > 1125*resScaleY && mouseY < 1260*resScaleY) {
      quizWrong = true;
      quizPage = false;
      println("fuck, Rasmus is depressed");
    }
  }

  void homeButton() {
    if (mouseX > homeX && mouseX < homeX+homeSizeX &&
      mouseY > homeY && mouseY < homeY+homeSizeY) {
      modelPressed = false;
      if (quizWrong) {
        quizPage = true;
        quizWrong = false;
      } else if (quizCorrect) {
        frontPage = true;
        quizCorrect = false;
      } else if (quizPage) {
        backAnim = true;
        beforeQuizPage = true;
        println("test");
      } else if (!page3D) {
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