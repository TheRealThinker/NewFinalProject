// Rooster Riot
// Made by Sam

PImage[] rooster = new PImage[8];

PImage storeKeep;

PImage startRooster;

PImage farmer;

PImage fightVS;

PImage feedpic;
int feed;

PImage steroidpic;
int steroids;

PImage antibioticspic;
int antibiotics;

PImage charm;
int charms;

PFont title;

PFont text;

PFont desc;

int gameScreen;

int frames;

int money;

int baseSkill;

int roosterPic;

String ending;

String roosterName1;
String roosterName2;
String roosterName3;

float nameGen1;
float nameGen2;
float nameGen3;

Boolean debtEnding;

void setup() {

  storeKeep = loadImage("chadrooster.png");
  startRooster = loadImage("startrooster.png");
  feedpic = loadImage("feed.png");
  steroidpic = loadImage("steroids.jpeg");
  antibioticspic = loadImage("antibiotics.jpg");
  charm = loadImage("charm.jpg");
  farmer = loadImage("farmer.jpg");
  fightVS = loadImage("vs.jpg");

  rooster[0] = loadImage("rooster1.png");
  rooster[1] = loadImage("rooster2.png");
  rooster[2] = loadImage("rooster3.png");
  rooster[3] = loadImage("rooster4.png");
  rooster[4] = loadImage("rooster5.png");
  rooster[5] = loadImage("rooster6.png");
  rooster[6] = loadImage("rooster7.png");
  rooster[7] = loadImage("rooster8.png");

  title = loadFont("BernardMT-Condensed-48.vlw");
  text = loadFont("BernardMT-Condensed-28.vlw");
  desc = loadFont("BernardMT-Condensed-18.vlw");

  money = 1500;
  feed = 3;
  steroids = 0;
  antibiotics = 2;
  charms = 0;
  baseSkill = 50;


  ending = "null";

  debtEnding = false;


  size(1200, 700);
}

