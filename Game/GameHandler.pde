class GameHandler {
  float cookies = 0L;
  float cps = 0;
  int time;
  
  void update() {
    if ( millis() > time ) {
      time = millis() + 1000;
      cookies = cookies + cps;
    }
  }

  void buy(int i) {
    if (cookies >= prices[i]) {
      cookies = cookies-prices[i];
      amount[i]++;
      prices[i] = prices[i]*1.5;
      cps = cps + cpsUp[i];
      if (i == 0) {
        if (cursorUpgrades.size() < 21) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 150));
        else if (cursorUpgrades.size() >= 21 && cursorUpgrades.size() < 42) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 200));
        else if (cursorUpgrades.size() >= 42) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 250));
      }
    }
  }
}

boolean checkIfInsideBox(int x1, int y1, int x2, float y2, int w, float h) {
  if (x1 >= x2 && x1 <= x2 + w && y1 >= y2 && y1 <= y2 + h) return true;
  else return false;
}
