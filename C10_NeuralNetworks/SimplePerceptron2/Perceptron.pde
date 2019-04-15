//The activation function
int sign(float n){
  if(n >= 0){
    return 1;
  }else{
    return -1;
  }
}

class Perceptron{
  float [] weights;//Two inputs, and one bias weight
  float lr = 0.15;//Learning late
  
  Perceptron(int n){
    weights = new float[3];
    //Initialize the weights randomly
    for (int i = 0; i < weights.length; i++){
       weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] inputs){//I have to understand this grammer
    float sum = 0;
    for(int i = 0; i < weights.length; i++){
      sum += inputs[i] * weights[i];
    }
    int output = sign(sum);
    return output;
  }
  
  //Gradient descent : tweaking
  void train(float [] inputs, int target){//target : known answer
    int guess = guess(inputs);
    int error = target - guess;
    for(int i = 0; i < weights.length; i++){
      weights[i] += error * inputs[i] * lr;
    }
  }
  
  float guessY(float x){
    //float m = weights[1] / weights[0];
    //float b = weights[2];
    //return m * x + b;
    float w0 = weights[0];
    float w1 = weights[1];
    float wb = weights[2];
    
    return -(wb/w1)*1 - (w0/w1)*x;
  }
}
