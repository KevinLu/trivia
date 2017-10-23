String q1, q2, q3;
String instructions, welcome;
float c = 0; //c stands for COLOUR
int screen = 0;
int correct = 0; //screen when you get the answer correct
int offset = 0;
void settings() {
  size(600, 600);
}
void setup() {
  background(0);
  colorMode(HSB, 100);
  //QUESTIONS
  q1 = "How many oceans border Canada?";
  q2 = "Whose face is on the Canadian $100 bill?";
  q3 = "In which year was the Canadian flag adopted?";
  instructions = "Press keys 1 to 4 on your keyboard or use your mouse to select an answer!";
  welcome = "Welcome to TRIVIA";
}
//void mousePressed() {
//  Set the screen when whatever happens that you want to happen
//  screen = min(screen + 1, 3);
//}
void draw() {
  //Very cool screens, screen 0 is the menu page
  if (screen == 0) {
    fill((c = c + 0.1)%100, 100, 90);
    rect(0, 0, width, height);
    fill(0);
    textSize(60);
    textAlign(CENTER);
    for (int x = -1; x < 2; x++) {
      text(welcome, (width/2)+x, height/2);
      text(welcome, width/2, (height/2)+x);
    }
    fill(100);
    text(welcome, width/2, height/2);
    fill(90);
    rect(width/3, height/1.5, 200, 50);
    fill(0);
    textSize(32);
    text("START", width/2, height/1.375);
    if (mouseX > 200 && mouseY > 400 && mousePressed && mouseX < 400 && mouseY < 450) {
      screen = 1;
    }
  } else if (screen == 1) { //just putting the entire thing here because I'm bad at processing
    //Display the 4 squares
    noStroke();
    //Square "A"
    fill(55, 100, 100);
    rect(0, 0, width/2, height/2);
    //Square "B"
    fill(75, 100, 100);
    rect(width/2, 0, width/2, height/2);
    //Square "C"
    fill(95, 100, 100);
    rect(0, height/2, width/2, height/2);
    //Square "D"
    fill(25, 100, 100);
    rect(width/2, height/2, width/2, height/2);

    //4 Answers
    textAlign(CENTER);
    textSize(64);
    fill(100);
    text("1", width/4, height/4);
    text("2", width/4, height/1.25);
    text("3", width/1.3, height/4);
    text("4", width/1.3, height/1.25);

    //Display the question, colour it white, outline it black for visibility
    fill(0);
    textSize(22);
    for (int x = -1; x < 2; x++) {
      text(q1, (width/2)+x, height/2);
      text(q1, width/2, (height/2)+x);
    }
    fill(100);
    text(q1, width/2, height/2);
    //END draw question

    //Selecting the answer via Keyboard (1, 2, 3 ,4)
    if (keyPressed && key == '1') {
      textSize(16);
      fill(0);
      rect(0, 0, width/2, height/2);
      fill(55, 100, 100);
      text("Incorrect answer, please try again!", width/4, height/4);
      fill(0);
      //Redrawing the question so the rect doesn't cover it...
      textSize(22);
      for (int x = -1; x < 2; x++) {
        text(q1, (width/2)+x, height/2);
        text(q1, width/2, (height/2)+x);
      }
      fill(100);
      text(q1, width/2, height/2);
    } else if (keyPressed && key == '2') {
      textSize(16);
      fill(0);
      rect(0, height/2, width/2, height/2);
      fill(95, 100, 100);
      text("Incorrect answer, please try again!", width/4, height/1.3);
    } else if (keyPressed && key == '3') {
      textSize(16);
      fill(75, 100, 100);
      correct = 1;
    } else if (keyPressed && key == '4') {
      fill(0);
      textSize(16);
      rect(width/2, height/2, width/2, height/2);
      fill(25, 100, 100);
      text("Incorrect answer, please try again!", width/1.3, height/1.3);
      //Redrawing the question so the rect doesn't cover it...
      fill(0);
      textSize(22);
      for (int x = -1; x < 2; x++) {
        text(q1, (width/2)+x, height/2);
        text(q1, width/2, (height/2)+x);
      }
      fill(100);
      text(q1, width/2, height/2);
    } else if (keyPressed == true && key != BACKSPACE && key != ENTER && keyCode != CONTROL && keyCode != ALT && keyCode != SHIFT && keyCode != TAB && keyCode != RETURN && keyCode != ESC && keyCode != DELETE && keyCode != UP && keyCode != DOWN && keyCode != RIGHT && keyCode != LEFT) {
      textSize(32);
      fill(0);
      rect(0, 0, width, height);
      fill((c += 0.1)%100, 100, 100);
      text("INVALID ANSWER! \n PLEASE SELECT 1, 2, 3 or 4.", width/2, height/2);
    } else { 
      textSize(16);
      fill((c = c + 0.1)%100, 100, 100);
      for (int x = -1; x < 3; x++) {
        text(instructions, (width/2) + x, height/1.05);
        text(instructions, width/2, (height/1.05) + x);
      }
      fill(c = c + 0.25);
      text(instructions, width/2, height/1.05);
    }
    if (correct == 1) {
      fill(75, 100, 100);
      rect(0, 0, width, height);
      fill(100);
      textSize(32);
      text("Nice! This is the correct answer!", width/2, height/2);
      rect(width/3, height/1.5, 200, 50);
      textSize(25);
      fill(0);
      text("Next Question", width/2, height/1.375);
      if (mousePressed && mouseX >= 200 && mouseY >= 400 && mouseX <= 400 && mouseY <= 450) {
        screen = 2;
      }
    }
  } 
  if (screen == 2) {
    //Display the 4 squares
    //Square "A"
    fill(55, 100, 100);
    rect(0, 0, width/2, height/2);
    //Square "B"
    fill(75, 100, 100);
    rect(width/2, 0, width/2, height/2);
    //Square "C"
    fill(95, 100, 100);
    rect(0, height/2, width/2, height/2);
    //Square "D"
    fill(25, 100, 100);
    rect(width/2, height/2, width/2, height/2);
  }
  //debug codes
  fill(100);
  textSize(12);
  textAlign(LEFT);
  text("x: " + mouseX +" " + "y:" + mouseY, 0, 12); //mouse coordinates
}