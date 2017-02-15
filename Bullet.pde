class Bullet
{
  private PVector pos;
  private PImage bullet;
  private PVector distance;
  private boolean getangle;
  private boolean canshoot;

  Bullet()
  {
    pos = new PVector (shooter.pos.x + 50, shooter.pos.y - 80);
    bullet = loadImage("bullet.png");
    getangle = true;
    canshoot = false;
  }


  public void Draw()
  {
    image(bullet, pos.x, pos.y, 30, 30);
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
      canshoot = true;
    }
    distance.normalize();
    distance.mult(15);
    pos.add(distance);
  }
}