function sigmoid(x){
  return 1 / (1 + Math.exp(-x));
}


class NeuralNetwork{

  constructor(input_nodes, hidden_nodes, output_nodes){
    this.input_nodes = input_nodes;
    this.hidden_nodes = hidden_nodes;
    this.output_nodes = output_nodes;

    this.weights_IH = new Matrix(this.hidden_nodes, this.input_nodes);
    this.weights_HO = new Matrix(this.output_nodes, this.hidden_nodes);
    this.weights_IH.randomize();//We take random(-1, 1) for weight
    this.weights_HO.randomize();

    this.bias_h = new Matrix(this.hidden_nodes, 1);
    this.bias_o = new Matrix(this.output_nodes, 1);
    this.bias_h.randomize();
    this.bias_o.randomize();
  }

  feedforward(input_array){
    //Generating the Hidden outputs !!!
    let inputs = Matrix.fromArray(input_array);//Make input matrix from array
    let hidden = Matrix.multiply(this.weights_IH, inputs);//I * H
    hidden.add(this.bias_h);//I * H + b (= h)
    //Activation function!
    hidden.map(sigmoid);

    //Generating the Output's outputs !!!
    let output = Matrix.multiply(this.weights_HO, hidden);//h * O
    output.add(this.bias_o);//h * O + b2
    //Activation function!
    output.map(sigmoid);

    //Sending it back to the caller
    return output.toArray();
  }

  train(inputs, targets){
    let outputs = this.feedforward(inputs);
    outputs = Matrix.fromArray(outputs);//Convert to Matrix object from array
    targets = Matrix.fromArray(targets);
    /*Calculate the console.error
    Error = targets(answer) - outputs*/
    let output_error = Matrix.subtract(targets, outputs);
    // outputs.print();
    // targets.print();
    // error.print();

    //Calculate hidden layer errors
    let weights_HO_tr = Matrix.transpose(this.weights_HO);
    let hidden_error = Matrix.multiply(weights_HO_tr, output_error);
    
  }
}
