 Walker[] army;

class Walker{
  //two member variables
  int myX, myY, myColor;
  boolean dead;
  //three member functions
  //one special member fuction is constructor
  Walker(){
    myX = width/2;
    myY = height/2;
    myColor = color(191, 188, 174);

  }
  //Walker(int x, int y, int red, int green, int blue){//overriding constructor 
   // myX = x;
   // myY = y;
   // myColor = color(red, green, blue);
 // }
  
  void walk(){
  if(mouseX > myX){
myX = myX - (int)(Math.random()*4);
}else{
myX = myX + (int)(Math.random()*4);
}
if(mouseY > myY){
myY = myY - (int)(Math.random()*4);
}else{
myY = myY + (int)(Math.random()*4);
}

  }
  void show(){
    if(dist(myX, myY, mouseX, mouseY)<25){
      dead = true;
    }
    if(dead==false){
    noStroke();
    fill(242, 216, 234);
    ellipse(myX-10,myY,8,2);
    stroke(0,0,0);
    fill(myColor);
    ellipse(myX+7, myY-7,3,5);
  arc(myX,myY, 20,20, PI, PI*2);
  ellipse(myX+4, myY-7,3,4);
  fill(0,0,0);
  ellipse(myX+4,myY-2,2,3);
    }
}
}//end of walker class

//you need to call new twice: the first one creates empty apartments, the second fills them

void setup(){
  size(500,500);
  army = new Walker[1000];
  for(int i = 0; i < army.length; i++){
    army[i] = new Walker();
  }
}

void drawCat(int myX, int myY){
  noStroke();
  fill(227, 209, 161);
  ellipse(myX, myY, 60, 40);
  triangle(myX-25, myY-10, myX-6, myY-10, myX-18, myY-30);
  triangle(myX+25, myY-10, myX+6, myY-10, myX+18, myY-30);
  fill(0,0,0);
  ellipse(myX-12, myY, 6, 8);
  ellipse(myX+12, myY, 6, 8);
  triangle(myX-3, myY+2, myX+3, myY+2, myX, myY+6);
}

void draw(){
  stroke(0,0,0);
  background(160, 199, 219);
  for (int i = 0; i < army.length; i++){
    army[i].walk();
    army[i].show();
  }
  drawCat(mouseX,mouseY);
}

