PFont Inter;

ArrayList<CursorUpgrade> cursorUpgrades = new ArrayList<CursorUpgrade>();

String[] upgrades = {"pointer", "grandma", "mine", "factory", "alchemy", "portal"};
float[] prices = {10, 50, 250, 1250, 6000, 30000};
int[] amount = {0, 0, 0, 0, 0, 0};
float[] cpsUp = {2.5, 12.5, 60, 300, 1500, 7500};
GameHandler gameHandler;

boolean menu = false;

PImage img[] = new PImage[7];

int cookieX = 475, cookieY = 275, cookieW = 250, cookieH = 250, boxY = 600;



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
   text("Up & Down", 50, 700);
  
  

  if (!menu) {
    line(1100, height/2, 1125, height/2-12.5);
    line(1100, height/2, 1125, height/2+12.5);
  } else {

    line(850, height/2-12.5, 875, height/2);
    line(850, height/2+12.5, 875, height/2);

    for (int i = 1; i < img.length; i++) {
      line(900, 100*i+87.5, width, 100*i+87.5);
      image(img[i], 900, 100*i, 75, 75);
      textSize(24);
      text("Price: " + nf(prices[i-1], 0, 1), 970, i*100+55);
    }
  }
  
  for (int i = 1; i < upgrades.length; i++) {
    fill(240,240,240);
    rect(325, boxY+(i-1)*250, 550, 150);
  }

  for (int i = 1; i < amount.length; i++){
    for (int o = 0; o < amount[i]; o++){
     image(img[i+1], 350+ o*35 , boxY+25+(i-1)*250, 25, 25);
    }
    
  }
  
  gameHandler.update();
}

void mouseClicked() {
  if (mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
    gameHandler.cookies++;
  }
  for ( int i = 0; i < upgrades.length; i++ ) {
    if (checkIfInsideBox(mouseX, mouseY, 900, i*100 + 87.5, width, 100)) {
      gameHandler.buy(i);
    }
  }
  if (menu) {
    if (checkIfInsideBox(mouseX, mouseY, 850, height/2-12.5, 25, 25)) {
      menu = !menu;
    }
  } else {
    if (checkIfInsideBox(mouseX, mouseY, 1100, height/2-12.5, 25, 25)) {
      menu = !menu;
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

void keyPressed()
{
  if (keyCode == DOWN) {
    cookieY = cookieY-15;
    boxY = boxY-15;
    for (CursorUpgrade temp : cursorUpgrades) {
      temp.cy = temp.cy-15;
    }
  }
  if (keyCode == UP) {
    if (cookieY < 275) {
      cookieY = cookieY+15;
      boxY = boxY+15;
      for (CursorUpgrade temp : cursorUpgrades) {
        temp.cy = temp.cy+15;
      }
    }
  }
}
