class Shooter
{
  PVector pos;

  Shooter()
  {
    pos = new PVector (50, 750);
  }

  public void Draw()
  {
    imageMode(CENTER);
    image(shooterpic, pos.x, pos.y);
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