class GameHandler {

  float cookies = 9100000000L;
  float cps = 0;

  int pointers, time;

  float pointerPrice = 10;

  GameHandler() {
  }


  void update() {
    if ( millis() > time ) {
      time = millis() + 1000;
      cookies = cookies + cps;
    }
  }



  boolean buy(String s) {
    if (s == "pointer") {
      if (cookies >= pointerPrice) {
        cookies = cookies-pointerPrice;
        pointers++;
        pointerPrice = pointerPrice*1.5;
        cps = cps+0.5;
        return true;
      } else {
        return false;
      }
    } else { 
      return false;
    }
  }
}

boolean checkIfBought(int x1, int y1, int x2, int y2, int w, int h) {
  if (x1 >= x2 && x1 <= x2 + w && y1 >= y2 && y1 <= y2 + h) return true;
  else return false;
}
