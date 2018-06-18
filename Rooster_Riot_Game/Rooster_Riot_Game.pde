// Rooster Riot
// Made by Sam

PImage[] rooster = new PImage[8];
PImage storeKeep;
PImage startRooster;
PImage enemyRooster;
PImage farmer;
PImage fightVS;
PImage arrow;

PImage feedpic;
int feed;

PImage steroidpic;
int steroids;

PImage antibioticspic;
int antibiotics;

PImage charm;
int charms;

PImage chateau;

PFont title;
PFont text;
PFont desc;

int gameScreen;

int money;
int betMoney;

int roosterPic;
int roosterGen;

int hunger;

float baseSkill;
float playerSkill;
float totalSkill;

float chance;

String ending;

String roosterName;
int nameGen;

Boolean debtEnding;
Boolean winEnding;

String hungerState;

Boolean matchWon;
Boolean matchLost;

Boolean injury;

Boolean feedUsed;
Boolean steroidsUsed;





void setup() {

  storeKeep = loadImage("chadrooster.png");
  startRooster = loadImage("startrooster.png");
  enemyRooster = loadImage("enemyrooster.jpg");
  feedpic = loadImage("feed.png");
  steroidpic = loadImage("steroids.jpeg");
  antibioticspic = loadImage("antibiotics.jpg");
  charm = loadImage("charm.jpg");
  farmer = loadImage("farmer.jpg");
  fightVS = loadImage("vs.jpg");
  arrow = loadImage("rightarrow.png");
  chateau = loadImage("chateau.jpg");

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
  steroidsUsed = false;
  baseSkill = 0.5;
  playerSkill = 0;
  hunger = 0;

  injury = false;

  ending = "null";
  hungerState = "null";

  feedUsed = false;
  steroidsUsed = false;

  debtEnding = false;
  matchWon = false;
  matchLost = false;
  winEnding = false;

  size(1200, 700);
}

void draw() {
  background(0);

  imageMode(CENTER);
  textAlign(CENTER);

  winEnding();
  totalSkill();

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

    // Inventory button
    fill(255);
    rect(275, 550, 150, 50);
    fill(0);
    text("Inventory", 350, 585);

    // "My Rooster" button
    fill(255);
    rect(925, 550, 150, 50);
    fill(0);
    text("My Rooster", 1000, 585);

    // Option button
    fill(255);
    rect(975, 20, 150, 50);
    fill(0);
    text("Options", 1050, 55);

    // RIOT! button
    fill(255);
    rect(450, 350, 300, 100);
    textFont(title, 60);
    fill(0);
    text("RIOT!", 600, 425);
  }

  // Shop screen
  if (gameScreen == 3) {
    textFont(text, 28);
    text("Money: $" +money, 100, 40);
    debt();


    rect(1000, 90, 150, 50);
    fill(0);
    text("Back", 1075, 125);


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

  // Inventory Screen
  if (gameScreen == 4) {
    steroidsUsed();

    fill(255);
    textFont(text, 28);
    text("Money: $" +money, 100, 40);
    debt();

    textFont(text, 28);
    rect(1000, 90, 150, 50);
    fill(0);
    text("Back", 1075, 125);

    fill(255);
    textFont(title, 48);
    text("Inventory", 600, 100);
    textFont(text, 28);
    text("Click on item to consume", 600, 175);

    image(feedpic, 400, 250, 100, 100);
    textFont(desc, 18);
    text("Chicken Feed", 400, 350);
    text("Inventory: " +feed, 400, 375);


    fill(255);
    image(steroidpic, 550, 250, 100, 100);
    textFont(desc, 18);
    text("Illegal Steroids", 550, 350);
    text("Inventory: " +steroids, 550, 375);

    fill(255);
    image(antibioticspic, 700, 250, 100, 100);
    textFont(desc, 18);
    text("Antibiotics", 700, 350);
    text("Inventory: " +antibiotics, 700, 375);

    fill(255);
    image(charm, 850, 250, 100, 100);
    textFont(desc, 18);
    text("Charm", 850, 350);
    text("Inventory: " +charms, 850, 375);
  }
  // "My Chicken" Screen
  if (gameScreen == 5) {
    roosterAppearance();
    steroidsUsed();
    totalSkill();
    hunger();

      fill(255);
    textFont(text, 28);
    text("Money: $" +money, 100, 40);
    debt();

    textFont(text, 28);
    fill(255);
    rect(1000, 90, 150, 50);
    fill(0);
    text("Back", 1075, 125);

    fill(255);
    text("Name: " +roosterName, 600, 100);
    image(arrow, 800, 100, 100, 100);

    image(rooster[roosterPic], 600, 200, 200, 200);
    image(arrow, 800, 350, 100, 100);

    text("Skill: " +totalSkill*100, 600, 400);
  }

  // Options screen
  if (gameScreen == 6) {
    textFont(text, 28);
    fill(255);
    rect(1000, 90, 150, 50);
    fill(0);
    text("Back", 1075, 125);

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
    hunger();
    textFont(text, 28);
    fill(255);
    rect(1000, 90, 150, 50);
    fill(0);
    text("Back", 1075, 125);

    roosterAppearance();
    fight();
  } 

  if (gameScreen == 8) {
    textFont(text, 28);
    fill(255);
    rect(1000, 90, 150, 50);
    fill(0);
    text("Back", 1075, 125); 


    matchResults();
  }

  // Win screen
  if (gameScreen == 9) {
    textFont(title, 48);
    fill(255);
    text("You have earned enough money to live in House Rooster!", 600, 200);

    image(chateau, 600, 400, 200, 200);

    text("You have won!", 600, 600);
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
        antibiotics = 2;
        betMoney = 0;
        nameGen = 0;
        roosterGen = 0;
        ending = "null";
        debtEnding = false;
        matchWon = false;
        matchLost = false;
        winEnding = false;
        clear();
      }
    }
  }
}

