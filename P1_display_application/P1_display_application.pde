import processing.sound.*;

PShape temple;
PImage imgFP, img3D;
PImage homeIcon;

float resScaleX, resScaleY;

int buttonSizeX, buttonSizeY;
int buttonY;
int homeX, homeY, homeSizeX, homeSizeY;

float rotX, rotY;

float heightScale;
int heightScalePos = 0;

boolean page1, pageHow, page3D, homeAnim;
boolean music;
SoundFile Lyre_Music;

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

  page1 = true;

  imgFP = loadImage("FrontPage.jpg");
  img3D = loadImage("ObjectViewer1.jpg");
  homeIcon = loadImage("homeIcon.png");
  temple = loadShape("Temple.obj");

  Lyre_Music = new SoundFile(this, "Lyre_Music.mp3");
}

void draw() {

  //rect(407*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  //rect(885*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  //rect(1440*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);

  if (page1) {
    background(255);
    pages.frontPage();
  }

  if (pageHow && homeAnim) {
    pages.goHome(img3D);
  }

  if (pageHow && !homeAnim) {
    pages.pageChange(img3D);
  }

  if (page3D) {
    background(255);
    text(int(frameRate), 2000*resScaleX, 50*resScaleY); 
    lights();
    pushMatrix();
    translations();
    rotateX(radians(180));
    shape(temple);
    popMatrix();
    image(homeIcon, homeX, homeY);
    if (!music) {
      Lyre_Music.play();
      music = true;
    }
    } else {
      Lyre_Music.stop();
      music = false;
    }
    fill(0);
    textSize(30);
    text(int(frameRate), 2000*resScaleX, 50*resScaleY);

    //rect(homeX, homeY, homeSizeX,homeSizeY);
  }

  void mouseDragged() {
    float x1 = mouseX-pmouseX;
    float y1 = mouseY-pmouseY;
    rotX += -y1 * 0.002;
    rotY += x1 * 0.002;
  }

  void translations() {
    translate(width/2, height/1.5);
    scale(20);
    ambientLight(128, 128, 128);
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
      } else if (mouseX > 885*resScaleX && mouseX < 885*resScaleX+buttonSizeX && 
        mouseY > buttonY && mouseY < buttonY+buttonSizeY) {
        println("touched 2");
        page1 = false;
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
          page1 = true;
        } else {
          page3D = false;
          page1 = true;
        }
      }
    }
  }