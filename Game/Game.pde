//Images
PFont Inter;

ArrayList<CursorUpgrade> cursorUpgrades = new ArrayList<CursorUpgrade>();

String[] upgrades = {"pointer", "grandma", "mine", "factory", "alchemy", "portal"};
float[] prices = {10, 50, 250, 1250, 6000, 30000};
int[] amount = {0, 0, 0, 0, 0, 0};

GameHandler gameHandler;

PImage img[] = new PImage[7];

//Cookie variabler

int cookieX = 275;
int cookieY = 275;
int cookieW = 250;
int cookieH = 250;

void setup() {
  size(1200, 800);

  Inter = createFont("InterFont.ttf", 32);

  gameHandler = new GameHandler();

  img[0] = loadImage("PerfectCookie.png");
  img[1] = loadImage("CursorIcon.png");
  img[2] = loadImage("GrandmaIcon.png");
  img[3] = loadImage("MineIcon.png");
  img[4] = loadImage("FactoryIcon.png");
  img[5] = loadImage("AlchemyLabIcon.png");
  img[6] = loadImage("PortalIcon.png");
}

void draw() {
  background(255);
  image(img[0], cookieX, cookieY, cookieW, cookieH);

  for (CursorUpgrade temp : cursorUpgrades) {
    temp.update();
  }
  fill(0);
  textFont(Inter);
  textSize(32);
  text("COOKIES: " + nf(gameHandler.cookies, 0, -1), 50, 50);
  text("CPS: " + nf(gameHandler.cps, 0, 2), 50, 80);

  for (int i = 1; i < img.length; i++) {
    line(900, 100*i+87.5, width, 100*i+87.5);
    image(img[i], 900, 100*i, 75, 75);
  }

  gameHandler.update();
  textSize(24);
  text("Price: " + nf(gameHandler.pointerPrice, 0, 1), 970, 155);
  text("Price: " + nf(gameHandler.grandmaPrice, 0, 1), 970, 255);
  text("Price: " + nf(gameHandler.minePrice, 0, 1), 970, 355);
  text("Price: " + nf(gameHandler.factoryPrice, 0, 1), 970, 455);
  text("Price: " + nf(gameHandler.alchemyPrice, 0, 1), 970, 555);
  text("Price: " + nf(gameHandler.portalPrice, 0, 1), 970, 655);
}

void mouseClicked() {
  if (mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
    gameHandler.cookies++;
  }


  // Upgrades
  for ( int i = 0; i < upgrades.length; i++ ) {
    if (checkIfBought(mouseX, mouseY, 900, i*100 + 87.5, width, 100)) {
      gameHandler.buy(upgrades[i]);
    }
  }
}

void mousePressed() {
  if (mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
    cookieX = cookieX - 5; 
    cookieY = cookieY - 5; 
    cookieH = cookieH + 10; 
    cookieW = cookieW + 10;
  }
}


void mouseReleased() {
  if (mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
    cookieX = cookieX + 5; 
    cookieY = cookieY + 5; 
    cookieH = cookieH - 10; 
    cookieW = cookieW - 10;
  }
}
