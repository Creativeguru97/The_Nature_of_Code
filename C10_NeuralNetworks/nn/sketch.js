// var brain;
// function setup(){
//   brain = NeuralNetwork(3, 3, 1);
// }
//
// function draw(){
//
// }

function setup(){
  let a = new Matrix(2, 3);
  a.randomize();
  let d = a.transpose();
  console.table(a.matrix);
  console.table(d.matrix);

  // let b = new Matrix(3, 2);
  // a.randomize();
  // b.randomize();
  // console.table(a.matrix);
  // console.table(b.matrix);
  //
  // let c = a.multiply(b);
  // console.table(c.matrix);
}
