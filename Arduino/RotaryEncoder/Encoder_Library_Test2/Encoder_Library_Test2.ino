/* Encoder Library - Basic Example
 * http://www.pjrc.com/teensy/td_libs_Encoder.html
 *
 * This example code is in the public domain.
 */

#include <Encoder.h>

// Change these two numbers to the pins connected to your encoder.
//   Best Performance: both pins have interrupt capability
//   Good Performance: only the first pin has interrupt capability
//   Low Performance:  neither pin has interrupt capability
Encoder myEnc(2, 3);
//   avoid using pins with LEDs attached


int COUNTS_PER_REV = 600;
float DEGREES_PER_COUNT = 360.0/(float(COUNTS_PER_REV)*4);
float REVS_PER_COUNT=1.0/(float(COUNTS_PER_REV)*4);
float FLIP_ANGLE_DIRECTION = -1;

void setup() {
  Serial.begin(115200);
  Serial.println("Basic Encoder Test:");
}

long oldPosition  = -999;

void loop() {
  long newPosition = myEnc.read();
  //Serial.print(int(newPosition*REVS_PER_COUNT*FLIP_ANGLE_DIRECTION));
  //Serial.print('\t');
  Serial.println(float(newPosition)*DEGREES_PER_COUNT*FLIP_ANGLE_DIRECTION);
  delay(50);
}
