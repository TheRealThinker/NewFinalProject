// Rooster Riot
// Made by Sam

PImage[] rooster = new PImage[8];

PImage storeKeep;

PImage startRooster;

PImage feedpic;
int feed;

PImage steroidpic;
int steroids;

PFont title;

PFont text;

PFont desc;

int gameScreen;

int frames;

int money;

String ending;

Boolean debtEnding;

void setup() {

  storeKeep = loadImage("chadrooster.png");
  startRooster = loadImage("startrooster.png");
  feedpic = loadImage("feed.png");
  steroidpic = loadImage("steroids.jpeg");

  title = loadFont("BernardMT-Condensed-48.vlw");
  text = loadFont("BernardMT-Condensed-28.vlw");
  desc = loadFont("BernardMT-Condensed-18.vlw");

  money = 1500;
  feed = 3;
  steroids = 0;

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
    text("You must maintain a roster of roosters to participate in these fights.", 600, 350);
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
  }

  // Shop
  if (gameScreen == 3) {
    textFont(text, 28);
    text("Money: $" +money, 100, 40);
    debt();

    image(storeKeep, 50, 300, 350, 350);

    textFont(text, 28);
    fill(255);
    text("Welcome to my shop! Please, look around!", 350, 100);

    // Feed
    image(feedpic, 400, 250, 100, 100);
    textFont(desc, 18);
    text("Chicken Feed", 400, 350);
    text("$100", 400, 375);
    text("Inventory: " +feed, 400, 400);

    image(steroidpic, 550, 250, 100, 100);
    textFont(desc, 18);
    text("Illegal Steroids", 550, 350);
    text("$300", 550, 375);
    text("Inventory: " +steroids, 550, 400);
  }

  if (gameScreen == 4) {
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
  if (abs(mouseX-400)<50 && abs(mouseY-250)<125) {
    feed += 1;
    money -= 100;
  }

  // Steroid hitbox
  if (abs(mouseX-550)<50 && abs(mouseY-250)<125) {
    steroids += 1;
    money -= 300;
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
    gameScreen = 4;
    ending = "The bank shut down your operation.";
  }
}