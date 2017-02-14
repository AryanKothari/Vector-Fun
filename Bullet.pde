class Bullet
{
  private PVector pos;
  private PImage bullet;
  private PVector distance;
  private boolean getangle;

  Bullet()
  {
    pos = new PVector (90, 680);
    bullet = loadImage("bullet.png");
    getangle = true;
  }


  public void Draw()
  {
    if (fire)
    {
      image(bullet, pos.x, pos.y, 30, 30);
    }
  }

  public void move()
  {
    if (keyPressed)
    {
      if (keyCode == RIGHT)
      {
        pos.x = pos.x + 5;
      } else if (keyCode == LEFT)
      {
        pos.x = pos.x - 5;
      }
    }
  }

  public void shoot()
  {
    pew.play();

    if (mousemoving)
    {
      mousePos.set(mouseX, mouseY);
    }
    if (fire)
    {
      if (getangle)
      {
        distance = PVector.sub(mousePos, pos);
        getangle = false;
      }
     // mousemoving = false;
      //shootercanmove = false;
      distance.normalize();
      distance.mult(15);
      pos.add(distance);
    }
  }

  public void reset()
  {
    pos.x = shooter.pos.x + 50;
    pos.y = shooter.pos.y - 80;
    shootercanmove = true;
    fire = false;
    mousemoving = true;
    getangle = true;
  }
}