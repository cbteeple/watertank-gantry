#!/usr/bin/env python

import yaml
import numpy as np
import scipy as sp
import scipy.interpolate
import sys
import os
import itertools



def calculateSegment(start_point,end_point,t_step):

    # Calculate the linear interpolation time vector
    t_intermediate = np.arange(start_point[0],end_point[0],t_step)
    print(t_step)
    print(t_intermediate)
    
    # Turn the incomming setpoints into arrays
    time_vec = np.asarray([end_point[0], start_point[0]])
    state_vec = np.transpose(np.asarray([end_point[1:], start_point[1:]]))
    
    # Create an interpolation function and use it
    fun = sp.interpolate.interp1d(time_vec,state_vec,fill_value="extrapolate")
    seg = np.transpose(fun(t_intermediate))
    
    # put the time back at the beginning of the array
    seg  = np.insert(seg,0,t_intermediate, axis=1)
    
    return seg



class trajectorySweep:
    def __init__(self, settings_file, settings_folder, traj_folder):
        self.directions_to_check=['x-dir', 'y-dir', 'z-dir']
        self.settings_file = settings_file
        self.settings_folder = settings_folder
        self.traj_folder = traj_folder
        self.__getSettings()
        self.setupFolder()


    def __getSettings(self):
        inFile=os.path.join(self.settings_folder,self.settings_file+".yaml")
        with open(inFile) as f:
            # use safe_load instead of load
            traj_settings = yaml.safe_load(f)
            f.close()

        # Get data from the file
        self.stage_settings = traj_settings.get("stage")
        self.grasp_settings = traj_settings.get("grasp")


    def getPerturbations(self):
        directions = self.stage_settings.get("sweep")

        self.perturbations=[]
        for curr_dir in self.directions_to_check:
            curr_set = directions.get(curr_dir)

            sweep_range=curr_set['lims'][1] - curr_set['lims'][0]
            numSegs= int(sweep_range / (curr_set['step']))


            self.perturbations.append(np.linspace(float(curr_set['lims'][0]), \
                float(curr_set['lims'][1]), \
                numSegs+1).tolist())


        print(self.perturbations)


    def runPerturb(self):
        self.getPerturbations()

        home_pos  = self.stage_settings["home_position"]
        base_traj = self.stage_settings["traj"]
        self.base_speed = self.stage_settings["base_speed"]

        idx=0
        for curr_perturb in itertools.product(*self.perturbations):
            curr_traj = self.perturbTraj(home_pos,base_traj,curr_perturb)
            self.saveTraj(curr_traj, "%d"%(idx))
            idx += 1


    def perturbTraj(self,home_pos,base_traj,curr_perturb):
        new_traj = []
        last_time=0
        for line in base_traj:
            new_line = []
            time_step = line[0]-last_time
            new_line.append(time_step)

            for idx in range(len(line)-2):
                new_line.append(home_pos[idx]+line[idx+1]+curr_perturb[idx])
            new_traj.append(new_line)

            if time_step == 0.0:
                new_line.append(self.base_speed)
            else:
                new_line.append(0)

            last_time = line[0]

            # Add the grasping pressure
            new_line.extend(self.getGrasp(line[-1]))

        return new_traj



    def getGrasp(self,grasp_on):

        if grasp_on:
            traj = self.grasp_settings["grasp_traj"]
        else:
            traj = self.grasp_settings["release_traj"]

        if self.grasp_settings["use_smooth_traj"]:
            grasp_out = 1
        else:
            grasp_out = traj[-1][1:]

        return grasp_out
            


            
    def saveTraj(self,traj, trajname):
        # Save the trajectory
        outFile=os.path.join(self.traj_folder,self.settings_file,self.settings_file+'_'+trajname+".gcode")
        np.savetxt(outFile, traj, delimiter='\t', fmt='%0.4f') 


    def setupFolder(self):
        folder = os.path.join(self.traj_folder,self.settings_file)

        if not os.path.exists(folder):
            os.makedirs(folder)
        
        for the_file in os.listdir(folder):
            file_path = os.path.join(folder, the_file)
            try:
                if os.path.isfile(file_path):
                    os.unlink(file_path)
                #elif os.path.isdir(file_path): shutil.rmtree(file_path)
            except Exception as e:
                print(e)



if __name__ == '__main__':
    print(os.path.dirname( __file__ ))
    traj_folder = os.path.abspath(os.path.join(os.path.dirname( __file__ ), "../",'Trajectories'))
    print(traj_folder)
    settings_folder = "traj_settings"
    if len(sys.argv)==2:
        sweep=trajectorySweep(sys.argv[1],settings_folder,traj_folder)
        sweep.runPerturb()
    else:
        print('make sure you give a filename')
        
        
        
        
        
        