Player player;
boolean playerInputA = false, playerInputD = false, playerInputSpace = false;
ArrayList<Laser> laser = new ArrayList<Laser>(); 
ArrayList<Enemy> enemy = new ArrayList<Enemy>();
int randNum;
int counterNum = 0;
int dir = 1;
int moveEnemy = 0;

void setup() {
  //TEST ONLY 


  rectMode(CENTER);
  noStroke();
  size(800, 600);
  player = new Player();
  frameRate(180);
  for (int i = 1; i < 10; i++) {
    for (int j = 0; j < 5; j++) {
      enemy.add(new Enemy(i*50 + 100, j*50));
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < enemy.size(); i++) {
    enemy.get(i).ifDetected();
    enemy.get(i).drawEnemy();
    //enemy.get(i).posX += moveEnemy;
  }
  for(int i = 1; i < 10; i++) {
    randNum = int(random(1, 10));
    if(randNum == 1 && counterNum % 50 == 0) {
      laser.add(new Laser(i * 50 + 100, "DOWN"));
      counterNum = 0;
    }
      counterNum++;
  }

  player.ifDetected();
  player.attack();
  player.movePlayer();
  player.drawPlayer();
  for (int i = 0; i < laser.size(); i++) {
    laser.get(i).drawLaser();
  }
  
  moveEnemy += dir;
  if(moveEnemy > 100 || moveEnemy < -100) {
   dir *= -1; 
  }
}

void keyPressed() {
  playerInputA = false;
  playerInputD = false;
  playerInputSpace = false;
  switch(key) {
  case 'a':
    playerInputA = true;
    break;
  case 'd':
    playerInputD = true;
    break;
  case ' ':
    playerInputSpace = true;
  }
}