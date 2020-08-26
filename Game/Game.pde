//Images
PFont Inter;

ArrayList<CursorUpgrade> cursorUpgrades = new ArrayList<CursorUpgrade>();

String[] upgrades = {"pointer", "grandma", "mine", "factory", "alchemy", "portal"};
float[] prices = {10, 50, 250, 1250, 6000, 30000};
int[] amount = {0, 0, 0, 0, 0, 0};
float[] cpsUp = {2.5, 12.5, 60, 300, 1500, 7500};
GameHandler gameHandler;

PImage img[] = new PImage[7];

int cookieX = 275, cookieY = 275, cookieW = 250, cookieH = 250;

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
    textSize(24);
    text("Price: " + nf(prices[i-1], 0, 1), 970, i*100+55);
  }  
  gameHandler.update();
}
 
void mouseClicked() {
  if (mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
    gameHandler.cookies++;
  }
  for ( int i = 0; i < upgrades.length; i++ ) {
    if (checkIfBought(mouseX, mouseY, 900, i*100 + 87.5, width, 100)) {
      gameHandler.buy(i);
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
