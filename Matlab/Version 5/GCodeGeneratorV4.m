clc
clear all;
close all;
%Start by generating the trajectory with inputs: final position in 3-space,
%the number of discretization steps, and the function type

%The function type is a power law scaling with the parameter

file_name = 'clarkTest4';

%Define the location of the home
locHome  = [1000;200;400];
locFinal = [200,100,200];

nSteps = 100;
fx_power = 1/2;

%Feedrate [mm/min]
feedRate = 9000;

%Desired number of perturbation trials per direction
N_Trials = 3; %This will generate an N x N x N lattice

%Error in final position
PosError = 100;
perturbType = 'organized';


%==========================================================================
% Make and save all the files

xH = locHome(1);
yH = locHome(2);
zH = locHome(3);

xF = locFinal(1);
yF = locFinal(2);
zF = locFinal(3);

    
%Generate the appropriate parametrized trajectories
[x,y,z] = TrajectoryGenerator(xF,yF,zF, xH, yH, zH, nSteps,fx_power);

%Plot the trajectories
%figure(1);
%TrajectoryPlotter(x,y,z,nSteps)

%Translate the trajectory to gcode

SaveFile = strcat(file_name,'.gcode');
folder_name = file_name;
mkdir(folder_name) %make a new folder


TrajToGCode(x,y,z,feedRate,nSteps,[folder_name,'/',SaveFile])


switch perturbType
    
    case 'random'
    
    otherwise 

    %Make perturbations using an organized 3-dimensional array around the
    %final point.
    
    TrajPerturbation(N_Trials, xF, yF, zF,xH,yH,zH, nSteps, fx_power,PosError,...
        feedRate,[folder_name,'/',file_name])
end

%Combine all of the individual trajectories into a single file
CombineGCode(folder_name);