// Makes buttons work (hitboxes for click)
void mouseReleased() {
  // Shop button
  if (gameScreen == 2) {
    if (abs(mouseX-150)<75 && abs(mouseY-585)<75) {
      gameScreen = 3;
      clear();
    }
  }

  // Inventory button
  if (gameScreen == 2) {
    if (abs(mouseX-350)<75 && abs(mouseY-585)<100) {
      gameScreen = 4;
      clear();
    }
  }
  // Feed hitbox (Shop)
  if (gameScreen == 3) {
    if (abs(mouseX-400)<50 && abs(mouseY-250)<125) {
      feed += 1;
      money -= 100;
    }
  }

  // Feed hitbox (Inventory)
  if (gameScreen == 4) {
    if (abs(mouseX-400)<50 && abs(mouseY-250)<125) {
      feed -= 1;
      hunger -= 1;
    }
  }

  // Steroid hitbox (Shop)
  if (gameScreen == 3) {
    if (abs(mouseX-550)<50 && abs(mouseY-250)<125) {
      steroids += 1;
      money -= 300;
    }
  }

  // Steroid hitbox (Inventory)
  if (gameScreen == 4) {
    if (steroids > 0) {
      if (abs(mouseX-550)<50 && abs(mouseY-250)<125) {
        steroids -= 1;
        steroidsUsed = true;
      }
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
  if (gameScreen == 3 || gameScreen == 4 || gameScreen == 5 || gameScreen == 6 || gameScreen == 7 || gameScreen == 8) {
    if (abs(mouseX-1075)<75 && abs(mouseY-90)<50) {
      gameScreen = 2;
      betMoney -= betMoney;
      loop();
      clear();
    }
  }

  // "My Chicken" button
  if (gameScreen == 2) {
    if (abs(mouseX-1000)<75 && abs(mouseY-550)<50) {
      gameScreen = 5;
      clear();
    }
  }

  // Options button
  if (gameScreen == 2) {
    if (abs(mouseX-1050)<150 && abs(mouseY-20)<50) {
      gameScreen = 6;
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

  // Name changer
  if (gameScreen == 5) {
    if (abs(mouseX-800)<100 && abs(mouseY-100)<100) {
      nameGen += 1;
    }

    if (nameGen > 11) {
      nameGen = 0;
    }
  }

  // Picture changer
  if (gameScreen == 5) {
    if (abs(mouseX-800)<100 && abs(mouseY-350)<100) {
      roosterGen += 1;
    }
    if (roosterGen > 11) {
      roosterGen = 0;
    }
  }

  // Bet $100 button
  if (gameScreen == 7) {
    if (abs(mouseX-300)<100 && abs(mouseY-600)<100) {
      money -= 100;
      betMoney += 100;
    }

    // Bet $1000
    if (abs(mouseX-900)<100 && abs(mouseY-600)<100) {
      money -= 1000;
      betMoney += 1000;
    }

    // Fight! button
    if (abs(mouseX-600)<100 && abs(mouseY-600)<100) {
      gameScreen = 8;
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

// Changes rooster's name and "skin"
void roosterAppearance() {

  // Rooster name options
  if (nameGen == 0) {
    roosterName = "Pecker";
  }

  if (nameGen == 1) {
    roosterName = "Gord";
  }

  if (nameGen == 2) {
    roosterName = "Scratchy";
  }

  if (nameGen == 3) {
    roosterName = "Chuck";
  }

  if (nameGen == 4) {
    roosterName = "Maximus";
  }

  if (nameGen == 5) {
    roosterName = "Rudy";
  }

  if (nameGen == 6) {
    roosterName = "Dean";
  }

  if (nameGen == 7) {
    roosterName = "Talon";
  }

  if (nameGen == 8) {
    roosterName = "Cooper";
  }

  if (nameGen == 9) {
    roosterName = "Squaky";
  }

  if (nameGen == 10) {
    roosterName = "Kyle";
  }

  // Rooster picture options
  if (roosterGen == 0) {
    roosterPic = 0;
  }

  if (roosterGen == 1) {
    roosterPic = 1;
  }

  if (roosterGen == 2) {
    roosterPic = 2;
  }

  if (roosterGen == 3) {
    roosterPic = 3;
  }

  if (roosterGen == 4) {
    roosterPic = 4;
  }

  if (roosterGen == 5) {
    roosterPic = 5;
  }

  if (roosterGen == 6) {
    roosterPic = 6;
  }

  if (roosterGen == 7) {
    roosterPic = 7;
  }
}

// Generates the Riot! screen
void fight() {

  if (gameScreen == 7) {
    fill(255);
    textFont(text, 28);
    text("Money: $" +money, 100, 40);
    debt();

    fill(255);
    text("" +roosterName, 150, 200);
    image(rooster[roosterGen], 150, 450, 200, 200);

    image(fightVS, 600, 350, 150, 150);

    text("Enemy rooster", 1050, 200);
    image(enemyRooster, 1050, 450, 200, 200);

    text("Bet $100", 300, 600);
    text("Bet $1000", 900, 600);

    text("Your Bet: " +betMoney, 600, 100);

    fill(255);
    rect(500, 500, 200, 100);
    textFont(title, 60);
    fill(0);
    text("Fight!", 600, 600);
  }
}

// Generates match results (win or loss)
void matchResults() {
  hunger();

  float chance = random(2);

  if (abs(chance-totalSkill)>0.5) {
    matchWon = true;
    matchLost = false;
  }
  if (abs(chance-totalSkill)<=0.5) {
    matchWon = false;
    matchLost = true;
  }
  if (matchWon == true) {
    if (matchLost == false) {
      playerSkill += 0.01;
      money = money + betMoney*2;
      textFont(title, 48);
      fill(#35AA51);
      text("Match result: WON", 600, 250);
      text("You now have $" +money, 600, 400);
    }
  }
  if (matchWon == false) {
    if (matchLost == true) {
      betMoney = 0;
      textFont(title, 48);
      fill(#C62A35);
      text("Match result: LOST", 600, 250);
      text("You lost your betting money!", 600, 400);
      text("Better luck next time.", 600, 500);
    }
  }
  noLoop();
}

// Redirects player to win screen
void winEnding() {
  if (money >+ 10000) {
    gameScreen = 9;
  }
}

void totalSkill() {

  totalSkill = baseSkill + playerSkill;
}

void steroidsUsed() {
  if (steroidsUsed == true) {
    playerSkill += 0.01;
    steroidsUsed = false;
  }
}

// Function that adds hunger everytime the rooster fights
void hunger() {

  if (matchWon == true || matchLost == true) {
    hunger += 1;
  }

  if (hunger >= 3) {
    if (gameScreen == 5 || gameScreen == 7) {
      totalSkill -= 0.2;
      textFont(text, 28);
      fill(#D11717);
      text("Your rooster is " +hungerState, 600, 450);
      text("They are less effective in combat", 600, 500);
    }
  }

  if (hunger == 3) {
    hungerState = "hungry";
  }

  if (hunger == 4) {
    hungerState = "Starving";
  }

  if (hunger == 5) {
    hungerState = "Malnourished";
  }

  if (hunger == 6) {
    gameScreen = 11;
  }
}