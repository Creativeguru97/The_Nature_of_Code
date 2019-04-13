
var population;
var lifeSpan = 200;
var count = 0;
var lifeCountDisplay;
var target;

function setup(){
  createCanvas(640, 360);
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
    population = new Population();
    count = 0;
  }
  ellipse(target.x, target.y, 16, 16);
}

//Population Class
function Population(){
  this.rockets = [];
  this.PopulationSize = 25;

  for(var i = 0; i < this.PopulationSize; i++){
    this.rockets[i] = new Rocket();//New object of the class below
  }

  this.evaluate = function(){
    for(var i = 0; i < this.PopulationSize; i++){
      this.rockets[i].calcFitness();
    }
  }

  this.run = function(){
    for(var i = 0; i < this.PopulationSize; i++){
      this.rockets[i].update();
      this.rockets[i].show();
    }
  }
}

//DNA Class
function DNA(){
  this.genes = [];
  for(var i = 0; i < lifeSpan; i++){
    this.genes[i] = p5.Vector.random2D();//This time genes itself is vector
    this.genes[i].setMag(0.1);
  }
}

//Rocket Class
function Rocket(){
  this.pos = createVector(width/2, height);
  //this.vel = createVector(0, -1);
  this.vel = createVector();
  this.acc = createVector();
  this.dna = new DNA();
  this.fitness = 0;

  this.applyForce = function(force){
    this.acc.add(force);
  }

  this.calcFitness = function(){
    var d = dist(this.pos.x, this.pos.y, this.target.x, this.target.y);
    this.fitness = 1/d;
  }

  this.update = function(){//Function in Class
    this.applyForce(this.dna.genes[count]);
    //this.count++; //Because count is global variable

    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
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
