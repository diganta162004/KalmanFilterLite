class Complementary{
  double angle;
  double ratio_g;
  double ratio_a;
  
  public Complementary(){
    angle=0;
    ratio_g=.9;
  }
  public void setAngle(double angle){
     this.angle=0;
  }
  public void setParam(double ratio_g){
     this.ratio_g=ratio_g; 
     this.ratio_a=1-ratio_g;
  }
  float getAngle(double ax, double gx, double dt){
    angle=(gga*ratio_g)+(ax*ratio_a);
    return (float)angle;
  }
}
