let training_data = [{
    inputs:[1, 0],
    targets:[1]
  },
  {
    inputs:[0, 1],
    targets:[1]
  },
  {
    inputs:[1, 1],
    targets:[0]
  },
  {
    inputs:[0, 0],
    targets:[0]
  }
];
//Interesting syntax !!!!!!!!!!!!!!!!

function setup(){
  let nn = new NeuralNetwork(2, 2, 1);
  for(let i = 0; i < 3; i++){
    let data = random(training_data);
      nn.train(data.inputs, data.targets);
  }
    // for(let i = 0; i < 50; i++){
    //   for(let j = 0; j < training_data; i++){
    //     nn.train(training_data.inputs[j], training_data.targets[j]);
    //   }
    //   print(nn.train.inputs);
    // }

  console.log(nn.feedforward([1, 0]));
  console.log(nn.feedforward([0, 1]));
  console.log(nn.feedforward([1, 1]));
  console.log(nn.feedforward([0, 0]));

}
