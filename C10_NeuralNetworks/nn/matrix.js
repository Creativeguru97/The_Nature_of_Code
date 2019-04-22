// var m = new Matrix(3, 2);
//console.table(m.matrix);

class Matrix{
  constructor(rows, cols){

    this.rows = rows;
    this.cols = cols;
    this.matrix = [];

    //Initialize value in Matrix
    for(var i = 0; i < this.rows; i++){
      this.matrix[i] = [];
      for(var j = 0; j < this.cols; j++){
        this.matrix[i][j] = 0;//Every simgle rows and cols location is a values 0
      }
    }
  }

  randomize(){
    for(var i = 0; i < this.rows; i++){
      for(var j = 0; j < this.cols; j++){
        this.matrix[i][j] = Math.floor(Math.random()*10);
      }
    }
  }

  transpose(){
    let result = new Matrix(this.cols, this.rows);//Make blank frame of Matrix

    for(var i = 0; i < this.rows; i++){
      for(var j = 0; j < this.cols; j++){
        result.matrix[j][i] = this.matrix[i][j];
      }
    }
    return result;
  }


  add(n){
    if(n instanceof Matrix){
      for(var i = 0; i < this.rows; i++){
        for(var j = 0; j < this.cols; j++){
          this.matrix[i][j] += n.matrix[i][j];
        }
      }
    }else{
      for(var i = 0; i < this.rows; i++){
        for(var j = 0; j < this.cols; j++){
          this.matrix[i][j] += n;
        }
      }
    }
  }

  multiply(n){
    if(n instanceof Matrix){
      //Matrix product
      if(this.cols !== n.rows){
        console.log('Columns of A must match rows of B');
        return undefined;
      }
      //Define every result value
      let a = this;
      let b = n;
      let result = new Matrix(a.rows, b.cols);

      for (let i = 0; i < result.rows; i++){
        for (let j = 0; j < result.cols; j++){
          //Dot product pf value in col
          let sum = 0;
          for(let k = 0; k < a.cols/* == b.rows*/; k++){
            sum += a.matrix[i][k] * b.matrix[k][j];
          }
          result.matrix[i][j] = sum;
        }
      }
      return result;
    }else{
      //Scalar product
      for(var i = 0; i < this.rows; i++){
        for(var j = 0; j < this.cols; j++){
          this.matrix[i][j] *= n;
        }
      }
    }
  }

}
