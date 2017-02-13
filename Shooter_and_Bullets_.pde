/*
Hey guys! This is my first project in Creative Coding Two. 
In this game I implemented vectors. Shoot the bullets from the shooter!
*/

Shooter shooter;
Bullet bullet;
boolean mousemoving = true;
boolean shootercanmove = true;
PImage background;
PVector mousePos;
boolean fire = false;

void setup()
{
  fullScreen();
  background = loadImage("wild.jpg");
  background.resize(width, height);
  background(background);

  shooter = new Shooter();
  bullet = new Bullet();
}


void draw()
{

  background(background);

  shooter.Draw();
  bullet.Draw();

  if (shootercanmove)
  {
    shooter.move();
    bullet.move();
  }

  if (fire)
  {
    bullet.shoot();
  }

  //if (bullet.pos.x > 400)//bullet.pos.x == mousePos.x && bullet.pos.y == mousePos.y)
  //{
  //  bullet.reset();
  //}
}

void mousePressed()
{
  fire = true;
}