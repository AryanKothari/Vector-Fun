/*
Hey guys! This is my first project in Creative Coding Two. 
 In this game I implemented vectors. Shoot the bullets from the shooter!
 */

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer pew;

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

  minim = new Minim(this); //Music 
  pew = minim.loadFile("pew.mp3");

  mousePos = new PVector(mouseX, mouseY);

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

  if (bullet.pos.x > width || bullet.pos.x < 0 || bullet.pos.y > height || bullet.pos.y < 0)
  {
    bullet.reset();
    pew.rewind();
  }
}

void mousePressed()
{
  fire = true;
}