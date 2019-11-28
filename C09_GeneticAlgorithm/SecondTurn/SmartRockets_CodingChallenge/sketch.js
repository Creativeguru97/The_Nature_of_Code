
var population;
var lifeSpan = 450;
var count = 0;
var lifeCountDisplay;
var target;
var mutationRate;

var oX = 200;
var oY = 160;
var oW = 150;
var oH = 10;

function setup(){
  createCanvas(640, 360);
  mutationRate = 0.01;
  rocket = new Rocket();
  population = new Population();
  lifeCountDisplay = createP();
  target = createVector(width/2, 50);
}

function draw(){
  background(0);
  population.run();
  lifeCountDisplay.html(count);
  count++;

  if (count >= lifeSpan){
    // population = new Population();
    population.evaluate();
    population.selection();

    count = 0;
  }

  rect(200, 160, 150, 10);
  ellipse(target.x, target.y, 16, 16);
}

//Population Class
function Population(){
  this.rockets = [];
  this.PopulationSize = 50;
  this.matingPool = [];

  for(var i = 0; i < this.PopulationSize; i++){
    this.rockets[i] = new Rocket();//New object of the class below
  }

  this.evaluate = function(){

    var maxFit = 0;
    for(var i = 0; i < this.PopulationSize; i++){
      this.rockets[i].calcFitness();
      if(this.rockets[i].fitness > maxFit){
        maxFit = this.rockets[i].fitness;
      }
    }
    //createP(maxFit);

    for(var i = 0; i < this.PopulationSize; i++){
      this.rockets[i].fitness /= maxFit;
    }

    this.matingPool = [];
    for(var i = 0; i < this.PopulationSize; i++){
      var matingNum = this.rockets[i].fitness * 100;
      for(var j = 0; j < matingNum; j++){
        this.matingPool.push(this.rockets[i]);
      }
    }
  }

  this.selection = function(){//In Processing example, "reproduction"
    var newPopulation = [];
    for(var i = 0; i < this.rockets.length; i++){
    /*This gives us random element from that array, so we don't need to pick
    a random index !!!*/
      var parentA = random(this.matingPool).dna;
      var parentB = random(this.matingPool).dna;
      var child = parentA.crossover(parentB);
      child.mutation();
      newPopulation[i] = new Rocket(child);
    }
    this.rockets = newPopulation;
  }

  this.run = function(){
    for(var i = 0; i < this.PopulationSize; i++){
      this.rockets[i].update();
      this.rockets[i].show();
    }
  }
}

//DNA Class
function DNA(genes){
  if(genes){//if this genes exist...
    this.genes = genes;//then this.genes should be that array
  }else{//otherwise, do this stuff below
    this.genes = [];
    for(var i = 0; i < lifeSpan; i++){
      this.genes[i] = p5.Vector.random2D();//This time genes itself is vector
      this.genes[i].setMag(0.1);
    }
  }

  this.crossover = function(partner){
    var newgenes = [];
    var midPoint = int(random(this.genes.length));
    for(var i = 0; i < this.genes.length; i++){
      if(i > midPoint){
        newgenes[i] = this.genes[i];
      }else{
        newgenes[i] = partner.genes[i];
      }
    }
    return new DNA(newgenes);//Return a new DNA object with newgenes
  }

  this.mutation = function(){
    for(var i = 0; i < this.genes.length; i++){
      if(random(1) < mutationRate){
        this.genes[i] = p5.Vector.random2D();
        this.genes[i].setMag(0.1);
      }
    }
  }
}

//Rocket Class
function Rocket(dna){
  this.pos = createVector(width/2, height);
  //this.vel = createVector(0, -1);
  this.vel = createVector();
  this.acc = createVector();
  this.reachGoal = false;
  this.wrecked = false;
  if(dna){
    this.dna = dna;
  }else{
    this.dna = new DNA();
  }

  this.fitness = 0;

  this.applyForce = function(force){
    this.acc.add(force);
  }

  this.calcFitness = function(){
    var d = dist(this.pos.x, this.pos.y, target.x, target.y);
    this.fitness = 1/d;
    if(this.reachGoal){
      this.fitness *= 5;
    }
    if(this.wrecked){
      this.fitness /= 10;
    }
  }

  this.update = function(){//Function in Class
    var d = dist(this.pos.x, this.pos.y, target.x, target.y);
    if(d < 10){
      this.reachGoal = true;
      //this.pos = target.copy();
    }

    if(this.pos.x > oX && this.pos.x < oX+oW && this.pos.y > oY && this.pos.y < oY+oH){
      this.wrecked = true;
    }

    this.applyForce(this.dna.genes[count]);
    //this.count++; //Because count is global variable
    if(!this.reachGoal && !this.wrecked){
      this.vel.add(this.acc);
      this.pos.add(this.vel);
      this.acc.mult(0);
      //this.vel.limit(4);
    }
  }

  this.show = function(){
    push();//pushMatrix !!!!
    noStroke();
    fill(255, 150);
    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading());//heading2D in Processing
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    pop();//popMatrix !!!!!
  }
}
