class Kalman{
  float Q_angle;
  float Q_bias;
  float R_measure;
  
  float angle;
  float bias;
  float rate;
  
  float P[][]=new float[2][2];
  public Kalman(){
    Q_angle=0.001f;
    Q_bias=0.003f;
    R_measure=0.03f;
    
    angle=0.0f;
    bias=0.0f;
    
    P[0][0]=0.0f;
    P[0][1]=0.0f;
    P[1][0]=0.0f;
    P[1][1]=0.0f;
  }
  public void set_params(float q_angle, float q_bias, float r_measure){
    Q_angle=q_angle;
    Q_bias=q_bias;
    R_measure=r_measure;
  }
  public void setAngle(float angle){
    this.angle=angle;
  }
  public float getAngle(float newAngle, float newRate, float dt){
    rate=newRate-bias;
    angle+=dt*rate;
    
    P[0][0]+=dt*(dt*P[1][1]-P[0][1]-P[1][0]+Q_angle);
    P[0][1]-=dt*P[1][1];
    P[1][0]-=dt*P[1][1];
    P[1][1]+=Q_bias*dt;
    
    float error=P[0][0]+R_measure;
    float K[]={P[0][0]/error,P[1][0]/error};
    
    float y=newAngle-angle;
    
    angle+=K[0]*y;
    bias+=K[1]*y;
    
    
    float Ptemp[]={P[0][0],P[0][1]};
    
    P[0][0]-=K[0]*Ptemp[0];
    P[0][1]-=K[0]*Ptemp[1];
    P[1][0]-=K[1]*Ptemp[0];
    P[1][1]-=K[1]*Ptemp[1];
    
    return angle;
  }
}
