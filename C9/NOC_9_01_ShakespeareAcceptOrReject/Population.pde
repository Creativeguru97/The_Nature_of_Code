// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Genetic Algorithm, Evolving Shakespeare

// A class to describe a population of virtual organisms
// In this case, each organism is just an instance of a DNA object

class Population {

  float mutationRate;           // Mutation rate
  DNA[] population;             // Array to hold the current population
  ArrayList<DNA> matingPool;    // ArrayList which we will use for our "mating pool"
  String target;                // Target phrase
  int generations;              // Number of generations
  boolean finished;             // Are we finished evolving?
  int perfectScore;
  float maxFitness = 0;

  Population(String p, float m, int num) {
    target = p;
    mutationRate = m;
    population = new DNA[num];
    for (int i = 0; i < population.length; i++) {
      population[i] = new DNA(target.length());
    }
    calcFitness();
    matingPool = new ArrayList<DNA>();
    finished = false;
    generations = 0;
    
    perfectScore = 1;
  }

  // Fill our fitness array with a value for every member of the population
  void calcFitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness(target);
    }
  }

  // Create a new generation
  void generate() {
    //float maxFitness = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness;
      }
    }
    
    // Refill the population with children from the mating pool
    int[] newPopulation;
    int besafe = 0;
    for (int i = 0; i < population.length; i++) {
      int index = floor(random(0, population.length));
      int index2 = floor(random(0, population.length));
      DNA partner = population[index];
      DNA partner2 = population[index2];
      DNA partnerA;
      DNA partnerB;
      
      float randomValue = random(0, maxFitness);
      if(randomValue < partner.fitness){
        partnerA = partner;
      }
      
      //Pick random two parents
      //DNA partnerA = acceptReject(maxFitness);
      //DNA partnerB = acceptReject();
      DNA child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      population[i] = child;
    }
    generations++;
    besafe++;
  }
  
  //float acceptReject(){
    
  //  int besafe = 0;
  //  while(true){
  //    int index = floor(random(0, population.length));
  //    DNA partner = population[index];
  //    float randomValue = random(0, maxFitness);
      
  //    if(randomValue < partner.fitness){
  //      return population[index];
  //    }
  //    besafe++;
  //  }
  //}


  // Compute the current "most fit" member of the population
  String getBest() {
    float worldrecord = 0.0;
    int index = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > worldrecord) {
        index = i;
        worldrecord = population[i].fitness;
      }
    }
    
    if (worldrecord == perfectScore ) finished = true;
    return population[index].getPhrase();
  }

  boolean finished() {
    return finished;
  }

  int getGenerations() {
    return generations;
  }

  // Compute average fitness for the population
  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++) {
      total += population[i].fitness;
    }
    return total / (population.length);
  }

  String allPhrases() {
    String everything = "";
    
    int displayLimit = min(population.length,50);
    
    
    for (int i = 0; i < displayLimit; i++) {
      everything += population[i].getPhrase() + "\n";
    }
    return everything;
  }
}
