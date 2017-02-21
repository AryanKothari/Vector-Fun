class Bird
{
  private PVector pos;
  private PVector vel;
  private PImage bird;
  private boolean candrawbird;
  private PVector distance;

  Bird()
  {
    vel = new PVector (random(5, 10), 5);
    bird = loadImage("bird.png");
    pos = new PVector (random(-20000, 20000), random(-50000,700));
    candrawbird = true;
  }

  public void Draw()
  {
    distance = PVector.sub(shooter.pos, pos); 
    distance.normalize();
    distance.mult(10);
    if (candrawbird)
    {
      image(bird, pos.x, pos.y, 50, 50);
      pos.add(distance);
    }
  }
}