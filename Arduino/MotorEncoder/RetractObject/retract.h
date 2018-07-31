#ifndef retract_h
#define retract_h

#include "Arduino.h"
#include "config.h"
#include <Encoder.h>
#include <EEPROMAnything.h>
#include <PID_v1.h>
#include <DCMotorServo.h>


class motorFuns
{
    public:
      motorFuns(){};
      DCMotorServo * servo;
      void setPID();
      void readPID();
      void savePID();
      void initialize();
      



    private:
};
#endif
