/*Perlin Noise is going to allow us to create a randomness
in our code that is smooth, that has more organic feel to it.
Idea is changing number is related to the previous one, so numbers change 
slightly over time.*/


float noiseRange = 0;

void setup(){
  size(600,400);
}

void draw(){
  background(0);
  fill(255);
  
  /*Pure random*/
  float x = random(width);
  ellipse(x, height/3, 40, 40);
  
  /*Perlin noise*/
  
  /*Add time proceed to every frame*/
  noiseRange = noiseRange + 0.03;
  float x2 = noise(noiseRange);
    /*Noise function always gives us a value between 0 and 1
  So by defalut, the circle won't move.
  But We can affect it using map();*/
  x2 = map(x2, 0, 1, 0, width);
  ellipse(x2, height*2/3, 40, 40);
  
  
}
