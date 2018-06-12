// Rooster Riot
// Made by Sam

PImage[] rooster = new PImage[8];

PImage storeKeep;

PImage startRooster;

PImage feed;

PFont title;

int gameScreen;

int frames;

String colour;

Boolean buttonHit;

void setup() {

  storeKeep = loadImage("chadrooster.png");
  startRooster = loadImage("startrooster.png");
  feed = loadImage("feed.png");

  title = loadFont("BernardMT-Condensed-48.vlw");

  frames = 0;


  size(1200, 700);
}

void draw() {
  imageMode(CENTER);
  textAlign(CENTER);


  textFont(title, 60);


  if (gameScreen == 0) {
    background(0);
    fill(255);
    text("Rooster Riot", 600, 200);
    image(startRooster, 600, 400);
    rect(350, 550, 500, 100);
    fill(#AD2D2D);
    text("Hit Enter to begin!", 600, 625);

    if (keyCode == ENTER) {
      gameScreen += 1;
    }
    
    
  }
}