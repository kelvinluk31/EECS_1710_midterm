
//creates the button//
class Button {
  PVector location;
  int size;
  boolean state;
  int stateTimer;
  int timerLength;  
  
  Button(float x, float y, int size, int depressionTimer) {
    this.location = new PVector(x, y);
    this.size = size;
    this.state = false;
    stateTimer = 0;
    timerLength = depressionTimer;
  }
  //creates the button graphic//
    void draw() {
    noFill();
    
    if(state){      //when button is being clicked the color of the button is changed to indicate that it is being clicked.//
      stroke(WHITE);
      fill(MAGENTA);
      stateTimer--;
    }
    else {
      stroke(BLACK);
      fill(RED);
    }
    //shape of the button
    circle(location.x, location.y, size);
    
    //stroke(fillNow);
    //pushMatrix();
    //translate(position.x, position.y, position.z);
    //sphere(bugSize);
    //popMatrix();
    if(state && stateTimer < 1){
      state = false;
    }
  }
  
  void depress(){   //button is in a clicked down state//
    state = true;
    stateTimer = timerLength;
  }
  
  void release(){   //button is released after being clicked//
    state = false;
  }
  
  boolean getState(){ //returns the current state of the button//
    return state;
  }
}
