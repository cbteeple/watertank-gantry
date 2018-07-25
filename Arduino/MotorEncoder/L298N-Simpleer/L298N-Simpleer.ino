#include <L298N.h>

//pin definition
#define EN 5
#define IN1 6
#define IN2 7

//create a motor instance
L298N motor(EN, IN1, IN2);

void setup() {

  //used for display information
  Serial.begin(115200);

  motor.setSpeed(0); // an integer between 0 and 255

}

bool dir = true;
int motorSpeed = 0;

void loop() {

  getNewSpeed();
  motorGo(motorSpeed, dir);

}





void confirmMotion(){
  Serial.print("Is moving = ");
  Serial.println(motor.isMoving());  
}


void getNewSpeed(){
  while (Serial.available() > 0) {

    // look for the next valid integer in the incoming serial stream:
    int motorSerial = Serial.parseInt();

    // look for the newline. That's the end of your sentence:
    if (Serial.read() == '\n') {
      if(motorSerial<0){
        motorSpeed=-motorSerial; 
        dir=true;
      }
      else{
        motorSpeed=motorSerial; 
        dir=false;
      }
      Serial.print(motorSpeed);
      Serial.print('\t');
      Serial.println(dir);
    }
  }
  return motorSpeed;
  
}



void motorGo(int Speed, bool motorDir){
  if (Speed ==0)
    motor.stop();
  else{
    motor.setSpeed(Speed);
    if (motorDir)
      motor.forward();
    else
      motor.backward();
  }
  
  
}



