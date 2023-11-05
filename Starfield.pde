RandomDude bob = new RandomDude(-10,450);
OddFirework[] hi = new OddFirework[33];
int timer = 60;
float initSpeed;

//im too tired to make this look better

void setup()
{
  size(500,500);
  background(173,216,230);
  frameRate(20);
  noStroke();
  initSpeed = (float)(Math.random()*10)+35;
  for(int i = 0; i < hi.length-3; i++){
    hi[i] = new OddFirework(initSpeed, i*2*PI/(hi.length - 3));
  }
  for(int i = hi.length - 3; i < hi.length; i++){
    hi[i] = new OddFirework(initSpeed, i*2*PI/3);
  }
}
void draw()
{
  fill(173,216,230);
  rect(0,440,500,60);
  fill(255,255,255);
  bob.move();
  
  if(timer < 50){
    for(int i = 0; i < hi.length - 3; i++){
      hi[i].animate();
    }
    for(int i = hi.length - 3; i < hi.length; i++){
      hi[i].animate();
      hi[i].move();
    }
  }
  if (timer < 100){
    timer += 1;
  } else {
    initSpeed = (float)(Math.random()*10)+35;
    for(int i = 0; i < hi.length - 3; i++){
      hi[i] = new OddFirework(initSpeed, i*2*PI/(hi.length - 3));
    }
     for(int i = hi.length - 3; i < hi.length; i++){
       hi[i] = new OddFirework(initSpeed, i*2*PI/3);
    }
    timer = 0;
  }
}
class Firework {
  float x, speed, y, rotSpeed, rotAngle;
  Firework(float speedings, float givenRotAng){
    speed = speedings;
    rotAngle = givenRotAng;
    rotSpeed = 5;
    x = bob.x + cos(rotAngle)*5 + 15;
    y = bob.y + sin(rotAngle)*5;
  }
  
  void animate(){
    ellipse(x,y,5,5);
    if(speed < 0){
      x += cos(rotAngle) * rotSpeed;
      y += sin(rotAngle) * rotSpeed;
    } else {
      y -= speed;
      speed -= 3;
    }
  }
}

class OddFirework extends Firework {
  OddFirework(float initSpeed, float oddRotAng){
    super(initSpeed, oddRotAng);
  }
  
  void move(){
    fill(34,139,34);
    ellipse(x, y, 5, 5);
    if(speed < 0){
      x += cos(rotAngle)*5;
      y += sin(rotAngle)*5;
      rotAngle += rotSpeed;
    }
  }
}

class RandomDude{
  int y;
  float x, speed;
  RandomDude(int okx, int oky){
    x = okx;
    y = oky;
    speed = (float)(Math.random()*2)+2;
  }
  void move(){
    fill(255,255,255,255);
    rect(x,y,30,50);
    x += speed;
    if(x > 510){
      x = -10;
    }
  }
}
