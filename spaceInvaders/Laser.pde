class Laser {
  int posX, posY;
  String direction;
  Laser(int newPosX, String newDirection) {
     posX = newPosX;
     direction = newDirection;
     if (direction == "UP") posY = 460;
     if (direction == "DOWN") posY = 255;
  }
  int getPosX() {
    return posX;
  }
  int getPosY() {
    return posY;
  }
  void drawLaser() {
    if(direction == "UP") {
      posY--;
    } else if (direction == "DOWN") {
      posY++;
    }
    
    fill(255, 50, 50);
    rect(posX, posY, 4, 8);
  }
}