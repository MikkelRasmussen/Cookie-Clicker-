class GameHandler {

  float cookies = 9999999999999999999999L;
  float cps = 0;

  int pointers, grandma, mine, factory, alchemy, portal, time;

  float pointerPrice = 10;
  float grandmaPrice = 50;
  float minePrice = 250;
  float factoryPrice = 1250;
  float alchemyPrice = 6000;
  float portalPrice = 30000;

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
        cps = cps+2.5;
        if (cursorUpgrades.size() < 21) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 150));
        else if (cursorUpgrades.size() >= 21 && cursorUpgrades.size() < 42) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 200));
        else if (cursorUpgrades.size() >= 42) cursorUpgrades.add(new CursorUpgrade(450, 450, 400, 400, 50, cursorUpgrades.size(), 250));
        return true;
      } else {
        return false;
      }
    } else if (s == "grandma") {
      if (cookies >= grandmaPrice) {
        cookies = cookies-grandmaPrice;
        grandma++;
        grandmaPrice = grandmaPrice*1.5;
        cps = cps+12.5;
        return true;
      } else {
        return false;
      }
    } else if (s == "mine") {
      if (cookies >= minePrice) {
        cookies = cookies-minePrice;
        mine++;
        minePrice = minePrice*1.5;
        cps = cps+60;
        return true;
      } else {
        return false;
      }
    } else if (s == "factory") {
      if (cookies >= factoryPrice) {
        cookies = cookies-factoryPrice;
        factory++;
        factoryPrice = factoryPrice*1.5;
        cps = cps+300;
        return true;
      } else {
        return false;
      }
    }else if (s == "alchemy") {
      if (cookies >= alchemyPrice) {
        cookies = cookies-alchemyPrice;
        alchemy++;
        alchemyPrice = alchemyPrice*1.5;
        cps = cps+1500;
        return true;
      } else {
        return false;
      }
    }else if (s == "portal") {
      if (cookies >= portalPrice) {
        cookies = cookies-portalPrice;
        portal++;
        portalPrice = portalPrice*1.5;
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
