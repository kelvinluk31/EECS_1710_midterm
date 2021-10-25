////////////// RESOLUTION /////////////
int RESOLUTIONX = 600;
int RESOLUTIONY = 960;

////////////// COLORS ///////////////
//stated colors so i don't have to reference the color number//
// Black   #000000   (0,0,0)
color BLACK = color(0, 0 ,0);
// White   #FFFFFF   (255,255,255)
color WHITE = color(255, 255 ,255);
// Red   #FF0000   (255,0,0)
color RED = color(255, 0, 0);
// Lime   #00FF00   (0,255,0)
color LIME = color(0, 255, 0);
// Blue   #0000FF   (0,0,255)
color BLUE = color(0, 0 ,255);
// Yellow   #FFFF00   (255,255,0)
color YELLOW = color(255, 255 ,0);
// Cyan / Aqua   #00FFFF   (0,255,255)
color CYAN = color(0, 255 , 255);
// Magenta / Fuchsia   #FF00FF   (255,0,255)
color MAGENTA = color(255, 0 , 255);
// Silver   #C0C0C0   (192,192,192)
color SILVER = color(192, 192 , 192);
// Gray   #808080   (128,128,128)
color GREY = color(128, 128 ,128);
// Maroon   #800000   (128,0,0)
color MAROON = color(128, 0 ,0);
// Olive   #808000   (128,128,0)
color OLIVE = color(128, 128 ,0);
// Green   #008000   (0,128,0)
color GREEN = color(0, 128 ,0);
// Purple   #800080   (128,0,128)
color PURPLE = color(128, 0 , 128);
// Teal   #008080   (0,128,128)
color TEAL = color(0, 128 ,128);
// Navy   #000080   (0,0,128)
color NAVY = color(0, 0 ,128);

color GAMEOVERBANNER = color(0,0,0,196);
color SPACEBALLS = color(170, 85, 255);
color SPACECANON = color(170, 85, 255);
color EMPTYCUBE = color(128, 128 ,128, 128); // set to alpha... figure this out later
color FILLEDCUBE = color(255, 135, 0);
color SCOREBOARD = color(255,200,75);


PImage backGround;
GunCanon player1;
Button gameButton;
gameBoard game;

void setup() {
  //sets up the size and basic layout of the application//
  size(600, 960, P2D);
  noStroke();
  backGround = loadImage("https://images.squarespace-cdn.com/content/v1/566e66eec21b865cfe870fad/1454306165493-7BVTDABT51D8IXIZPXQT/generic-background.jpg?format=1500w");
  backGround.resize(RESOLUTIONX, RESOLUTIONY);
  player1 = new GunCanon();
  gameButton = new Button(560, 930, 50, 5);
  game = new gameBoard(player1);
}

void draw() {
  //System.out.println("MouseX: " + mouseX + " | MouseY: " + mouseY); // used for debugging purpose to help find mouse cursor coordinate//
  background(backGround);
  player1.run();
  stroke(BLACK);
  fill(SCOREBOARD);
  rect(0,900, 599, 959);
  gameButton.draw();
  game.run();
  text("SCORE: "+ game.getScore(), 50, 930); textSize(20);fill(255, 255, 255);
  System.out.println(game.getScore());
  
  if(game.isGameOver()){  //This will make a GAME OVER text display when the blocks(SPACEBALLS) pile to maximum capacity making the game end.//
    fill(GAMEOVERBANNER);
    stroke(BLACK);
    rect(0, 400, 599, 200);
    stroke(WHITE);
    fill(WHITE);
    textSize(64);
    text("G A M E  O V E R", 100, 500);
  } 
}

void mouseClicked() {
  if ((mouseX > 535 && mouseX < 585) && (mouseY > 905 && mouseY < 955)) {
    gameButton.depress();
    if(!player1.getStatus()){
      game.shoot();
    }
  }
}
