class Circle {
  int midiNum;
  float rad;
  color c;
  float x;
  float y;
  PVector vel;
  
  Circle(int midiNum, float x, float y) {
    this.midiNum = midiNum;
    this.rad = random(50, 150);
    this.c = color(random(256), random(256), random(256));
    this.x = x;
    this.y = y;
    this.vel = new PVector(random(1,4), random(1,4));
  }
  void show() {
    noStroke();
    fill(c);
    ellipse(x, y, rad, rad);
  }
  
  void move() {
    x = x + vel.x;
    y = y + vel.y;
    
    if (x < rad/2) {
      x = rad/2;
      vel.x *= - 1;
    } else if (x > width - rad/2) {
      x = width - rad/2;
      vel.x *= -1;
    }
    
    if (y < rad/2 + 120) {
      y = rad/2 + 120;
      vel.y *= -1;
    } else if (y > height - rad/2) {
      y = height - rad/2;
      vel.y *= -1;
    }
    
  }
  
  boolean isCollision() {
    float d = dist(mouseX, mouseY, x, y);
    if (d <= rad/2) {
      return true;
    } else {
      return false;
    }
  }
}
