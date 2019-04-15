class BallSystem{
  ArrayList<Ball> balls;
  PVector origin;
  
  BallSystem(PVector ballLocation){
    origin = ballLocation;
    balls = new ArrayList<Ball>();
  }
  
  void addBall(){
    balls.add(new Ball(origin));
  }
  
  void run(){
    for(Ball b : balls){
    b.display();
    }
  }
  
  
  
}
