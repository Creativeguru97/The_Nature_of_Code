// var brain;
// function setup(){
//   brain = NeuralNetwork(3, 3, 1);
// }
//
// function draw(){
//
// }

// function setup(){
//   let a = new Matrix(2, 3);
  // a.randomize();
  // let d = a.transpose();
  // console.table(a.data);
  // console.table(d.data);

  // let b = new Matrix(3, 2);
  // a.randomize();
  // b.randomize();
  // console.table(a.matrix);
  // console.table(b.matrix);
  //
  // let c = a.multiply(b);
  // console.table(c.matrix);
// }

 function setup(){
  let a = new Matrix(2, 2);
  a.randomize();
  a.randomize();
  a.print();

  function doubleIt(x){
    return x * 2;
  }

  //Additional
  // function doubleIt(x, i, j){
  //   if(i > 0){
  //     return x * 2;
  //   }else{
  //     return x;
  //   }
  // }

  a.map(doubleIt);
  a.print();

}
