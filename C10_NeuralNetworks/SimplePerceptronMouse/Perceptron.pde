//The activation function
int sign(float n){
  if(n >= 0){
    return 1;
  }else{
    return -1;
  }
}

class Perceptron{
  float [] weights = new float[2];
  float lr = 0.1;//Learning late
  
  Perceptron(){
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
}
