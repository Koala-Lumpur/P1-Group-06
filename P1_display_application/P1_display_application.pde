PShape temple; //3D object

//images for the program
PImage imgFP, imgObjView; 
PImage imgBeforeQuiz, imgQuiz;
PImage imgQuizCorrect, imgQuizWrong;
PImage imgBeforeClassroom, imgClassroom;
PImage homeIcon, showObjectButton;
PImage book;

color bgColor = color(107, 146, 155); //background color as a variable

float resScaleX, resScaleY; //rescale according to screen sizes
float rotY;

//variables for button sizes and location
int buttonSizeX, buttonSizeY;
int buttonY;
int homeX, homeY, homeSizeX, homeSizeY;

//boolean statements to know what site you are in and what pageshift to perform
boolean frontPage;
boolean pageObjView, page3D;
boolean beforeQuizPage, quizPage;
boolean quizWrong, quizCorrect;
boolean beforeClassPage, classPage;
boolean homeAnim, backAnim, backAnimDone;

//boolean for the rotation of the object
boolean modelPressed, modelNotPressed = true;

Pages pages = new Pages();
ButtonPress buttons = new ButtonPress();

void setup() {
  frameRate(60);
  background(0);
  orientation(LANDSCAPE);
  fullScreen(P3D);
  
  fill(0);

  //assigning number to the rescale variables
  resScaleX = float(width)/2048;
  resScaleY = float(height)/1536;

  //assigning number to the button sizes on the home page
  buttonSizeX = int(289*resScaleX);
  buttonSizeY = int(245*resScaleY);
  buttonY = int(1225*resScaleY);
  
  //assigning number to the home button size and position
  homeX = int(30*resScaleX);
  homeY = int(20*resScaleY);
  homeSizeX = int(120*resScaleX);
  homeSizeY = int(130*resScaleY);

  frontPage = true; 

  //Load images and the 3D model and assigning to a variable
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

  if (frontPage) { //if this is true, show home page
    pages.frontPage();
  }

  if (pageObjView && homeAnim) { //if the home button on object viewer page is pressed, call the goHome function on that page
    pages.goHome(imgObjView);
  }

  if (pageObjView && !homeAnim) { //if other button then the home button is pressed on the object viewer, call the pageChange function on that page
    pages.pageChange(imgObjView);
    //rect(629*resScaleX, 640*resScaleY, 750*resScaleX, 252*resScaleY);
  }

  if (page3D) { //if this is true, show the 3d model page
    page3DModel();
    //rect(1440*resScaleX, 100*resScaleY, 500*resScaleX, 245*resScaleY);
  }

  if (beforeQuizPage && homeAnim) { //if the home button on the quiz information page is pressed, call the goHome function on that page
    pages.goHome(imgBeforeQuiz);
  }

  if (beforeQuizPage && !homeAnim) { //if the home button is not pressed on the quiz information page
    if (backAnim) { //if it's the back animation function, load the quiz information page
      image(imgBeforeQuiz, 0, 0, width, height);
    } else if (backAnimDone) { //else if the back animation is done, set the x and y of the page to width and height
      pages.animX = width;
      pages.animY = height;
      backAnimDone = false;
    } else { //else call the pageChange function on the quiz information page
      pages.pageChange(imgBeforeQuiz);
    }
    //rect(195*resScaleX, 570*resScaleY, 432*resScaleX, 280*resScaleY);
  }

  if (quizPage && backAnim) { //if the back button on the quiz information page is pressed, call the goBack function on that page
    pages.goBack(imgQuiz);
  }

  if (quizPage && !backAnim) {//if the home button is not pressed on the quiz page, call the animation from the middle function on that page
    pages.animMiddle(imgQuiz);
  }
  
  if(quizWrong) { //if the user chooses the wrong answer in the quiz, show the quiz wrong page
    image(imgQuizWrong, 0, 0, width, height);
    println("wrong");
  }
  
   if(quizCorrect && !homeAnim) { //if the home button is not pressed on the quiz correct page, show the quiz correct page
    image(imgQuizCorrect, 0, 0, width, height);
    println("correct");
  }
  
  if(quizCorrect && homeAnim) { //if the home button on the quiz correct page is pressed, call the goHome function on that page
    pages.goHome(imgQuizCorrect);
  }

  if (beforeClassPage && !homeAnim) { //if the home button is not pressed on the classroom information page
    if (backAnim) { //if it's the back animation function, load the classroom information page
      image(imgBeforeClassroom, 0, 0, width, height);
    } else if (backAnimDone) { //else if the back animation is done, set the x and y of the page to width and height
      pages.animX = width;
      pages.animY = height;
      backAnimDone = false;
    } else { //else call the pageChange function on the classroom information page
      pages.pageChange(imgBeforeClassroom);
    }
  }

  if (beforeClassPage && homeAnim) { //if the home button on the classroom information page is pressed, call the goHome function on that page
    pages.goHome(imgBeforeClassroom);
  }
  
  if(classPage && backAnim) {//if the back button on the classroom information page is pressed, call the goBack function on that page
    pages.goBack(imgClassroom);
  }
  
  if (classPage && !backAnim) { //if the home button is not pressed on the classroom page, show the classroom page
    pages.animMiddle(imgClassroom);
  }
}

