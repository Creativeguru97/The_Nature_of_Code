float mutationRate = 0.01;

DNA[] population;
ArrayList<DNA> matingPool;
String target;
int generations;
PFont f;

void setup(){
  size(640, 360);
  target = "to be or not to be.";
  population = new DNA[200];
  generations = 0;
  for(int i = 0; i < population.length; i++){
    population[i] = new DNA(); // Initializing each DNA object
  }
  
  f = createFont("AppleGothic", 6, true);//true : antialiased
}


void draw(){
  float total = 0;
  float AvgFit = 0;
  for (int i = 0; i < population.length; i++){
    population[i].fitness(); //Call the fitness function
    total += population[i].fitness;
  }
  AvgFit = total / (population.length);
  
  ArrayList<DNA> matingPool = new ArrayList<DNA>(); //Start with an empty mating pool
  
  for(int i = 0; i < population.length; i++){
    int n = int(population[i].fitness * 100);
    for (int j = 0; j < n; j++){
      matingPool.add(population[i]);
    }
  }
  
  for(int i = 0; i < population.length; i++){
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    DNA parentA = matingPool.get(a);
    DNA parentB = matingPool.get(b);
    DNA child = parentA.crossover(parentB);
    child.mutate(mutationRate);
    
    population[i] = child;
  }
  generations++;
  display(AvgFit);
}

//float getAverageFitness(){
//  float total = 0;
//  for(int i = 0; i < population.length; i++){
//    total += population[i].fitness;
//  }
//  return total / (population.length);
//}

void display(float AvgFit){
  background(0);
  fill(255,230,200);
  String show = "";
  for(int i = 0; i < population.length; i++){
    show += population[i].getPhrase()+ "\n";
  }
  textFont(f,10);
  textSize(18);
  text("Total generations: " + generations, 20, 140);
  text("Average fitness: " + nf(AvgFit,0,2), 20, 165);  
  textSize(10);
  text(show, width*2/3, 10);
}
