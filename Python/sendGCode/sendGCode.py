#!/usr/bin/env python
"""\
Simple g-code streaming script for grbl
"""
import os
import sys

parentDir=os.path.abspath(os.path.dirname(__file__)  + '../..' )
print (parentDir)
gcodeDir=parentDir+'/Trajectories/'
commonFunctionDir = parentDir+'/Trajectories/common_moves/'
go_home = 'go_home.gcode'
pause_traj = 'pause.gcode'
stop_traj = 'stop.gcode'

sys.path.append(gcodeDir)
sys.path.append(commonFunctionDir)

gcodeFile='clarkTest10_00mm/clarkTest10_00mm_Perturbation000.gcode'
deviceLong='/dev/serial/by-id/usb-UltiMachine__ultimachine.com__RAMBo_555333438373513031C0-if00'
deviceShort='/dev/tty/ACM0'


import serial
import time
 
# Open grbl serial port
s = serial.Serial(deviceLong,115200)
 
# Open g-code file
filename=commonFunctionDir+go_home

f = open(commonFunctionDir+go_home,'r');
 
# Wake up grbl
s.write("\r\n\r\n")
time.sleep(2)   # Wait for grbl to initialize
s.flushInput()  # Flush startup text in serial input
 
# Stream g-code to grbl
for line in f:
    l = line.strip() # Strip all EOL characters for streaming
    print ('Sending: ' + l),
    s.write(l + '\n') # Send g-code block to grbl
    grbl_out = s.readline() # Wait for grbl response with carriage return
    print (' : ' + grbl_out.strip())
 
# Wait here until grbl is finished to close serial port and file.
raw_input("  Press <Enter> to exit and disable grbl.")
 
# Close file and serial port
f.close()




filename=gcodeDir+gcodeFile

# Open g-code file
f = open(,'r');
 
# Wake up grbl
s.write("\r\n\r\n")
#time.sleep(2)   # Wait for grbl to initialize
s.flushInput()  # Flush startup text in serial input
 
# Stream g-code to grbl
for line in f:
    l = line.strip() # Strip all EOL characters for streaming
    print 'Sending: ' + l,
    s.write(l + '\n') # Send g-code block to grbl
    grbl_out = s.readline() # Wait for grbl response with carriage return
    print ' : ' + grbl_out.strip()
 
# Wait here until grbl is finished to close serial port and file.
raw_input("  Press <Enter> to exit and disable grbl.")
 
# Close file and serial port
f.close()





s.close()
