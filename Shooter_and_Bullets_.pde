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
ArrayList<Bullet> bullet = new ArrayList<Bullet>();
ArrayList<Bird> bird = new ArrayList<Bird>();
boolean mousemoving = true;
PImage background;
PImage birdpic;
PImage bulletpic;
PImage shooterpic;
PVector mousePos;
boolean fired = false;
boolean getangle = true;
boolean canshoot = true;
int millis = millis();
int screen = 1;

void setup()
{
  fullScreen(P2D);
  background = loadImage("wild.jpg");
  background.resize(width, height);
  background(background);

  birdpic = loadImage("bird.png");
  bulletpic = loadImage("bullet.png");
  shooterpic = loadImage("shooter.png");
  shooterpic.resize(150, 150);

  minim = new Minim(this); //Music 
  pew = minim.loadFile("pew.mp3");

  mousePos = new PVector(mouseX, mouseY);

  for (int i =0; i < 400; i++)
  {
    bird.add(new Bird());
  }

  shooter = new Shooter();
  bullet.add(new Bullet());
}


void draw()
{
  if (screen == 1)
  {
    background(background);

    shooter.Draw();
    shooter.move();

    for (int i = 0; i < bird.size(); i++)
    {
      bird.get(i).Draw();
    }

    for (int i = 0; i < bullet.size(); i++)
    {
      if (fired)
      {
        bullet.get(i).Draw();
        bullet.get(i).shoot();
        pew.play();
      }
    }
    for (int i = 0; i < bullet.size(); i++)
    {
      for (int j = 0; j < bird.size(); j++)
      {
        if (bullet.get(i).pos.x < bird.get(j).pos.x + 50&&
          bullet.get(i).pos.x + 30 > bird.get(j).pos.x &&
          bullet.get(i).pos.y < bird.get(j).pos.y + 30 &&
          30 + bullet.get(i).pos.y > bird.get(j).pos.y)
        {
          bird.get(j).candrawbird = false;
          bird.get(j).pos.x = -5000;
          bullet.get(i).candrawb = false;
          bullet.get(i).pos.x = -5000;
        }
      }
    }

    if (mousePressed)
    {
      if (canshoot)
      {
        fired = true;
        bullet.add(new Bullet());
        mousemoving = true;
        getangle = true;
        canshoot = false;
      }
    }
    shooterishit();
  }

  if (screen == 2)
  {
    background(0);
    fill(255, 255, 255);
    textSize(100);
    text("Game Over", width/4, height/2);
  }
}

void mouseReleased()
{
  canshoot = true;
}


void shooterishit()
{
  for (int i = 0; i<bird.size(); i++)
  {
    if (shooter.pos.x < bird.get(i).pos.x + 50&&
      shooter.pos.x + 150 > bird.get(i).pos.x &&
      shooter.pos.y < bird.get(i).pos.y + 30 &&
      150 + shooter.pos.y > bird.get(i).pos.y) 
    {
      screen = 2;
    }
  }
}