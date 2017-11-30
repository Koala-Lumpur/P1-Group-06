PShape table;
PImage imgFP, imgHow, page2;

float resScaleX, resScaleY;

int buttonSizeX, buttonSizeY;
int buttonY;
int homeX, homeY, homeSizeX, homeSizeY;

float rotX, rotY;

boolean page1, pageHow, page3D, homeAnim;

Pages pages = new Pages();

void setup() {
  frameRate(60);
  orientation(LANDSCAPE);
  size(displayWidth, displayHeight, P3D);

  resScaleX = float(width)/1920;
  resScaleY = float(height)/1080;

  buttonSizeX = 261*width/1920;
  buttonSizeY = 209*height/1080;
  buttonY = int(825*resScaleY);

  homeX = int(35*resScaleX);
  homeY = int(40*resScaleY);
  homeSizeX = int(120*resScaleX);
  homeSizeY = int(100*resScaleY);

  page1 = true;

  imgFP = loadImage("frontPage.jpg");
  imgHow = loadImage("howDoesItWork.jpg");
  table = loadShape("Table.obj");
}

void draw() {
  if (page1) {
    pages.frontPage();
  }

  if (pageHow && homeAnim) {
    pages.goHome(imgHow);
  }

  if (pageHow && !homeAnim) {
    pages.pageChange(imgHow);
  }

  if (page3D) {
    background(255);
    lights();
    translations();
    rotateX(radians(180));
    shape(table);
  }
}

void touchMoved() {
  float x1 = mouseX-pmouseX;
  float y1 = mouseY-pmouseY;
  rotX += -y1 * 0.001;
  rotY += x1 * 0.001;
}

void translations() {
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
}

void mousePressed() {
  if (page1) {
    if (mouseX > 243*resScaleX && mouseX < 243*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      pageHow = true;
      println("touched");
    } else if (mouseX > 830*resScaleX && mouseX < 830*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 2");
    } else if (mouseX > 1420*resScaleX && mouseX < 1420*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 3");
    } else {
      println("nope");
    }
  } else {
    if (mouseX > homeX && mouseX < homeX+homeSizeX &&
      mouseY > homeY && mouseY < homeY+homeSizeY) {
      println("page 1");
      homeAnim = true;
      page1 = true;
    }
  }
}