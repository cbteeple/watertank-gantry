#include "retract.h"

#define PID_START_BYTE 0
#define SETPOINT_START_BYTE 12

DCMotorServo servo = DCMotorServo(
        pin_dcmoto_dir1,
        pin_dcmoto_dir2,
        pin_dcmoto_pwm_out,
        pin_dcmoto_encode1,
        pin_dcmoto_encode2);

motorFuns::motorFuns();


void motorFuns::setPID(){
  servo.myPID->SetTunings(PID_Tunings[0],PID_Tunings[1],PID_Tunings[2]);  
}


void motorFuns::readPID(){ 
  EEPROM_readAnything(PID_START_BYTE, PID_Tunings);
  setPID();
}


void motorFuns::savePID(){ 
  EEPROM_writeAnything(PID_START_BYTE, PID_Tunings);
  setPID();
}

void motorFuns::initialize(){
  readPID();
  servo.setPWMSkip(PWMSkip);
  servo.setAccuracy(Accuracy);
  return servo;
}


