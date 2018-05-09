clc
clear all;
close all;
%Start by generating the trajectory with inputs: final position in 3-space,
%the number of discretization steps, and the function type

%The function type is a power law scaling with the parameter

%Define the location of the home
locHome  = [1000;200;400];
locFinal = [200,200,400];

nSteps = 100;
fx_power = 1;

%Feedrate [mm/min]
feedRate = 9000;

%Desired number of perturbation trials per direction
N_Trials = 3; %This will generate an N x N x N lattice

%Error in final position
PosError = 100;

file_name = 'clarkTest2';



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


%Generate perturbations and plot the perturbations

%Use this code if you are interested in an organized 3-dimensional array of
%perturbed trajectories. If you are interested in a set of random
%perturbations contained within the defined erro cube, comment out this
%code and proceed to the random trajectory generator
figure(2);
TrajPerturbation(N_Trials, xF, yF, zF,xH,yH,zH, nSteps, fx_power,PosError,...
    feedRate,[folder_name,'/',file_name])

%Make the graph work correctly
axis equal
axis vis3d
rotate3d on
