PShape temple;
PImage imgFP, imgObjView;
PImage homeIcon;
PImage book;

float resScaleX, resScaleY;

int buttonSizeX, buttonSizeY;
int buttonY;
int homeX, homeY, homeSizeX, homeSizeY;

float rotX, rotY;

boolean frontPage, pageObjView, page3D, homeAnim;

Pages pages = new Pages();

void setup() {
  frameRate(60);
  background(0);
  orientation(LANDSCAPE);
  fullScreen(P3D);

  resScaleX = float(width)/2048;
  resScaleY = float(height)/1536;

  buttonSizeX = int(289*resScaleX);
  buttonSizeY = int(245*resScaleY);
  buttonY = int(1225*resScaleY);

  homeX = int(30*resScaleX);
  homeY = int(20*resScaleY);
  homeSizeX = int(120*resScaleX);
  homeSizeY = int(130*resScaleY);

  frontPage = true;

  imgFP = loadImage("FrontPage.jpg");
  imgObjView = loadImage("ObjectViewer1.jpg");
  homeIcon = loadImage("HouseIcon.png");
  book = loadImage("FakeBook.jpg");
  temple = loadShape("Temple.obj");
}

void draw() {

  //rect(407*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  //rect(885*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  //rect(1440*resScaleX, 200*resScaleY, 289*resScaleX, 245*resScaleY);

  if (frontPage) {
    background(255);
    pages.frontPage();
  }

  if (pageObjView && homeAnim) {
    pages.goHome(imgObjView);
  }

  if (pageObjView && !homeAnim) {
    pages.pageChange(imgObjView);
  }

  if (page3D) {
    background(0);
    image(book, 0, 0, width, height);
    text(int(frameRate), 2000*resScaleX, 50*resScaleY); 
    lights();
    pushMatrix();
    translations();
    rotateX(radians(180));
    shape(temple);
    popMatrix();
    image(homeIcon, homeX*resScaleX, homeY+10*resScaleY, 105*resScaleX, 81*resScaleY);
    fill(255);
    rect(1440*resScaleX, 100*resScaleY, 500*resScaleX, 245*resScaleY);
  }

  fill(0);
  textSize(30);
  text(int(frameRate), 2000*resScaleX, 50*resScaleY);

  //rect(homeX, homeY, homeSizeX,homeSizeY);
}

void mouseDragged() {
  if(temple.isVisible()) {
  float x1 = mouseX-pmouseX;
  float y1 = mouseY-pmouseY;
  rotX += -y1 * 0.002;
  rotY += x1 * 0.002;
  }
}

void translations() {
  translate(1300*resScaleX, 900, 300);
  scale(10);
  ambientLight(128, 128, 128);
  directionalLight(128, 128, 128, 0, 0, -1);
  //rotateX(rotX);
  rotateY(rotY);
}

void mousePressed() {
  if (frontPage) {
    if (mouseX > 407*resScaleX && mouseX < 407*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      pageObjView = true;
      println("touched");
    } else if (mouseX > 885*resScaleX && mouseX < 885*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 2");
      frontPage = false;
      page3D = true;
    } else if (mouseX > 1440*resScaleX && mouseX < 1440*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 3");
    } else {
      println("nope");
    }
  } else {
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

  if (page3D) {
    if (mouseX > 1440*resScaleX && mouseX < 1440*resScaleX+500 && 
      mouseY > 100*resScaleY && mouseY < 100+245*resScaleY) {
      showModel();
    }
  }
}

void showModel() {
  if (temple.isVisible()) {
    temple.setVisible(false);
  } else {
    temple.setVisible(true);
  }
}