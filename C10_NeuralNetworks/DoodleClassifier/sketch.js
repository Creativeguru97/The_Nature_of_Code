const len = 784;//cannot be reassigned
const total_data = 1000;
let cats_data;
let trains_data;
let rainbows_data;

//Make blank objects
let cats = {};
let trains = {};
let rainbows = {};


function preload(){
  cats_data = loadBytes('data/cat1000.bin');
  trains_data = loadBytes('data/train1000.bin');
  rainbows_data = loadBytes('data/rainbow1000.bin');
}

function prepareData(category, data){
  //Make objects inside cata object
  category.training = [];
  category.testing = [];

  for(let i = 0; i < total_data; i++){
    let offset = i * len;
    let threshold = floor(0.8 * total_data);
    if(i < threshold){
      //800 of data going into training
      category.training[i] = data.bytes.subarray(offset, offset + len);
    }else{
      //rest 200 going into testing
      category.testing[i - threshold] = data.bytes.subarray(offset, offset + len);
    }
  }
}

function setup(){
  createCanvas(280, 280);
  background(0);
  prepareData(cats, cats_data);
  prepareData(trains, trains_data);
  prepareData(rainbows, rainbows_data);


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

  // }
}

function draw(){

}
