clc
clear all;
close all;
%Start by generating the trajectory with inputs: final position in 3-space,
%the number of discretization steps, and the function type

%The function type is a power law scaling with the parameter

file_name = 'clarkTest4';

%Define the location of the home
locHome  = [1000;200;400];
locGrabStart = [200;100;200];
locGrabRelease = [250;100;200];

x_points=[locHome, locGrabStart, locGrabRelease]



subdiv   = 1;
nSteps   = 10;
fx_power = 2;

functionType = 'none';

%Feedrate [mm/min]
feedRate = 9000;

%Desired number of perturbation trials per direction
N_Trials = 3; %This will generate an N x N x N lattice

%Error in final position
PosError = 100;


%==========================================================================
% Make and save all the files
   
%Generate the appropriate parametrized trajectories


switch functionType 
    case 'Power'
        x_traj = TrajectoryGenPow(locGrabStart, locHome, nSteps,fx_power);        
    case 'Subdiv'
        x_traj = TrajectoryGenLin([locHome, locGrabStart],subdiv );       
    otherwise
        x_traj = x_points;      
end

%Plot the trajectories
figure(1);
TrajectoryPlotter(x_traj);

%Translate the trajectory to gcode

SaveFile = strcat(file_name,'.gcode');
folder_name = file_name;
mkdir(folder_name) %make a new folder

TrajToGCode(x_traj,feedRate,[folder_name,'/',SaveFile])


    %Make perturbations using an organized 3-dimensional array around the
    %final point.
    
    TrajPerturbation(N_Trials, locGrabStart, locHome, nSteps, fx_power,PosError,...
        feedRate,[folder_name,'/',file_name])

    
%Combine all of the individual trajectories into a single file
CombineGCode(folder_name);