void draw() {
  background(0);

  imageMode(CENTER);
  textAlign(CENTER);


  textFont(title, 60);

  // Start screen
  if (gameScreen == 0) {

    fill(255);
    text("Rooster Riot", 600, 200);
    image(startRooster, 600, 400);
    rect(350, 550, 500, 100);
    fill(#AD2D2D);
    text("Hit Enter to continue", 600, 625);

    if (keyCode == ENTER || keyCode == RETURN) {
      gameScreen += 1;
      clear();
    }
  }

  // Guide screen
  if (gameScreen == 1) {
    fill(#AD2D2D);
    text("Instructions: PLEASE READ", 600, 50);
    fill(255);
    textFont(text, 28);
    text("You are a aspiring rooster fighter, looking to make a name for yourself.", 600, 150);
    text("In order to become famous, you must compete in Rooster Riots.", 600, 250);
    text("You must maintain a healthy fighting rooster to participate in these fights.", 600, 350);
    text("Earn enough money to live the rest of your life in House Rooster.", 600, 450);
    text("Good luck!", 600, 550);
    text("Hit ALT to begin!", 600, 675);

    if (keyCode == ALT) {
      gameScreen += 1;
      clear();
    }
  }

  // Main menu screen
  if (gameScreen == 2) {
    fill(255);
    textFont(text, 28);
    text("Money: $" +money, 100, 40);
    debt();

    rect(75, 550, 150, 50);
    fill(0);
    text("Shop", 150, 585);

    if (mousePressed) {
      if (abs(mouseX-150)<75 && abs(mouseY-585)<75) {
        gameScreen = 3;
        clear();
      }
    }

    // Chicken shop button
    fill(255);
    rect(275, 550, 150, 50);
    fill(0);
    text("The Coop", 350, 585);
    if (mousePressed) {
      if (abs(mouseX-350)<75 && abs(mouseY-585)<100) {
        gameScreen = 4;
        clear();
      }
    }

    // Roster button
    fill(255);
    rect(925, 550, 150, 50);
    fill(0);
    text("Your Chicken", 1000, 585);


    // Option button
    fill(255);
    rect(975, 20, 150, 50);
    fill(0);
    text("Option", 1050, 55);


    fill(255);
    rect(450, 350, 300, 100);
    textFont(title, 60);
    fill(0);
    text("RIOT!", 600, 425);
  }

  // Shop
  if (gameScreen == 3) {
    textFont(text, 28);
    text("Money: $" +money, 100, 40);
    debt();


    rect(1000, 55, 150, 50);
    fill(0);
    text("Back", 1075, 90);


    rect(100, 620, 150, 50);
    fill(0);
    image(storeKeep, 50, 300, 350, 350);

    textFont(text, 28);
    fill(255);
    text("Welcome to my shop! Please, look around!", 350, 100);

    // Feed
    image(feedpic, 400, 250, 100, 100);
    textFont(desc, 18);
    text("Chicken Feed", 400, 350);
    text("$100", 400, 375);
    text("Heals injuries", 400, 400);
    text("Inventory: " +feed, 400, 450);

    image(steroidpic, 550, 250, 100, 100);
    textFont(desc, 18);
    text("Illegal Steroids", 550, 350);
    text("$300", 550, 375);
    text("Increases skill", 550, 400);
    text("Inventory: " +steroids, 550, 450);

    image(antibioticspic, 700, 250, 100, 100);
    textFont(desc, 18);
    text("Antibiotics", 700, 350);
    text("$500", 700, 375);
    text("Cures infection", 700, 400);
    text("Inventory: " +antibiotics, 700, 450);
    
    image(charm, 850, 250, 100, 100);
    textFont(desc, 18);
    text("Charm", 850, 350);
    text("$200", 850, 375);
    text("Good luck", 850, 400);
    text("Inventory: " +charms, 850, 450);
  }

  if (gameScreen == 4) {
    textFont(text, 28); 
    text("Money: $" +money, 100, 40);
    debt();

    rect(1000, 55, 150, 50);
    fill(0);
    text("Back", 1075, 90);

    image(farmer, 100, 1100);

    fill(255);
    text("I've got the best fighting birds in Kentucky!", 350, 100);

    image(rooster[roosterPic], 300, 585);
  }

  if (gameScreen == 5) {
  }

  if (gameScreen == 6) {
    textFont(text, 28);
    fill(255);
    rect(1000, 55, 150, 50);
    fill(0);
    text("Back", 1075, 90);

    textFont(title, 60);
    fill(255);
    text("Options", 600, 100);

    textFont(text, 28);
    rect(450, 300, 300, 100);
    fill(0);
    text("Restart", 600, 350);

    fill(255);
    rect(450, 500, 300, 100);
    fill(0);
    text("Quit", 600, 550);
  }

  if (gameScreen == 7) {
  }

  if (gameScreen == 10) {
    textFont(title, 60);
    fill(#AD2D2D);
    text("YOU LOSE!", 600, 50);
    text("Reason: " +ending, 600, 350);
    text("Press r to try again", 600, 550);

    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        gameScreen = 0;
        money = 1500;
        feed = 3;
        steroids = 0;
        ending = "null";
        debtEnding = false;
        clear();
      }
    }
  }
}

void mouseReleased() {
  // Feed hitbox
  if (gameScreen == 3) {
    if (abs(mouseX-400)<50 && abs(mouseY-250)<125) {
      feed += 1;
      money -= 100;
    }
  }

  // Steroid hitbox
  if (gameScreen == 3) {
    if (abs(mouseX-550)<50 && abs(mouseY-250)<125) {
      steroids += 1;
      money -= 300;
    }
  }

  // Antibiotics hitbox
  if (gameScreen == 3) {
    if (abs(mouseX-700)<50 && abs(mouseY-250)<125) {
      antibiotics += 1;
      money -= 500;
    }
  }

  // Charm hitbox
  if (gameScreen == 3) {
    if (abs(mouseX-850)<50 && abs(mouseY-250)<125) {
      charms += 1;
      money -= 200;
    }
  }

  // Back button
  if (gameScreen == 3 || gameScreen == 4 || gameScreen == 5 || gameScreen == 6) {
    if (abs(mouseX-1075)<75 && abs(mouseY-55)<50) {
      gameScreen = 2;
      clear();
    }
  }

  // Roster button
  if (gameScreen == 2) {
    if (abs(mouseX-1050)<75 && abs(mouseY-45)<25) {
      gameScreen = 6;
      clear();
    }
  }

  // Options button
  if (gameScreen == 2) {
    if (abs(mouseX-600)<150 && abs(mouseY-425)<50) {
      gameScreen = 7;
      clear();
    }
  }

  // Riot! button
  if (gameScreen == 2) {
    if (abs(mouseX-600)<150 && abs(mouseY-400)<50) {
      gameScreen = 7;
      clear();
    }
  }

  // Restart button (Options)
  if (gameScreen == 6) {
    if (abs(mouseX-600)<150 && abs(mouseY-350)<50) {
      gameScreen = 0;
      money = 1500;
      feed = 3;
      steroids = 0;
      ending = "null";
      debtEnding = false;
      clear();
    }
  }

  // Quit button (Options)
  if (gameScreen == 6) {
    if (abs(mouseX-600)<150 && abs(mouseY-550)<50) {
      exit();
    }
  }
}


// Detects debt and warns the player
// Also makes "debt ending"
void debt() {

  if (money < 0) {
    text("You are in debt! Pay your loans off or else...", 600, 40);
  }

  if (money <= -1000) {
    debtEnding = true;
  }

  if (debtEnding == true) {
    gameScreen = 10;
    ending = "The bank shut down your operation.";
  }
}

void roosterName1() {
  float nameGen1 = random(11);

  if (nameGen1 == 0) {
    roosterName1 = "Pecker";
  }

  if (nameGen1 == 1) {
    roosterName1 = "Gord";
  }

  if (nameGen1 == 2) {
    roosterName1 = "Scratchy";
  }

  if (nameGen1 == 3) {
    roosterName1 = "Chuck";
  }

  if (nameGen1 == 4) {
    roosterName1 = "Maximus";
  }

  if (nameGen1 == 5) {
    roosterName1 = "Rudy";
  }

  if (nameGen1 == 6) {
    roosterName1 = "Dean";
  }

  if (nameGen1 == 7) {
    roosterName1 = "Talon";
  }

  if (nameGen1 == 8) {
    roosterName1 = "Cooper";
  }

  if (nameGen1 == 9) {
    roosterName1 = "Squaky";
  }

  if (nameGen1 == 10) {
    roosterName1 = "Kyle"; 
    noLoop();
  }
}

void roosterName2() {
  float nameGen2 = random(11);

  if (nameGen2 == 0) {
    roosterName2 = "Pecker";
  }

  if (nameGen2 == 1) {
    roosterName2 = "Gord";
  }

  if (nameGen2 == 2) {
    roosterName2 = "Scratchy";
  }

  if (nameGen2 == 3) {
    roosterName2 = "Chuck";
  }

  if (nameGen2 == 4) {
    roosterName2 = "Maximus";
  }

  if (nameGen2 == 5) {
    roosterName2 = "Rudy";
  }

  if (nameGen2 == 6) {
    roosterName2 = "Dean";
  }

  if (nameGen2 == 7) {
    roosterName2 = "Talon";
  }

  if (nameGen2 == 8) {
    roosterName2 = "Cooper";
  }

  if (nameGen2 == 9) {
    roosterName2 = "Squaky";
  }

  if (nameGen2 == 10) {
    roosterName2 = "Kyle"; 
    noLoop();
  }
}

void roosterName3() {
  float nameGen3 = random(11);

  if (nameGen3 == 0) {
    roosterName3 = "Pecker";
  }

  if (nameGen3 == 1) {
    roosterName3 = "Gord";
  }

  if (nameGen3 == 2) {
    roosterName3 = "Scratchy";
  }

  if (nameGen3 == 3) {
    roosterName3 = "Chuck";
  }

  if (nameGen3 == 4) {
    roosterName3 = "Maximus";
  }

  if (nameGen3 == 5) {
    roosterName3 = "Rudy";
  }

  if (nameGen3 == 6) {
    roosterName3 = "Dean";
  }

  if (nameGen3 == 7) {
    roosterName3 = "Talon";
  }

  if (nameGen3 == 8) {
    roosterName3 = "Cooper";
  }

  if (nameGen3 == 9) {
    roosterName3 = "Squaky";
  }

  if (nameGen3 == 10) {
    roosterName3 = "Kyle";
    noLoop();
  }
}