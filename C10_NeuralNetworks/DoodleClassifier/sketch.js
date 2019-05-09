let cats;
let trains;
let rainbows;

function preload(){
  cats = loadBytes('data/cat1000.bin');
  trains = loadBytes('data/train1000.bin');
  rainbows = loadBytes('data/rainbow1000.bin');
}

function setup(){
  createCanvas(280, 280);
  background(0);

  let total = 100;
  for(let n = 0; n < total; n++){
    let img = createImage(28, 28);//Create a block of 784pixs : DOM element
    img.loadPixels();//Loading the data set
    let offset = n * 784;//each images offset
    for(i = 0; i < 784; i++){
      let val = cats.bytes[i + offset];
      img.pixels[i * 4] = val;
      img.pixels[i * 4 + 1] = val;
      img.pixels[i * 4 + 2] = val;
      img.pixels[i * 4 + 3] = 255;
    }
    img.updatePixels();
    let x = (n % 10) * 28;
    let y = floor(n / 10) * 28;//fllor : because JS gives floating number default
    image(img, x, y);//Actual display the pixels

  }
}

function draw(){

}
