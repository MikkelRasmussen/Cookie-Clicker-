//Images

GameHandler gamehandler;

PImage img[] = new PImage[7];

//Cookie variabler

int cookieX = 275;
int cookieY = 275;
int cookieW = 250;
int cookieH = 250;

void setup() {
  size(1200, 800);

  gamehandler = new GameHandler();

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
  
  fill(0);
  textSize(32);
  text("Cookies: " + nf(gamehandler.cookies,0,0), 50,50);
  
  for(int i = 1; i < img.length; i++){
    line(900, 100*i+87.5, width, 100*i+87.5);
    image(img[i], 900, 100*i, 75,75);
  } 
}

void mouseClicked() {
  if (mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
    gamehandler.cookies++;
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
