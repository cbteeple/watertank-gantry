# MotorRetract
This code enables a motor with encoder to follow a setpoint with PID values given over serial

## Dependencies
 - [EEPROMAnything Library](https://github.com/collin80/EEPROMAnything) by collin80
 
## Commands
*All commands must be sent with a newline character at the en, and are processed immediately*

### Get Settings:
*Settings can be retreived by not ending the command with a semicolon*
- **PID**: get the PID values for the motor
- **SET**: get the setpoint for the motor (in revs)
- **MODE**: get the mode
- **TIME**: get the loop time for sending encoder positions (in ms)

### Set Settings:
*Paramters are separated by semicolons.*
- **PID; [P_val]; [I_val]; [D_val]**: set the PID values for the motor
- **SET; [setpoint]**: set the setpoint for the motor (in revs)
- **TIME; [loop_time]**: set the loop time for sending encoder positions (in ms)
- **MODE; [mode]**: set the mode
	- **0: Motor Off** - The motor is idle
	- **1: Set to 0** - Sepoint is set to 0, servo drives to that position
	- **2: Normal Operation** - Sepoint follows the setting, servo drives to that position

### Do Stuff:
- **ON**: Start sending data (encoder setpoint and position)
- **OFF**: Stop sending data
- **LOAD**: Load settings from onboard memory
- **SAVE**: Save settings to onboard memory
- **ZERO**: Zero the encoder count

### Responses:
All commands return a serial string with what they did.
- This string begins with and underscore "_"
-  and ends with a newline '\n'

## Outputs
The code sends lines of data separated by '\t' in the following order:

- **[time since last MCU reset *(ms)*]**
- **[sample rate *(ms)*]**
- **[setpoint *(encoder counts)*]**
- **[current position *(encoder counts)*]**
