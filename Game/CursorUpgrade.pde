class CursorUpgrade {
  
  PVector location, centerLocation;
  int size;
  
  CursorUpgrade(int x1,int  y1, int x2, int y2, int s) {
    location = new PVector(x1, y1);
    centerLocation = new PVector(x2, y2);
    
    size = s;
  }
}
