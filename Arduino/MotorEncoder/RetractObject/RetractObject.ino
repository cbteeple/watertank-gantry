//Include Encoder and PID_v1 to enable DCMotorServo's usage of them.
//(see: http://stackoverflow.com/questions/6504211/is-it-possible-to-include-a-library-from-another-library-using-the-arduino-ide)
#include <Encoder.h>
#include <PID_v1.h>
#include <DCMotorServo.h>
#include <EEPROMAnything.h>


#define pin_dcmoto_dir1 4
#define pin_dcmoto_dir2 5
#define pin_dcmoto_pwm_out 6
#define pin_dcmoto_encode1 3
#define pin_dcmoto_encode2 2
//Determined by experimentation, depends on your encoder, and your belt/gearing ratios:
#define dcmoto_encoder_1_rev 1920

#define settingsStart 0

struct config_t
{
    float PID_Tunings[3]={0.1,0.05,0.05};
    float setpoint =3;
    unsigned int looptime =100;
} settings;


int servoMode=0;
int setCounts=0;
int prevPos=0;
bool motorOn=false;
bool outputsOn= false;

DCMotorServo servo = DCMotorServo(pin_dcmoto_dir1, pin_dcmoto_dir2, pin_dcmoto_pwm_out, pin_dcmoto_encode1, pin_dcmoto_encode2);

bool flip=false;

//Timing Vars
unsigned long timeCurr=0;
unsigned long timeLast=0;
long encoder_offset=0;


void setup() {

  //Tune the servo feedback
  //Determined by trial and error
  servo.myPID->SetTunings(settings.PID_Tunings[0],settings.PID_Tunings[1],settings.PID_Tunings[2]);
  servo.setPWMSkip(50);
  servo.setAccuracy(50);
  //Un-necessary, initializes to 0:
  //servo.setCurrentPosition(0);
  Serial.begin(115200);
}


void loop() {
  //wait 1s before starting
  static unsigned long motor_timeout = millis() + 1000;
  static bool motor_go = 0;


  readSerial();
  timeCurr=millis();

  if (outputsOn && timeCurr-timeLast>= settings.looptime){
    Serial.print(timeCurr);
    Serial.print('\t');
    Serial.print(timeCurr-timeLast);
    Serial.print('\t');
    Serial.print(servo.getRequestedPosition()-encoder_offset);
    Serial.print('\t');
    Serial.print(servo.getActualPosition()-encoder_offset);
    Serial.print('\n');
    timeLast=timeCurr;  
  }


  
  if(motorOn){
    setSetpoint();
       
  /*   if (servo.finished()) {
      if(motor_go) {
        //stop disengages the motor feedback system, in which case if you moved the motor, it would fight you if you didn't "stop" it first (provided you were still running servo.run() operations)
        servo.stop();
       // motor_timeout = millis() + 1500;
      //  motor_go = 0;

      }
     if(motor_timeout < millis()) {
        //Setting a move operation will ensure that servo.finished() no longer returns true

        servo.moveTo(setCounts+encoder_offset);
          
        motor_go = 1;
        flip=!flip;
      }
      
    }*/
    servo.moveTo(setCounts+encoder_offset);
    //Run the servo
    servo.run();
  }


}




//ACTUALLY DO STUFF
void readSerial(){
  while (Serial.available() > 0) {
    String command = Serial.readStringUntil('\n');
    processCommand(command);
  }

  
}








void setSetpoint(){
  switch(servoMode){
    case 1:{
      setCounts=0;
    }
    case 2:{
      setCounts=int(settings.setpoint*dcmoto_encoder_1_rev);
    }
    break;
    case 99:{
      if (flip){
        setCounts=int(settings.setpoint*dcmoto_encoder_1_rev);
      }
      else{
        setCounts=int(-settings.setpoint*dcmoto_encoder_1_rev);
      } 
    }
    default:{}
    break;
  }
  
}



void setMode(){
  switch(servoMode){
    case 0:{
      motorOn=false;
      servo.stop();
      prevPos=servo.getActualPosition();
       
    }
    break;
    default:{
      motorOn=true;
    }
    break;
  }
}


void loadSettings(){
  EEPROM_readAnything(settingsStart,settings);
  }

void saveSettings(){
  EEPROM_writeAnything(settingsStart,settings);
  }






void processCommand(String command){
  Serial.print("_");
  if (command.startsWith("PID")){
    if(getStringValue(command,';',1).length()){
      settings.PID_Tunings[0] = getStringValue(command,';',1).toFloat();
      settings.PID_Tunings[1] = getStringValue(command,';',2).toFloat();
      settings.PID_Tunings[2] = getStringValue(command,';',3).toFloat();
      servo.myPID->SetTunings(settings.PID_Tunings[0],settings.PID_Tunings[1],settings.PID_Tunings[2]);
      Serial.print("NEW ");
    }    
    Serial.print("PID: P:");
    Serial.print(settings.PID_Tunings[0],3);
    Serial.print("\tI: ");
    Serial.print(settings.PID_Tunings[1],3);
    Serial.print("\tD: ");
    Serial.print(settings.PID_Tunings[2],3);

  }
  else if(command.startsWith("SET")){
    if(getStringValue(command,';',1).length()){
      settings.setpoint= getStringValue(command,';',1).toFloat();
      Serial.print("NEW ");
    }
      Serial.print("SETPOINT: ");
      Serial.print(settings.setpoint,3);
      Serial.print(" revs");
  }
  else if(command.startsWith("MODE")){
    if(getStringValue(command,';',1).length()){
      servoMode = getStringValue(command,';',1).toInt();
      setMode();
      Serial.print("NEW ");
    }
    Serial.print("MODE: ");
    Serial.print(servoMode);
  }  
  else if (command.startsWith("TIME")){
    if(getStringValue(command,';',1).length()){
      settings.looptime = getStringValue(command,';',1).toInt();
      Serial.print("NEW ");
    }    
    Serial.print("Loop Time: ");
    Serial.print(settings.looptime);
  }
  else if(command.startsWith("ZERO")){
    encoder_offset=servo.getActualPosition();
    servo.stop();
    Serial.print("Reset Encoders");
  }
  else if(command.startsWith("LOAD")){
    loadSettings();
    Serial.print("Load Settings");
  }
  else if(command.startsWith("SAVE")){
    saveSettings();
    Serial.print("Save Settings");
  }
  else if(command.startsWith("OFF")){
    outputsOn = false;
    Serial.print("Output: OFF");
  }
  else if(command.startsWith("ON")){ 
    outputsOn = true;
    Serial.print("Output: ON");
  }
  else {
    Serial.print("Unrecognized Command");
    }

  Serial.print("\n");


}



String getStringValue(String data, char separator, int index)
{
  int found = 0;
  int strIndex[] = {0, -1};
  int maxIndex = data.length()-1;

  for(int i=0; i<=maxIndex && found<=index; i++){
    if(data.charAt(i)==separator || i==maxIndex){
        found++;
        strIndex[0] = strIndex[1]+1;
        strIndex[1] = (i == maxIndex) ? i+1 : i;
    }
  }

  return found>index ? data.substring(strIndex[0], strIndex[1]) : "";
}


