class DNA{
  char [] genes;
  float fitness;
  
  DNA(){
    genes = new char[18];
    for(int i = 0; i < genes.length; i++){
      genes[i] = (char) random(32, 128); //ASCII's dec 32 to 126?
      
    }
  }
  
  // Converts character array to a String
  String getPhrase() {
    return new String(genes);
  }
  
  void fitness(){//Function to score fitness
    int score = 0;
    for(int i = 0; i < genes.length; i++){
      if(genes[i] == target.charAt(i)){ //Is the character correct?
        score++; //If so, increment the fitness score
        
      }
    }
    fitness = (float)score / (float)target.length(); //Fitness is the percentage correct
    fitness = pow(fitness, 2); //Make the fitness function exponential.
  }
  
  DNA crossover(DNA partner){//The function receives one argument(DNA) and returns DNA
    DNA child = new DNA();
    int midpoint = int(random(genes.length));
    for(int i = 0; i < genes.length; i++){
      if(i > midpoint) child.genes[i] = genes[i];//genes[i] means parentA'S genes
      else             child.genes[i] = partner.genes[i];
    }
    return child;
  }
  
  void mutate(float mutationRate){
    for(int i = 0; i < genes.length; i++){//Looking every gene in the array
      if(random(1) < mutationRate){
        genes[i] = (char) random(32, 128);
      }
    }
  }
  
 
  
}
