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
boolean mousemoving = true;
PImage background;
PVector mousePos;
boolean fired = false;
boolean getangle = true;
int millis = millis();

void setup()
{
  fullScreen(P2D);
  background = loadImage("wild.jpg");
  background.resize(width, height);
  background(background);

  minim = new Minim(this); //Music 
  pew = minim.loadFile("pew.mp3");

  mousePos = new PVector(mouseX, mouseY);

  shooter = new Shooter();

  bullet.add(new Bullet());
}


void draw()
{

  background(background);

  shooter.Draw();
  shooter.move();

  for (int i = 0; i < bullet.size(); i++)
  {
    if (fired)
    {
      bullet.get(i).Draw();
      bullet.get(i).shoot();
      pew.play();
    }
  }

  if (mousePressed)
  {
    fired = true;
    //if(millis > 1000)
    {
      bullet.add(new Bullet());
      //millis = millis();
    }
    mousemoving = true;
    getangle = true;
  }
}