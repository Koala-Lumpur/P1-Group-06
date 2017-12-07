PShape temple;
PImage imgFP, imgObjView; 
PImage imgBeforeQuiz, imgQuiz;
PImage imgQuizCorrect, imgQuizWrong;
PImage imgBeforeClassroom, imgClassroom;
PImage homeIcon, showObjectButton;
PImage book;

color bgColor = color(107, 146, 155);

float resScaleX, resScaleY;

int buttonSizeX, buttonSizeY;
int buttonY;
int homeX, homeY, homeSizeX, homeSizeY;

float rotX, rotY;

boolean frontPage;
boolean pageObjView, page3D;
boolean beforeQuizPage, quizPage;
boolean quizWrong, quizCorrect;
boolean beforeClassPage, classPage;
boolean homeAnim, backAnim, backAnimDone;

boolean modelPressed, modelNotPressed = true;

Pages pages = new Pages();
ButtonPress buttons = new ButtonPress();

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

  //Load images and the 3D model
  imgFP = loadImage("FrontPage.jpg");
  imgObjView = loadImage("ObjectViewer.jpg");
  imgBeforeQuiz = loadImage("BeforeQuizPage.jpg");
  imgQuiz = loadImage("QuizPage.jpg");
  imgQuizCorrect = loadImage("QuizPageCorrect.jpg");
  imgQuizWrong = loadImage("QuizPageWrong.jpg");
  imgBeforeClassroom = loadImage("BeforeClassroomPage3.jpg");
  imgClassroom = loadImage("Classroom.jpg");
  homeIcon = loadImage("HouseIcon.png");
  showObjectButton = loadImage("VisObjekt.jpg");
  book = loadImage("FakeBook.jpg");
  temple = loadShape("Temple.obj");
}

void draw() {

  //rect(407*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  //rect(885*resScaleX, 1225*resScaleY, 289*resScaleX,245*resScaleY);
  //rect(1440*resScaleX, 200*resScaleY, 289*resScaleX, 245*resScaleY);

  if (frontPage) {
    pages.frontPage();
  }

  if (pageObjView && homeAnim) {
    pages.goHome(imgObjView);
  }

  if (pageObjView && !homeAnim) {
    pages.pageChange(imgObjView);
    //rect(629*resScaleX, 640*resScaleY, 750*resScaleX, 252*resScaleY);
  }

  if (page3D) {
    page3DModel();
    //rect(1440*resScaleX, 100*resScaleY, 500*resScaleX, 245*resScaleY);
  }

  if (beforeQuizPage && homeAnim) {
    pages.goHome(imgBeforeQuiz);
  }

  if (beforeQuizPage && !homeAnim) {
    println("beforeQuiz");
    if (backAnim) {
      println("backanim");
      image(imgBeforeQuiz, 0, 0, width, height);
    } else if (backAnimDone) {
      pages.animX = width;
      pages.animY = height;
      backAnimDone = false;
    } else {
      pages.pageChange(imgBeforeQuiz);
    }
    //rect(195*resScaleX, 570*resScaleY, 432*resScaleX, 280*resScaleY);
  }

  if (quizPage && backAnim) {
    pages.goBack(imgQuiz);
  }

  if (quizPage && !backAnim) {
    pages.animMiddle(imgQuiz);
      noFill();
    rect(457*resScaleX, 525*resScaleY, 1130*resScaleX, 135*resScaleY);
    rect(457*resScaleX, 825*resScaleY, 1130*resScaleX, 135*resScaleY);
    rect(457*resScaleX, 1125*resScaleY, 1130*resScaleX, 135*resScaleY);
  }
  
  if(quizWrong) {
    image(imgQuizWrong, 0, 0, width, height);
    println("wrong");
  }
  
   if(quizCorrect) {
    image(imgQuizCorrect, 0, 0, width, height);
    println("correct");
  }

  if (beforeClassPage && !homeAnim) {
    pages.pageChange(imgBeforeClassroom);
  }

  if (beforeClassPage && homeAnim) {
    pages.goHome(imgBeforeClassroom);
  }


  if (classPage) {
  }

  fill(0);
  textSize(30);
  text(int(frameRate), 2000*resScaleX, 50*resScaleY);

  //rect(homeX, homeY, homeSizeX,homeSizeY);
}

void mouseDragged() {
  if (temple.isVisible()) {
    float x1 = mouseX-pmouseX;
    float y1 = mouseY-pmouseY;
    rotX += -y1 * 0.002;
    rotY += x1 * 0.002;
  }
}

void mousePressed() {
  if (frontPage) {
    buttons.frontPage();
  } else {
    buttons.homeButton();
  }

  if (pageObjView) {
    buttons.pageObjectViewer();
  }

  if (page3D) {
    if (!modelNotPressed) {
      modelPressed = true;
    }
    if (modelNotPressed) {
      modelPressed = false;
      modelNotPressed = false;
    }
    if (mouseX > 1440*resScaleX && mouseX < 1440*resScaleX+500 && 
      mouseY > 100*resScaleY && mouseY < 100+245*resScaleY) {
      showModel();
    }
  }

  if (beforeQuizPage) {
    buttons.quizContinue();
  }

  if (quizPage) {
    buttons.quizAnswer();
  }
}

void page3DModel() {
  background(0);
  image(book, 0, 0, width, height);
  text(int(frameRate), 2000*resScaleX, 50*resScaleY); 
  lights();
  pushMatrix();
  translations();
  rotateX(radians(180));
  shape(temple);
  popMatrix();
  image(homeIcon, homeX*resScaleX, homeY+10*resScaleY, 105*resScaleX, 105*resScaleY);
  image(showObjectButton, 1440*resScaleX, 100*resScaleY, 500*resScaleX, 245*resScaleY);
  if (!modelPressed) {
    rotY += radians(1);
  }
}

void translations() {
  translate(1300*resScaleX, 900*resScaleY, 300);
  scale(10);
  ambientLight(128, 128, 128);
  directionalLight(128, 128, 128, 0, 0, -1);
  //rotateX(rotX);
  rotateY(rotY);
}

void showModel() {
  if (temple.isVisible()) {
    temple.setVisible(false);
  } else {
    temple.setVisible(true);
  }
}