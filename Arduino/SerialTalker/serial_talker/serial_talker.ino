//INCLUDE LIBRARIES


//DECLARE STUFF
unsigned int loopTime = 100;
unsigned long timeCurr=0;
unsigned long timeLast=0;


//SETUP
void setup() {
  Serial.begin(115200);

}



//MAIN LOOP
unsigned int i=0;
bool ON = false;

void loop() {
  timeCurr=millis();
  readSerial();

  if (ON){
  Serial.print(timeCurr);
  Serial.print('\t');
  Serial.print(timeCurr-timeLast);
  Serial.print('\t');
  Serial.print(random(10001));
  Serial.print('\t');
  Serial.print(random(201));
  Serial.print('\t');
  Serial.print(random(11));
  Serial.print('\n');
  delay(loopTime);
  
  i++;
  timeLast=timeCurr;
  }

}


//______________________________________________________________
//PROCESS COMMANDS

void readSerial(){
  while (Serial.available() > 0) {
    String command = Serial.readStringUntil('\n');
    processCommand(command);
  }
}



void processCommand(String command){
  Serial.print("_");
  if (command.startsWith("TIME")){
    if(getStringValue(command,';',1).length()){
      loopTime = getStringValue(command,';',1).toInt();
      Serial.print("NEW ");
    }    
    Serial.print("\tLoop Time: ");
    Serial.print(loopTime);
  }
  
  else if(command.startsWith("ON")){
    Serial.print("ON");
    ON=true;
  }
  
  else if(command.startsWith("OFF")){
    Serial.print("OFF");
    ON=false;
  }
  
  else {
    Serial.print("Unrecognized Command");
  }
  Serial.print("\n");
}




//______________________________________________________________
//HELPERS

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
