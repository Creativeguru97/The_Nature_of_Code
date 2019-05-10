const len = 784;//cannot be reassigned
const total_data = 1000;

//Make labels
const CAT = 0;
const TRAIN = 1;
const RAINBOW = 2;

let cats_data;
let trains_data;
let rainbows_data;

//Make blank objects
let cats = {};
let trains = {};
let rainbows = {};

let nn;

function preload(){
  cats_data = loadBytes('data/cat1000.bin');
  trains_data = loadBytes('data/train1000.bin');
  rainbows_data = loadBytes('data/rainbow1000.bin');
}

function prepareData(category, data, label){
  //Make objects inside cata object
  category.training = [];
  category.testing = [];
  for(let i = 0; i < total_data; i++){
    let offset = i * len;
    let threshold = floor(0.8 * total_data);
    if(i < threshold){
      //800 of data going into training
      category.training[i] = data.bytes.subarray(offset, offset + len);//subdivide each image's vals
      category.training[i].label = label;
      // console.log(category.training[i].label);
    }else{
      //rest 200 going into testing
      category.testing[i - threshold] = data.bytes.subarray(offset, offset + len);
      category.testing[i - threshold].label = label;
    }
  }
}


function trainEpoch(training){
  shuffle(training, true); //p5.js function

  //Train for one epoch
  //epoch : In this case, one epoch : training 800 of images
  // for(let j = 0; j < 5; j++){
    for(let i = 0; i < training.length; i++){
      let data = training[i];
      let inputs = data.map(x => x / 255.0);//JavaScript syntax
      let label = training[i].label;
      let targets = [0, 0, 0];
      targets[label] = 1;

      nn.train(inputs, targets);
      // console.log(inputs);
    }
   // }
  // console.log(training.length);
}

function testAll(testing){
  shuffle(testing, true);
  let correct = 0;
  for(let i = 0; i < testing.length; i++){
    let data = testing[i];
    let inputs = data.map(x => x / 255.0);//JavaScript syntax
    let label = testing[i].label;
    let guess = nn.feedforward(inputs);

    let m = max(guess);
    let classification = guess.indexOf(m);
    // console.log(guess);
    // console.log(classification);
    // console.log(label);

    if(classification === label){
      correct++;
    }
  }

  let percent = correct / testing.length * 100;
  return percent;
}


function setup(){
  createCanvas(280, 280);
  background(0);

  //Preparing the data
  prepareData(cats, cats_data, CAT);//Put label at last
  prepareData(trains, trains_data, TRAIN);
  prepareData(rainbows, rainbows_data, RAINBOW);

  nn = new NeuralNetwork(784, 64, 3);

  //Train it to learn about the three categories
  //Then Randomizing the data
  let training = [];
  training = training.concat(cats.training);
  training = training.concat(trains.training);
  training = training.concat(rainbows.training);
  // console.log(training);

  let testing = [];
  testing = testing.concat(cats.testing);
  testing = testing.concat(trains.testing);
  testing = testing.concat(rainbows.testing);

  for(let i = 1; i < 11; i++){
  trainEpoch(training);
  console.log("Epoch: "+ i);
  let percent = testAll(testing);
  console.log(percent +"% correct!!!");
}
  // let percent = testAll(testing);
  // console.log(percent +"% correct!!!");

  //
  // let total = 100;
  // for(let n = 0; n < total; n++){
  //   let img = createImage(28, 28);//Create a block of 784pixs : DOM element
  //   img.loadPixels();//Loading the data set
  //   let offset = n * 784;//each images offset
  //   for(i = 0; i < 784; i++){
  //     let val = cats_data.bytes[i + offset];
  //     img.pixels[i * 4] = val;
  //     img.pixels[i * 4 + 1] = val;
  //     img.pixels[i * 4 + 2] = val;
  //     img.pixels[i * 4 + 3] = 255;
  //   }
  //   img.updatePixels();
  //   let x = (n % 10) * 28;
  //   let y = floor(n / 10) * 28;//fllor : because JS gives floating number default
  //   image(img, x, y);//Actual display the pixels
  //
  // }
}

function draw(){

}
