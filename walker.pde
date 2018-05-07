public class Walker {
  PVector position;
  PVector previous;
  float[] ratios;
  
  public Walker(int x, int y) {
    this.position = new PVector(x, y);
    this.previous = this.position.copy();
    this.ratios = new float[]{0, .1, .2, .3, .4, .5,
                              .6, .7, .8, .9, 1};
  }
  
  public void nextMove() {
    this.previous.set(this.position);
    PVector step = PVector.random2D();
    
    float rand = random(100);
    if (rand < 2) {
      step.mult(random(25, 50));
    } else {
      step.setMag(2);
    }
    this.position.add(step);
    
    // Deal with edges
    if (this.position.x < 1 || this.position.x > width - 1 ||
        this.position.y < 1 || this.position.y > height - 1) {
      this.position.set(this.previous);
    }
  }
  
  public void drawPoints(float[][] arr) {
    for (float ratio : this.ratios) {
      int x = int(this.previous.x + 
                 (this.position.x - this.previous.x) * 
                 ratio);
      int y = int(this.previous.y + 
                 (this.position.y - this.previous.y) * 
                 ratio);
      arr[x][y] = 127;
    }
  }
}
