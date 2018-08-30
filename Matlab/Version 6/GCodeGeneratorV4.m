clc
clear all;
%close all;
%Start by generating the trajectory with inputs: final position in 3-space,
%the number of discretization steps, and the function type

%The function type is a power law scaling with the parameter
worldParams = getWorldParams();

myDir  = pwd;
idcs   = strfind(myDir,filesep);
topDir = myDir(1:idcs(end-1)-1); 

saveDir=fullfile(topDir,'Trajectories');

file_name = 'Test_NormalFingers6';

%Define the location of the home
locHome  = [500;150;200];
locGrabStart = [12.5;150;200];
locGrabRelease = [300;150;200];%[300;140;150];

t_moves=[0, 2.0, 2.0];
x_points=[locHome, locGrabStart, locGrabRelease];
x_grip = {[worldParams.timeHome, 0, 0, 0],...
          [worldParams.timeGrasp, 1, 0, 0],...
          [worldParams.timeRelease, 0, 0, 0]};

subdiv   = 5;
numSegs   = 30;
fx_power = 1;

functionType = 'none'; %power, subdiv, none

%Feedrate [mm/min]
feedRate = 5000;

%Desired number of perturbation trials per direction
N_Trials = 3; %This will generate an N x N x N lattice

%Error in final position
PosError = 12.5;


%==========================================================================
% Make and save all the files
   
%Generate the appropriate parametrized trajectories

trajSettings.type=functionType;
trajSettings.numSegs=numSegs;
trajSettings.power=fx_power;
trajSettings.subdiv=subdiv;


SaveFile = strcat(file_name,'.gcode');
folder_name = fullfile(saveDir,file_name);
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
    t_moves,file_base)

    
%Combine all of the individual trajectories into a single file
%CombineGCode(folder_name);

%Update the "recent.txt" file
recentID=fopen(fullfile(saveDir,'recent.txt'),'w');
fprintf(recentID,file_name);
fclose(recentID);

