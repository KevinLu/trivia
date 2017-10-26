PImage bg;
String q1, q2, q3;
String instructions, welcome, invalid, ver;
float c = 0; //c stands for COLOUR
int screen = -1;
int correct = 0; //screen when you get the answer correct
int offset = 0;
int timer = 0;
int incorrect = 0;
void settings() {
  size(600, 600);
}
void setup() {
  colorMode(HSB, 100);
  //QUESTIONS
  q1 = "How many oceans border Canada?";
  q2 = "Whose face is on the Canadian $100 bill?";
  q3 = "In which year was the Canadian flag adopted?";
  instructions = "Press keys 1 to 4 on your keyboard to select an answer!";
  welcome = "Welcome to TRIVIA";
  invalid = "INVALID ANSWER! \n PLEASE SELECT 1, 2, 3 or 4.";
  ver = "Canadian Trivia \n by Kevin Lu";
  bg = loadImage("Capture.PNG");
}
void draw() {
  //Very cool screens, screen 0 is the menu page

  //Splash Screen
  if (screen == -1) {
    timer++; //Using a timer
    image(bg, 0, 0);
    fill(0);
    textAlign(CENTER);
    textSize(45);
    for (int x = -1; x < 3; x++) {
      text(ver, (width/2)+x, height/2);
      text(ver, width/2, (height/2)+x);
    }
    fill(100);
    text(ver, width/2, height/2);
    if (timer == 1 * 60) { //1*60/60fps = 1 second of wait time
      screen = 0; //after timer hits 60, switch to screen 0.
    }
  }

  // Menu/Home Screen!
  else if (screen == 0) {
    fill((c = c + 0.1)%100, 100, 90);
    rect(0, 0, width, height);
    fill(0);
    textSize(width/10);
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
    textSize(width/18.75);
    text("START", width/2, height/1.375);
    if (keyPressed && key == ENTER || mouseX > 200 && mouseY > 400 && mousePressed && mouseX < 400 && mouseY < 450) {
      screen = 1;
    }
  } else if (screen == 1) { //just putting the entire thing here because I'm bad at processing (this is the 1st question)
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
    fill(25, 100, 90);
    rect(width/2, height/2, width/2, height/2);

    //4 Answers
    textAlign(CENTER);
    textSize(width/9.375);
    fill(100);
    text("1", width/4, height/4);
    text("2", width/4, height/1.25);
    text("3", width/1.3, height/4);
    text("4", width/1.3, height/1.25);

    //Display the question, colour it white, outline it black for visibility
    fill(0);
    textSize(width/27.27);
    for (int x = -1; x < 2; x++) {
      text(q1, (width/2)+x, height/2);
      text(q1, width/2, (height/2)+x);
    }
    fill(100);
    text(q1, width/2, height/2);
    //END draw question

    //Selecting the answer via Keyboard (1, 2, 3 ,4)
    if (keyPressed && key == '1') {
      textSize(width/37.5);
      fill(0);
      rect(0, 0, width/2, height/2);
      fill(55, 100, 100);
      text("Incorrect answer, please try again!", width/4, height/4);
      incorrect++;
      fill(0);
      //Redrawing the question so the rect doesn't cover it...
      textSize(width/27.27);
      for (int x = -1; x < 2; x++) {
        text(q1, (width/2)+x, height/2);
        text(q1, width/2, (height/2)+x);
      }
      fill(100);
      text(q1, width/2, height/2);
    } else if (keyPressed && key == '2') {
      textSize(width/37.5);
      fill(0);
      rect(0, height/2, width/2, height/2);
      fill(95, 100, 100);
      text("Incorrect answer, please try again!", width/4, height/1.3);
      incorrect++;
    } else if (keyPressed && key == '3') {
      textSize(width/37.5);
      fill(75, 100, 100);
      correct = 1;
    } else if (keyPressed && key == '4') {
      fill(0);
      textSize(width/37.5);
      rect(width/2, height/2, width/2, height/2);
      fill(25, 100, 90);
      text("Incorrect answer, please try again!", width/1.325, height/1.3);
      incorrect++;
      //Redrawing the question so the rect doesn't cover it...
      fill(0);
      textSize(width/27.27);
      for (int x = -1; x < 2; x++) {
        text(q1, (width/2)+x, height/2);
        text(q1, width/2, (height/2)+x);
      }
      fill(100);
      text(q1, width/2, height/2);
    } else if (keyPressed == true && key != BACKSPACE && key != ENTER && keyCode != CONTROL && keyCode != ALT && keyCode != SHIFT && keyCode != TAB && keyCode != RETURN && keyCode != ESC && keyCode != DELETE && keyCode != UP && keyCode != DOWN && keyCode != RIGHT && keyCode != LEFT) {
      textSize(width/18.75);
      fill(0);
      rect(0, 0, width, height);
      fill((c += 0.1)%100, 100, 100);
      text(invalid, width/2, height/2);
    } else { 
      textSize(width/37.5);
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
      textSize(width/18.75);
      text("Nice! This is the correct answer!", width/2, height/2);
      rect(width/3, height/1.5, 200, 50);
      textSize(width/24); //25
      fill(0);
      text("Next Question", width/2, height/1.375);
      if (keyPressed && key == ENTER || mousePressed && mouseX >= 200 && mouseY >= 400 && mouseX <= 400 && mouseY <= 450) {
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
    fill(25, 100, 90);
    rect(width/2, height/2, width/2, height/2);

    //4 Answers
    textAlign(CENTER);
    textSize(width/9.375);
    fill(100);

    text("1", width/4, height/4);
    textSize(width/24);
    text("\n Robert Borden", width/4, height/4);

    textSize(width/9.375);
    text("2", width/4, height/1.25);
    textSize(width/24);
    text("\n William Lyon Mackenzie", width/4, height/1.25);

    textSize(width/9.375);
    text("3", width/1.3, height/4);
    textSize(width/24);
    text("\n Lester B. Pearson", width/1.3, height/4);

    textSize(width/9.375);
    text("4", width/1.3, height/1.25);
    textSize(width/24);
    text("\n R. B. Bennet", width/1.3, height/1.25);

    //Display the question, colour it white, outline it black for visibility
    fill(0);
    textSize(width/27.27);
    for (int x = -1; x < 2; x++) {
      text(q2, (width/2)+x, height/2);
      text(q2, width/2, (height/2)+x);
    }
    fill(100);
    text(q2, width/2, height/2);
    //END draw question

    //Selecting the answer via Keyboard (1, 2, 3 ,4)
    if (keyPressed && key == '1') {
      correct = 2;
      fill(100);
      text(q2, width/2, height/2);
    } else if (keyPressed && key == '2') {
      textSize(16);
      fill(0);
      rect(0, height/2, width/2, height/2);
      fill(95, 100, 100);
      text("Incorrect answer, please try again!", width/4, height/1.3);
      incorrect++;
    } else if (keyPressed && key == '3') {
      textSize(16);
      fill(0);
      rect(width/2, 0, width/2, height/2);
      fill(75, 100, 100);
      text("Incorrect answer, please try again!", width/1.325, height/4);
      incorrect++;
      fill(0);
      textSize(width/27.27);
      for (int x = -1; x < 2; x++) {
        text(q2, (width/2)+x, height/2);
        text(q2, width/2, (height/2)+x);
      }
      fill(100);
      text(q2, width/2, height/2);
    } else if (keyPressed && key == '4') {
      fill(0);
      textSize(16);
      rect(width/2, height/2, width/2, height/2);
      fill(25, 100, 100);
      text("Incorrect answer, please try again!", width/1.325, height/1.3);
      incorrect++;
      //Redrawing the question so the rect doesn't cover it...
      fill(0);
      textSize(width/27.27);
      for (int x = -1; x < 2; x++) {
        text(q2, (width/2)+x, height/2);
        text(q2, width/2, (height/2)+x);
      }
      fill(100);
      text(q2, width/2, height/2);
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
    if (correct == 2) {
      fill(55, 100, 100);
      rect(0, 0, width, height);
      fill(100);
      textSize(32);
      text("You got it! On to the next one!", width/2, height/2);
      rect(width/3, height/1.5, 200, 50);
      textSize(25);
      fill(0);
      text("Next Question", width/2, height/1.375);
      if (keyPressed && key == ENTER || mousePressed && mouseX >= 200 && mouseY >= 400 && mouseX <= 400 && mouseY <= 450) {
        screen = 3;
      }
    }
  } 
  if (screen == 3) {
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
    fill(25, 100, 90);
    rect(width/2, height/2, width/2, height/2);


    //4 Answers
    textAlign(CENTER);
    textSize(width/9.375);
    fill(100);

    text("1", width/4, height/4);
    textSize(width/24);
    text("\n1976", width/4, height/4);

    textSize(width/9.375);
    text("2", width/4, height/1.25);
    textSize(width/24);
    text("\n1965", width/4, height/1.25);

    textSize(width/9.375);
    text("3", width/1.3, height/4);
    textSize(width/24);
    text("\n1867", width/1.3, height/4);

    textSize(width/9.375);
    text("4", width/1.3, height/1.25);
    textSize(width/24);
    text("\n1982", width/1.3, height/1.25);

    //Display the question, colour it white, outline it black for visibility
    fill(0);
    textSize(width/27.27);
    for (int x = -1; x < 2; x++) {
      text(q3, (width/2)+x, height/2);
      text(q3, width/2, (height/2)+x);
    }
    fill(100);
    text(q3, width/2, height/2);
    //END draw question

    //Selecting the answer via Keyboard (1, 2, 3 ,4)
    if (keyPressed && key == '1') {
      textSize(width/37.5);
      fill(0);
      rect(0, 0, width/2, height/2);
      fill(55, 100, 100);
      text("Incorrect answer, please try again!", width/4, height/4);
      incorrect++;
      fill(0);
      //Redrawing the question so the rect doesn't cover it...
      textSize(width/27.27);
      for (int x = -1; x < 2; x++) {
        text(q3, (width/2)+x, height/2);
        text(q3, width/2, (height/2)+x);
      }
      fill(100);
      text(q3, width/2, height/2);
    } else if (keyPressed && key == '2') {
      correct = 3;
      textSize(16);
      fill(0);
      rect(0, height/2, width/2, height/2);
      fill(95, 100, 100);
      text("Correct answer!", width/4, height/1.3);
    } else if (keyPressed && key == '3') {
      textSize(16);
      fill(0);
      rect(width/2, 0, width/2, height/2);
      fill(75, 100, 100);
      text("Incorrect answer, please try again!", width/1.325, height/4);
      incorrect++;
      //Redrawing the question so the rect doesn't cover it...
      fill(0);
      textSize(width/27.27);
      for (int x = -1; x < 2; x++) {
        text(q3, (width/2)+x, height/2);
        text(q3, width/2, (height/2)+x);
      }
      fill(100);
      text(q3, width/2, height/2);
    } else if (keyPressed && key == '4') {
      fill(0);
      textSize(16);
      rect(width/2, height/2, width/2, height/2);
      fill(25, 100, 100);
      text("Incorrect answer, please try again!", width/1.325, height/1.3);
      incorrect++;
      //Redrawing the question so the rect doesn't cover it...
      fill(0);
      textSize(width/27.27);
      for (int x = -1; x < 2; x++) {
        text(q3, (width/2)+x, height/2);
        text(q3, width/2, (height/2)+x);
      }
      fill(100);
      text(q3, width/2, height/2);
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
    if (correct == 3) {
      fill(55, 100, 100);
      rect(0, 0, width, height);
      fill(100);
      textSize(32);
      text("Wow! Good job!", width/2, height/2);
      rect(width/3, height/1.5, 200, 50);
      textSize(21);
      fill(0);
      text("Complete the Quiz", width/2, height/1.375);
      if (mousePressed && mouseX >= 200 && mouseY >= 400 && mouseX <= 400 && mouseY <= 450) {
        screen = 4;
      } else if (keyPressed && key == ENTER) {
        screen = 4;
        delay(100);
      }
    }
  } else if (screen == 4) {
    background(100); //use a background for smooth text
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("You've completed the trivia! \n Congratulations!", width/2, height/2);
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/1.3, 100, 50);
    textSize(32);
    fill(100);
    text("Exit", width/2, height/1.27);
    fill(0);
    textSize(16);
    text("Click or press ENTER", width/2, height/1.15);
    if (keyPressed && key == ENTER || mousePressed && mouseX >= 250 && mouseY >= 435 && mouseX <= 350 && mouseY <= 485) {
      exit();
    }
  }
  if (incorrect > 250) {
    screen = 5; //the death screen :O
  }
  if (screen == 5) {
    background(100);
    textAlign(CENTER);
    fill(0);
    textSize(32);
    text("You have answered\nincorrectly too many times.\nPlease try again.", width/2, height/2);
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/1.3, 100, 50);
    textSize(32);
    fill(100);
    text("Exit", width/2, height/1.27);
    fill(0);
    textSize(16);
    text("Click or press ENTER", width/2, height/1.15);
    if (keyPressed && key == ENTER || mousePressed && mouseX >= 250 && mouseY >= 435 && mouseX <= 350 && mouseY <= 485) {
      exit();
    }
  }
  //debug codes
  //fill(100);
  //textSize(12);
  //textAlign(LEFT);
  //text("x: " + mouseX +" " + "y:" + mouseY, 0, 12); //mouse coordinates
  //text(incorrect, 0, 24); //how many incorrect counts
}
