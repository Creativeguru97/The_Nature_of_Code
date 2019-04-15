import java.util.Random;

Random generator;

void setup(){
  size(400,300);
  generator = new Random();
}

void draw(){
  background(255);
  
  
  /*Gives us a Gaussian numbers with...
  mean = 0 and Std Dev(Standard deviation : 標準偏差) = 1 
  mean : average */
  
  float h = (float) generator.nextGaussian();
  
  /*Set the Std Dev and Multiply Defalut graph's height by that.*/
  h = h*10;
  /*Set mean and add the number to adjust the graph */
  h = h+100;
  
  
  fill(0);
  ellipse(width/2, height/2, h, h);
}
