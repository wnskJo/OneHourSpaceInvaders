
class Player {
  int posX = width/2, posY = 500;
  int counter = 0;
  
  void attack() {
    if (keyPressed && playerInputSpace && counter % 10 == 0) {
      laser.add(new Laser(posX, "UP"));
      counter = 0;
    }
    counter++;
  }
  
  void ifDetected() {
    for (int i = 0; i < laser.size(); i++) {
      if (laser.get(i).getPosX() >= posX-3 && laser.get(i).getPosX() <= posX+3 && laser.get(i).getPosY()  >= posY - 3 && laser.get(i).getPosY()  <= posY + 3) {
        laser.remove(i);
        posX = -1000;
      }
    }
  }
  
  void movePlayer() {
    if (keyPressed) {
      if (playerInputA) {
        posX--;
      } 
      if (playerInputD) {
        posX++;
      }
    }
  }
  
  void drawPlayer() {
    fill(255);
    rect(posX, 500, 30, 10);
  }
}