clc
clear all;
%close all;
%Start by generating the trajectory with inputs: final position in 3-space,
%the number of discretization steps, and the function type

%The function type is a power law scaling with the parameter
worldParams = getWorldParams();

file_name = 'clarkTest9';

%Define the location of the home
locHome  = [800;200;200];
locGrabStart = [200;200;350];
locGrabRelease = [400;200;400];


x_points=[locHome, locGrabStart, locGrabRelease];
x_grip = {[0,worldParams.timeHome],...
          [1,worldParams.timeGrasp],...
          [0,worldParams.timeRelease]};

subdiv   = 3;
numSegs   = 50;
fx_power = 1/2;

functionType = 'none'; %power, subdiv, none

%Feedrate [mm/min]
feedRate = 10000;

%Desired number of perturbation trials per direction
N_Trials = 2; %This will generate an N x N x N lattice

%Error in final position
PosError = 25;


%==========================================================================
% Make and save all the files
   
%Generate the appropriate parametrized trajectories

trajSettings.type=functionType;
trajSettings.numSegs=numSegs;
trajSettings.power=fx_power;
trajSettings.subdiv=subdiv;


SaveFile = strcat(file_name,'.gcode');
folder_name = file_name;
if exist(folder_name,'dir')
    rmdir(folder_name,'s');
end
mkdir(folder_name) %make a new folder
file_base=[folder_name,'/',file_name];


%Plot the trajectories
%figure(1);
%TrajectoryPlotter(x_traj);

%Translate the trajectory to gcode

%TrajToGCode(x_traj,feedRate,[folder_name,'/',SaveFile])


%Make perturbations using an organized 3-dimensional array around the
%final point.
file_base=[folder_name,'/',file_name];

TrajPerturbation(x_points, x_grip, trajSettings, N_Trials, PosError,...
    feedRate,file_base)

    
%Combine all of the individual trajectories into a single file
CombineGCode(folder_name);

