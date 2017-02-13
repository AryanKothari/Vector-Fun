class Shooter
{
  PVector pos;
  PImage shooter;

  Shooter()
  {
    pos = new PVector (50, 750);
    shooter = loadImage("shooter.png");
    shooter.resize(150,150);
  }

  public void Draw()
  {
    imageMode(CENTER);
    image(shooter, pos.x, pos.y);
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
}