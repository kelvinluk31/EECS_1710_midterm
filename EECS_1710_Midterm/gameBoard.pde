
//creates the layout of the gameboard
class gameBoard {
  boolean boardState[][];
  boolean gameOver;
  int squareSize;
  int gapSize;
  int rows;
  int columns;
  int staticScore;
  int score;
  int rowScore;
  int rowCounter[];
  
  GunCanon player;
  
  gameBoard(GunCanon player){
    staticScore = 0;
    score = 0;
    this.player = player;
    rows = 20;
    columns = 14;
    squareSize = 32;
    gapSize = 5;
    gameOver = false;
    rowCounter = new int[rows];
    boardState = new boolean[columns][rows];
    // double for loop to make the matrix for the squares(SPACEBALLS) to shoot into//
    for(int i = 0; i < rows; i++)      
    {
      for(int j = 0; j < columns; j++)
      {
        boardState[j][i] = false;
      }
      rowCounter[i] = 0;
    }
    
  }
  
  void run(){
      aim();
      draw();
  }
  
  void draw(){
    
    //creates the filled cube spaces when the spaceballs are fired into position//
    for(int i = 0; i < rows; i++)
    {
      if( i == 0) {
        rowScore = 0;
        score = -5;
      }
      for(int j = 0; j < columns; j++)
      {
        if(boardState[j][i]){
          stroke(BLACK);
          fill(FILLEDCUBE);
          score = score + 5;
        }
        else {
          stroke(BLACK);
          fill(EMPTYCUBE);
        }
        
        square((j * (squareSize + gapSize)) + gapSize + squareSize, (i * (squareSize + gapSize)) + 160, squareSize);
        
        if(!player.getStatus()){
          if(rowCounter[i] < columns && j > 0 && i > 0){
            if(boardState[j][i]){
              rowCounter[i]++; //adds one to the row counter
              
              
              //System.out.println("rowCounter[" + i + "] is " + rowCounter[i]);
            }
          }
          else if(rowCounter[i] == columns){
            //System.out.println("rowCounter[" + i + "] is " + rowCounter[i]);
          }
          else if(j == 0 && rowCounter[i] < columns){
            if(boardState[j][i]){
              rowCounter[i] = 1; //adds one to the row counter
              //System.out.println("rowCounter[" + i + "] is " + rowCounter[i]);
            }
            else {
              rowCounter[i] = 0; //resets row counter every time it goes through the row
            }
          }
        }
      }
      
       if(rowCounter[i] == columns){
         //System.out.println("rowCounter[" + i + "] is " + rowCounter[i]);
         rowScore = rowScore + 100;
       }
    }
    //System.out.println(player.getAim());
    if(!dropBlock() && player.getStatus() && !gameOver){
      player.shoot();
    }
  }
  
  void aim(){
    if(!player.getStatus()){
    for(int j = 0; j < columns; j++) {
      if(((player.getAim() > (j * (squareSize + gapSize)) + gapSize + squareSize)) && (player.getAim() < (j * (squareSize + gapSize)) + gapSize + 2*squareSize)){
        boardState[j][0] = true;
      }
      else{
        if(boardState[j][0]) {
          boardState[j][0] = false;
        }
      }
    }
    }
  }
  
  boolean dropBlock(){
    // checking all rows to see if there is a cube by which the cube beneith is not empty (aka that there
    // is a cube in the process of falling and if so, update it)
    if(player.getStatus()){
      for(int i = 0; i < rows - 1; i++) // minus 1 because we don't need to check underneath the bottom row
      {
        for(int j = 0; j < columns; j++)
        {
          if(boardState[j][i]){ //checking at location j,i
              if(boardState[j][i+1] != true){ //if the i+1th row is empty (false)
                boardState[j][i+1] = true; //its now full (true)
                boardState[j][i] = false; //the current position is now empty (the cube has moved down by 1)
                return true; //cube is still in falling state
              }
              else if(i == 0){
                if(boardState[j][i+1]){
                  gameOver = true;
                }
              }
          }
        }
      }
      return false; //we do not have any cubes falling
    }
    else{
      return false;
    }
  }
  
  int getScore() {
    if(staticScore < score + rowScore){
      staticScore = score + rowScore;
    }
    return staticScore;
  }
  
  boolean shoot(){
    if(!player.getStatus()){
      //score = score + 5; //5 pts for shooting a block
      player.shoot();
    }
    else{
    
    }
    //System.out.println(player.getAim());
    //player.shoot();
    return false;
  }
  
  boolean isGameOver(){
    return gameOver;
  }
}
