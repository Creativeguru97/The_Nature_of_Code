class NeuralNetwork{

  constructor(input_nodes, hidden_nodes, output_nodes){
    this.input_nodes = input_nodes;
    this.hidden_nodes = hidden_nodes;
    this.output_nodes = output_nodes;

    this.weights_IH = new matrix(this.hidden_nodes, this.input_nodes);
    this.weights_HO = new matrix(this.output_nodes, this.hidden_nodes);
    this.weights_IH.ranodomize();//We take random(-1, 1) for weight
    this.weights_HO.ranodomize();

    this.bias_h = new Matrix(this.hidden_nodes, 1);
    this.bias_o = new Matrix(this.output_nodes, 1);


  }

  feedforward(input_array){
    let inputs = Matrix.fromArray(input_array);

    let hidden = Matrix.multiplay(this.weights_IH, input);
    hidden.add(this.bias_h);
    //Activation function



    //Lot's of Matrix Math
    return guess;
  }
}