//function control the 3d object by dragging
void mouseDragged() {
  if (temple.isVisible()) {
    float x1 = mouseX-pmouseX; 
    rotY += -x1 * 0.002;
  }
}

void mousePressed() {
  if (frontPage) { //if the home page is visible
    buttons.frontPage(); //make buttons on home page active
  } else {
    buttons.homeButton(); //else make the home/back button available
  }

  if (pageObjView) { //if the object viewer page is visible
    buttons.pageObjectViewer(); //make buttons on object viewer page active
  }

  if (page3D) { //if the 3d model page is visible
    if (!modelNotPressed) { 
      modelPressed = true;
    }
    if (modelNotPressed) {
      modelPressed = false;
      modelNotPressed = false;
    }
    if (mouseX > 1440*resScaleX && mouseX < 1440*resScaleX+500 &&  //if this button is pressed
      mouseY > 100*resScaleY && mouseY < 100+245*resScaleY) {
      showModel(); //show model
    }
  }

  if (beforeQuizPage) { //if the quiz information page is visible 
    buttons.quizContinue(); //make button on quiz information page active
  }

  if (quizPage) { //if the quiz page is visible
    buttons.quizAnswer(); //make buttons on the quiz page active
  }
  
  if(beforeClassPage) { //if the classroom information page is visible
    buttons.classContinue(); //make button on classroom information page active
  }
}

void page3DModel() { //function for 3d model page
  background(0); //set the background temporarily black, 
  image(book, 0, 0, width, height); //load book image
  text(int(frameRate), 2000*resScaleX, 50*resScaleY); //display frame rate in the upper right corner
  lights(); //import lights for the model
  pushMatrix();
  translations(); //translations for the model
  rotateX(radians(180)); //set the avaible x axis rotation
  shape(temple); //display model
  popMatrix();
  image(homeIcon, homeX*resScaleX, homeY+10*resScaleY, 105*resScaleX, 105*resScaleY); //display home icon
  image(showObjectButton, 1440*resScaleX, 100*resScaleY, 500*resScaleX, 245*resScaleY); //display show object button
  if (!modelPressed) {
    rotY += radians(1);
  }
}

void translations() {
  translate(1300*resScaleX, 900*resScaleY, 300);
  scale(10);
  ambientLight(128, 128, 128);
  directionalLight(128, 128, 128, 0, 0, -1);
  rotateY(rotY);
}

void showModel() {
  if (temple.isVisible()) {
    temple.setVisible(false);
  } else {
    temple.setVisible(true);
  }
}