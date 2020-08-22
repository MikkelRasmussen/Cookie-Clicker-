class CursorUpgrade {

  PVector location, centerLocation;
  int time, size, id, cx = 400, cy = 400, rr, r;

  CursorUpgrade(int x1, int  y1, int x2, int y2, int s, int i, int r) {
    location = new PVector(x1, y1);
    centerLocation = new PVector(x2, y2);
    size = s; 
    id = i;
    rr = r;
  }

  void update() {
    display();
  }

  void display() {
    pushMatrix();
    r = rr;
    if ( millis() > time ) {
      time = millis() + 3000;
      r = rr-10;
    }
    float t = millis()/1000.0f + id*0.3;
    int x = (int)(cx+r*cos(t));
    int y = (int)(cy+r*sin(t));
    translate(x, y);
    rotate(t-PI/1.4);//or rotate(t-PI/2); (depending on what you need)
    image(img[1], 0, 0, size, size);
    popMatrix();
  }
}
