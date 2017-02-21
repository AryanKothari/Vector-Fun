class Bullet
{
  private PVector pos;
  private PImage bullet;
  private PVector distance;
  private boolean getangle;
  private boolean candrawb;

  Bullet()
  {
    pos = new PVector (shooter.pos.x + 50, shooter.pos.y - 80);
    bullet = loadImage("bullet.png");
    getangle = true;
    candrawb = true;
  }


  public void Draw()
  {
    if(candrawb)
    {
    image(bullet, pos.x, pos.y, 30, 30);
    }
  }

  public void shoot()
  {
    if (mousemoving)
    {
      mousePos.set(mouseX, mouseY);
    }
  if (getangle)
  {
      mousemoving = false;
      distance = PVector.sub(mousePos, pos);
      getangle = false;
    }
    distance.normalize();
    distance.mult(15);
    pos.add(distance);
  }
}