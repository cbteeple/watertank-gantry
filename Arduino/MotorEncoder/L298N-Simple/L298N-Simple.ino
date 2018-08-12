#include <L298N.h>

//pin definition
#define EN 7
#define IN1 5
#define IN2 6

//create a motor instance
L298N motor(EN, IN1, IN2);

void setup() {

  //used for display information
  Serial.begin(115200);

  motor.setSpeed(0); // an integer between 0 and 255

}

bool dir = true;
bool up =true;

void loop() {

  //tell the motor to go forward (may depend by your wiring)

  for (int j=0; j<2; j++){
    if(j==0)
      up=false;
    else
      up=true;  

    
    for(int i=0; i<256;i++){
      if (up)
        motorGo(i, dir);
      else
        motorGo(255-i, dir);

      Serial.print(dir);
      Serial.print('\t');
      Serial.print(up);
      Serial.print('\t');
      Serial.println(i);
    
      delay(10);
    }
    
  }
  dir=!dir;
}





void confirmMotion(){
  Serial.print("Is moving = ");
  Serial.println(motor.isMoving());  
}


void getNewSpeed(){
  
}



void motorGo(int motorSpeed, bool motorDir){
  motor.setSpeed(motorSpeed);
  if (motorDir)
    motor.forward();
  else
    motor.backward();
  
  if (motorSpeed ==0)
    motor.stop();
}



