class Enemy {
  int posX, posY;
  boolean alive = true;
  color colVal = color(255, 255, 0);

  Enemy(int x, int y) {
    posX = x;
    posY = y;
  }

  void ifDetected() {
    for (int i = 0; i < laser.size(); i++) {
      if (laser.get(i).getPosX() >= posX-10 && laser.get(i).getPosX() <= posX+10 && laser.get(i).getPosY()  >= posY - 3 && laser.get(i).getPosY()  <= posY + 3) {
        println("detected");
        colVal = color(0);
        laser.remove(i);
        posX = -1000;
      }
    }
  }

  void drawEnemy() {
    fill(colVal);
    rect(posX, posY, 20, 10);
  }
}