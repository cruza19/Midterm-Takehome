//// Midterm.  CST 112.  Abel Cruz.

String title=  "Moby Dick.";
String author=  "Abel Cruz";

int width=640, height=480;
float surface=  height/4;
float boatX;
float boat2X= width+20;
float speed=1;
float fishX=width/2; 
float fishY=height/2;
float crawX=width/2;
float crawY=height-25;
float dX=random(2, 5), dY=random(-3, 3);
int boatscore=0;
int crawscore=0;

float B;
float R;
float G1;

float R1;
//// SETUP ////
void setup() {
  size( 640, 480 );
}

void draw() 
{

  scene();
  boatshow();
  boatmove1();
  boatmove2();
  fishmove();
  fishshow();
  boatshow();
  crawshow();
  boatfishing();
  fishingkey1();
  fishingkey2();
  crawfishing();
  out();
  msg();

  //craw();
}

void scene()
{

  if (fishX<=5) 
  {
    R=random(0, 150);      ////change sky color every pass
    B=random(0, 150);
  }  


  background(R, 250, B);

  if (boat2X<=-60)
  {

    R1=random(0, 150);        ////change water color every pass
    G1=random(0, 150);
  }
  fill(R1, G1, 255);
  rect(0, surface, width, height);
}
void boatmove1() ////Right and Left Movement
{

  boatX=boatX + speed;

  if (boatX>=width-60) { 

    boat2X=(boat2X-speed);
    if (boat2X<=-65) {
      boatX=-20;
      boat2X=width+20;
    }
  }
}
void boatmove2() ////loop
{

  if ((boatX>=width-60) && (boat2X<=-65)) {

    boatmove1();
  }
}
void fishmove()        ///bouncy fish
{

  fishX= (fishX + dX);
  fishY= (fishY + dY);
  if ((fishX > width) || (fishX <= 0)) {
    dX=  - dX;
  }
  if ((fishY > height) || (fishY < surface+30)) {
    dY=  - dY;
  }
}
void boatshow()
{
  noStroke();          ////boat to the right
  fill(219, 75, 97);

  rect(boatX, surface-20, 60, 20);
  rect(boatX+25, surface-30, 20, 10);
  triangle(boatX+60, surface, boatX+60, surface-20, boatX+80, surface-20);

  rect(boat2X, surface-20, 60, 20); ////boat to the left
  rect(boat2X+25, surface-30, 20, 10);
  triangle(boat2X, surface, boat2X, surface-20, boat2X-20, surface-20);
}
void fishshow()          ////fish
{
  noStroke();
  fill(219, 209, 18); 
  ellipse(fishX, fishY, 70, 40);
  triangle(fishX-50, fishY-25, fishX-50, fishY+25, fishX-35, fishY);
  fill (random(0, 150), 150, random(0, 150));
  ellipse(fishX+15, fishY, 15, 15);
}
void crawshow()           //// ugly crawler
{
  fill(random(0, 250), random(0, 250), random(0, 250));
  ellipse(crawX, crawY, 50, 50);
}
void crawfishing()       /////crawler looking for a fish near 50px w/ mousepressed
{

  if (mousePressed && mouseY> height/2) {
    crawX= mouseX;
    if 
      (dist(crawX, crawY, fishX, fishY) < 50) {
      crawscore= crawscore+1;
      crawX= random(0, width);
      fishX= random(0, width/2);
      fishY= random(surface+30, height);
    }
  }
}

void fishingkey2()       /////crawler looking for a fish near 50px w/ "C" 
{


  if  (keyPressed) { 
    if ((key =='c' && dist(crawX, crawY, fishX, fishY) < 100))
    {
      crawscore= crawscore+1;
      crawX= random(0, width);
      fishX= random(0, width/2);
      fishY= random(surface+30, height);
    }
  }
}


void boatfishing() {        /////Boat looking for a fish near 50px w/ mousepressed
  if ((mouseX > boatX && mouseX < boatX+60 && mouseY > surface-20 && mouseY < surface+20 && mousePressed && dist(boatX, surface-20, fishX, fishY) < 150) ||
    mouseX > boat2X && mouseX < boat2X+60 && mouseY > surface-20 && mouseY < surface+20 && mousePressed && dist(boat2X, surface-20, fishX, fishY) < 150)
  {
    boatscore= boatscore+1;
    fishX= random(0, width/2);  
    fishY= random(surface+30, height);
  }
  fill(0);
}

void fishingkey1()           /////Boat looking for a fish near 50px w/  mousepressed
{


  if  (keyPressed) { 
    if ((key =='b' && dist(boatX, surface-20, fishX, fishY) < 150) ||
      (key =='b' && dist(boat2X, surface-20, fishX, fishY) < 150)) {
      boatscore= boatscore+1;
      fishX= random(0, width/2);
      fishY= random(surface+30, height);
    }
  }
}

void out()
{
  if (keyPressed) {
    if (key == 'q') {
      exit();
    }
  }
}
void msg()
{
  textAlign(CENTER);
  textSize(22);
  text("Moby Dick.", width/2, height/7);
  textAlign(RIGHT);
  textSize(11);
  text("Boat:", width-65, surface/3);
  text(boatscore, width-50, surface/3);
  text("Crawler:", width-67, surface/5);
  text(crawscore, width-50, surface/5);
  textAlign(LEFT);
  text("Catch fish by clicking on Boat or Crawler.", 0, surface/5);
  text("(Or use keys: 'b' for boat, 'c' for crawler, 'q' to quit.).", 0, surface/3);
  textSize(8);
  text(boatscore, boatX+32, surface-22);
  text(boatscore, boat2X+32, surface-22);
  text(crawscore, crawX-2, crawY+2);
  textSize(16);
  textAlign(LEFT);
  fill(250, 250, 250);
  text("Program made by Abel Cruz.", 0, surface*3.9);
}
