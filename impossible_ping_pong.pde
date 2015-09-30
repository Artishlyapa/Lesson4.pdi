// Weiwei; Arti; Ian; Eric

int score1;
int score2;
Ball ball;
Paddle paddle;

class Ball {
  float xp, yp;
  float xv, yv;
  float r;
  color c;

  Ball() {
    colorMode(HSB, 100);
    c = color(80, 40, 100); 
    xp = 250;
    yp = 250;
    r = 10;
    xv = 10;
    yv = 5;
  }

  void create() {
    noStroke();
    fill(c);
    ellipse(xp, yp, r*2, r*2);
  }

  void step() {
    xp += xv;
    yp += yv;
    if (yp < r || yp > height - r) {
      yv *= -1;
    }
    if (xp > p2.x - r && yp < p2.y + 60 && yp > p2.y) {
      xv *= -1;
    }
    if (xp < p1.x + r*2 && yp < p1.y + 60 && yp > p1.y) {
      xv *= -1;
    }
    if (xp > 505) {
      xp = 250;
      yp = 250;
      xv = 10;
      yv = 5;
      score1 +=1;
    }
    if (xp < -5) {
      xp = 250;
      yp = 250;
      xv = 10;
      yv = 5;
      score2 +=1;
    }
  }
}

Ball b;


class Paddle {
  float y, x;
  float vy;
  float sx = 10;
  float sy = 60;
  color c;

  Paddle (float x, float y) {
    this.x = x;
    this.y = y;
    c = color(220, 100, 280);
    vy = random(1, 3);
  }

  void create() {
    noStroke();
    fill(c);
    rect (x, y, sx, sy);
  }

  void move() {
    y += vy;
    if (y < 0 || y > height - sy) {
      vy = -vy;
    }
  }
}

Paddle p1, p2;

void setup() {
  size (500, 500);
  colorMode(HSB);
  int x = 20;
  int y = 100;
  p1 = new Paddle(x, y);
  x = 470;
  y = 300;
  p2 = new Paddle(x, y);
  b = new Ball();
}

void draw() {
  background(0);
  p1.create();
  p1.move();
  p1.y = mouseY;
  p2.create();
  p2.move();
  p2.y = b.yp - 30;
  b.create();
  b.step();

  textSize(32);
  text("" + score1, 200, 30);
  text("" + score2, 250, 30);
}
