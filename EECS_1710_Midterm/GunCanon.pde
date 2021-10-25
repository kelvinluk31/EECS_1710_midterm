//creates the spaceship//
class GunCanon {
  int GUNCANONWIDTH = 106;
  int GUNCANONHEIGHT = 140;
  PVector position;
  float speed;
  float initialSpeed;
  boolean direction; //true to move right, false to move left
  boolean isShooting;
  boolean canShoot; //maybe won't need this
  PShape gunShip;
  
  GunCanon() {
    position = new PVector(0, 0);
    initialSpeed = 1;
    speed = initialSpeed;
    direction = true;
    isShooting = false;
    canShoot = true;
    
    gunShip = createShape();
    gunShip.beginShape();
    gunShip.fill(SPACEBALLS);
    gunShip.vertex(32,32);
    gunShip.vertex(32,0);
    gunShip.vertex(0,0);
    gunShip.vertex(0,32);
    gunShip.vertex(32,32);
    gunShip.vertex(40,140);
    gunShip.vertex(52,120);
    gunShip.vertex(66,140);
    gunShip.vertex(74,32);
    gunShip.vertex(106,32);
    gunShip.vertex(106,0);
    gunShip.vertex(74,0);
    gunShip.vertex(74,32);
    gunShip.endShape();  
  }
  
  GunCanon(int x, int y, float initialSpeed) {
    position = new PVector(x, y);
    this.initialSpeed = speed;
    speed = initialSpeed;
    direction = true;
    isShooting = false;
    canShoot = true;
    
    //draws the shape of the space ship//
    gunShip = createShape();
    gunShip.beginShape();
    gunShip.fill(SPACEBALLS);
    gunShip.vertex(32,32);
    gunShip.vertex(32,0);
    gunShip.vertex(0,0);
    gunShip.vertex(0,32);
    gunShip.vertex(32,32);
    gunShip.vertex(40,140);
    gunShip.vertex(52,120);
    gunShip.vertex(66,140);
    gunShip.vertex(74,32);
    gunShip.vertex(106,32);
    gunShip.vertex(106,0);
    gunShip.vertex(74,0);
    gunShip.vertex(74,32);
    gunShip.endShape();  
  }
  
  void draw() {
    noFill();
    stroke(BLACK);
  
    
    shape(gunShip, position.x, position.y);
    //stroke(fillNow);
    //pushMatrix();
    //translate(position.x, position.y, position.z);
    //sphere(bugSize);
    //popMatrix();
  }
  
  void run() {
    move();
    draw();
    //System.out.println("We are Running");
  }
  
  void move(){
    if(isShooting){
      // don't move    
    }
    else {
      if(position.x > RESOLUTIONX - GUNCANONWIDTH){
        direction = false;
      }
      else if(position.x < 1) {
        direction = true;
      }
      
      if(direction){
        position.set(position.x + speed, position.y);
      }
      else {
        position.set(position.x - speed, position.y);
      }
    }
  }
  
  //whether ship is shooting//
  void shoot(){
    if(isShooting) {
      isShooting = false;
    }
    else{
      isShooting = true;
      speed= speed + 0.01;//increases speed slightly every time a ball is shot//
    }
  }
  
  //determines where the cubes will be fired according to the position the ship is hovering over.
  int getAim(){
    return (int)(position.x + (GUNCANONWIDTH / 2));
  }
  
  //status of whether the ship is firing something or not//
  boolean getStatus(){
    return isShooting;
  }
}
