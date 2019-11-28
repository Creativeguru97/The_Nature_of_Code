let r,g,b;
let nn;
let which = 'black';
let qFill = 0;

function pickColor(){
  r = random(255);
  g = random(255);
  b = random(255);
  redraw();
}

function setup(){
  createCanvas(640, 360);
  noLoop();//Only one time go through draw loop
  nn = new NeuralNetwork(3, 48, 2);//In this case,  we have to declare nn before pickColor
  //hidden node : 48 : 28s
  //36 : 23s
  //24 : 14s
  //12:8s
  //8: 6s
  //6: 5s

  nn.learningRate(0.05);
  for(let i = 0; i < 50000; i++){
    let r = random(255);
    let g = random(255);
    let b = random(255);
    let targets = trainColor(r,g,b);
    let inputs = [r/255, g/255, b/255];
    nn.train(inputs, targets);
  }
  console.log('Learning process complite!');
  pickColor();
}

function trainColor(r,g,b){
  if(r+g+b > 381){
    return [1, 0];
  }else{
    return [0, 1];
  }
}

function draw(){
  background(r,g,b);
  strokeWeight(4);
  stroke(0);
  line(width/2, 70, width/2, height);

  textSize(64);
  noStroke();
  fill(0);
  textAlign(CENTER, CENTER);
  text('black', width/4, height/2);
  fill(255);
  text('white', width*3/4, height/2);

  let which = colorPredictor(r,g,b);

  if(which === "black"){
    qFill = 0;
    fill(0);
    ellipse(width/4, height/2-90, 30);
  }else{
    qFill = 255;
    fill(255);
    ellipse(width*3/4, height/2-90, 30);
  }

  textSize(24);
  noStroke();
  fill(qFill);
  textAlign(CENTER, CENTER);
  text('Does White or Black look better over this color?', width/2, 35);

}


function colorPredictor(r,g,b){
  // console.log(r+g+b);
  let inputs = [r/255, g/255, b/255];
  let outputs = nn.feedforward(inputs);
  console.log("Input: "+[r+",  "+g+",  "+b]);
  console.log("Output: "+outputs[0]+",  "+outputs[1]);
  console.log("------------------------------");


  if(outputs[0] > outputs[1]){
    return "black";
  }else{
    return "white";
  }
}

function mousePressed(){
  // train the nn
  // let targets;
  // if(mouseX < width/2){
  //   targets = [1, 0];
  // }else{
  //   targets = [0, 1];
  // }
  // let inputs = [r/255, g/255, b/255];
  // nn.train(inputs, targets);
  // print(inputs);
  // print(targets);

  pickColor();
}
