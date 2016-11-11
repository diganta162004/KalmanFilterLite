
class SKalman{
  double q;//process covariance
  double r;//measurement noise
  double x;//value
  double p;//estimation error
  double k;//kalman gain
  
  public SKalman(){
    this.q=0.0625;
    this.r=2;
    this.p=1.5;
    this.x=0;
  }
  public void setAngle(double angle){
     x=angle;
  }
  public void set_params(double p,double q, double r){
    this.q=q;
    this.r=r;
    this.p=p;
  }
  float getAngle(double measurement){
    p=p+q;
    k=p/(p+r);
    x=x+k*(measurement-x);
    p=(1-k)*p;
    return (float)x;
  }
}
