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
      frontPage = false;
      
    } else if (mouseX > 1440*resScaleX && mouseX < 1440*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 3");
    } else {
      println("nope");
    }
  }
  
  void page3D() {
    if(mouseX > 629*resScaleX && mouseX < 1379*resScaleX &&
    mouseY > 640*resScaleY && mouseY < 892*resScaleY) {
      page3D = true;
    }
  }

  void homeButton() {
    if (mouseX > homeX && mouseX < homeX+homeSizeX &&
      mouseY > homeY && mouseY < homeY+homeSizeY) {
      println("page 1");
      if (!page3D) {
        homeAnim = true;
        frontPage = true;
      } else {
        page3D = false;
        frontPage = true;
      }
    }
  }
}