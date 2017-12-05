PShape temple;
PImage imgFP, imgHow;

float resScaleX, resScaleY;

int buttonSizeX, buttonSizeY;
int buttonY;
int homeX, homeY, homeSizeX, homeSizeY;

float rotX, rotY;

float heightScale;
int heightScalePos = 0;

boolean page1, pageHow, page3D, homeAnim;

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

  homeX = int(35*resScaleX);
  homeY = int(40*resScaleY);
  homeSizeX = int(120*resScaleX);
  homeSizeY = int(100*resScaleY);

  page1 = true;

  imgFP = loadImage("FrontPage.jpg");
  imgHow = loadImage("howDoesItWork.jpg");
  temple = loadShape("Temple.obj");
}

void draw() {
  
  rect(407*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  rect(885*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  rect(1440*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  
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
    disableMaterial();
    text(int(frameRate), 2000*resScaleX, 50*resScaleY); 
    
    lights();
    translations();
    rotateX(radians(180));
    shape(temple);
  }
  
  fill(0);
  textSize(30);
  text(int(frameRate), 2000*resScaleX, 50*resScaleY); 
}

void mouseDragged() {
  float x1 = mouseX-pmouseX;
  float y1 = mouseY-pmouseY;
  rotX += -y1 * 0.001;
  rotY += x1 * 0.001;
}

void translations() {
  translate(width/2, height/1.5);
  scale(25);
  ambientLight(128,128,128);
  directionalLight(128, 128, 128, 0, 0, -1);
  rotateX(rotX);
  rotateY(rotY);
}

void mousePressed() {
  if (page1) {
    if (mouseX > 407*resScaleX && mouseX < 407*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      pageHow = true;
      println("touched");
    } else if (mouseX > 830*resScaleX && mouseX < 830*resScaleX+buttonSizeX && 
      mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
      println("touched 2");
      page3D = true;
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
void disableMaterial() {}

void enableTexture() {}