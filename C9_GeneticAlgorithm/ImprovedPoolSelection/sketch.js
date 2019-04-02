var fruits = [
  {name: "mango", score: 5},
  {name: "blueberry", score: 3},
  {name: "cherry", score: 1},
  {name: "melon", score: 7},
  {name: "apple", score: 1},
];

function setup(){
  createCanvas(400, 300);
  background(0);

  var sum = 0;
  for(var i = 0; i < fruits.length; i++){
    sum += fruits[i].score;//Add all scores
  }
  for(var i = 0; i < fruits.length; i++){
    fruits[i].prob = fruits[i].score/sum;//Calculate each phrase's probability
    fruits[i].count = 0;
  }

  //var melonCount = 0;
  for(var i = 0; i < 10000; i++){
    var fruit = pickOne(fruits);
    fruit.count++;
  }
}

function pickOne(list){
  var index = 0;
  var r = random(1);

  while(r > 0){
    r = r - list[index].prob;//We subtract scores until it become negative value
    index++;
  }
  /*When this loop finished, we want previous phrase
  that made the r finally minus*/
  index--;
  return list[index];
}
