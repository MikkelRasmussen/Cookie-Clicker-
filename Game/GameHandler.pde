class GameHandler {

  float cookies = 3000000L;
  float cps = 0;
  int time;

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
      if (cookies >= prices[0]) {
        cookies = cookies-prices[0];
        amount[0]++;
        prices[0] = prices[0]*1.5;
        cps = cps+2.5;
        if (cursorUpgrades.size() < 21) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 150));
        else if (cursorUpgrades.size() >= 21 && cursorUpgrades.size() < 42) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 200));
        else if (cursorUpgrades.size() >= 42) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 250));
        return true;
      } else {
        return false;
      }
    } else if (s == "grandma") {
      if (cookies >= prices[1]) {
        cookies = cookies-prices[1];
        amount[1]++;
        prices[1] = prices[1]*1.5;
        cps = cps+12.5;
        return true;
      } else {
        return false;
      }
    } else if (s == "mine") {
      if (cookies >= prices[2]) {
        cookies = cookies-prices[2];
        amount[2]++;
        prices[2] = prices[2]*1.5;
        cps = cps+60;
        return true;
      } else {
        return false;
      }
    } else if (s == "factory") {
      if (cookies >= prices[3]) {
        cookies = cookies-prices[3];
        amount[3]++;
        prices[3] = prices[3]*1.5;
        cps = cps+300;
        return true;
      } else {
        return false;
      }
    } else if (s == "alchemy") {
      if (cookies >= prices[4]) {
        cookies = cookies-prices[4];
        amount[4]++;
        prices[4] = prices[4]*1.5;
        cps = cps+1500;
        return true;
      } else {
        return false;
      }
    } else if (s == "portal") {
      if (cookies >= prices[5]) {
        cookies = cookies-prices[5];
        amount[5]++;
        prices[5] = prices[5]*1.5;
        cps = cps+7500;
        return true;
      } else {
        return false;
      }
    } else { 
      return false;
    }
  }
}
boolean checkIfBought(int x1, int y1, int x2, float y2, int w, float h) {
  if (x1 >= x2 && x1 <= x2 + w && y1 >= y2 && y1 <= y2 + h) return true;
  else return false;
}
