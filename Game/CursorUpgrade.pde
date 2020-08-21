class CursorUpgrade {

  PVector location, centerLocation;
  int size;
  
  int id;
  CursorUpgrade(int x1, int  y1, int x2, int y2, int s, int i) {
    location = new PVector(x1, y1);
    centerLocation = new PVector(x2, y2);

    size = s;
    id = i;
  }



  void update() {
    int cx = 400;
    int cy = 400;
    int r = 150;

    

    pushMatrix();
    float t = millis()/1000.0f + id*0.3;
    int x = (int)(cx+r*cos(t));
    int y = (int)(cy+r*sin(t));
    translate(x, y);
    rotate(t-PI/1.4);//or rotate(t-PI/2); (depending on what you need)
    
    display();
   
    popMatrix();



    println(location.x, location.y);
  }

  void display() {
    image(img[1], 0, 0, size, size);
  }
}
