//Images

GameHandler gamehandler;

PImage img[] = new PImage[7];

//Cookie variabler

int cookieX = 275;
int cookieY = 275;
int cookieW = 250;
int cookieH = 250;


void setup(){
  size(800, 800);

  gamehandler = new GameHandler();

  img[0] = loadImage("PerfectCookie.png");
  img[1] = loadImage("CursorIcon.png");
  img[2] = loadImage("GrandmaIcon.png");
  img[3] = loadImage("MineIcon.png");
  img[4] = loadImage("FactoryIcon.png");
  img[5] = loadImage("AlchemyLabIcon.png");
  img[6] = loadImage("PortalIcon.png");
  
}

void draw(){
  background(255);
   image(img[0], cookieX, cookieY, cookieW, cookieH);
}

void mouseClicked(){
if(mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH){
  gamehandler.cookies++;
}
}
