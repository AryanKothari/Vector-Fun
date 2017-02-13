class Bullet
{
  private PVector pos;
  private PImage bullet;
  private PVector distance;

  Bullet()
  {
    pos = new PVector (90, 680);
    bullet = loadImage("bullet.png");
    bullet.resize(30, 30);
  }


  public void Draw()
  {
    imageMode(CENTER);
    image(bullet, pos.x, pos.y);
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
    if (mousemoving)
    {
      mousePos = new PVector(mouseX, mouseY);
    }
    if (fire)
    {
      mousemoving = false;
      shootercanmove = false;
      distance = PVector.sub(mousePos, pos);
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
    }
  }