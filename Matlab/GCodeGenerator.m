clc
clear all;
close all;
%Start by generating the trajectory with inputs: final position in 3-space,
%the number of discretization steps, and the function type

%The function type is a power law scaling with the parameter

%Ask the user for input regarding position and power law behavior
x_finalPrompt = 'What is the final x-position? ';
y_finalPrompt = 'What is the final y-position? ';
z_finalPrompt = 'What is the final z-position? ';
N_prompt = 'How many discretization steps? ';
fxTypePrompt = 'What power law is desired? (Enter a real number) ';

xF = input(x_finalPrompt); 
yF = input(y_finalPrompt);
zF = input(z_finalPrompt);
nSteps = input(N_prompt);
fx_type = input(fxTypePrompt);

%Generate the appropriate parametrized trajectories
[x,y,z] = TrajectoryGenerator(xF,yF,zF,nSteps,fx_type);

%Plot the trajectories
figure(1);
TrajectoryPlotter(x,y,z,nSteps)

%Ask user for feed rate input
feedRatePrompt = 'What is the desired feed rate? ';
feedRate = input(feedRatePrompt);

%Translate the trajectory to gcode
fileNamePrompt = 'What is the desired file name? '; 
file_name = input(fileNamePrompt,'s');
SaveFile = strcat(file_name,'.gcode');
TrajToGCode(x,y,z,feedRate,nSteps,SaveFile)


%Generate perturbations and plot the perturbations

%Ask the user for the desired number of perturbation trials
NTrialsPrompt = 'How many perturbation trial samples are desired? ';
N_Trials = input(NTrialsPrompt);

%Ask the user for the upper bound on the final position
PositionErrorPrompt = 'What is the upper bound on the final position error? ';
PosError = input(PositionErrorPrompt);

%Ask the user for the upper bound on the final power law scaling behavior
PowerErrorPrompt = 'What is the upper bound on the power law scaling error? ';
PowError = input(PowerErrorPrompt);

figure(2);
for i=1:1:N_Trials %Run the loop according to the number of trials selected
    [xPert,yPert,zPert] = ...
        TrajectoryPerturbation(xF,yF,zF,nSteps,fx_type,PosError,PowError);
    plot3(xPert,yPert,zPert) %Plot the perturbed trajectories
    xlabel('x')
    ylabel('y')
    zlabel('z')
    hold on
    plot3(xPert(end),yPert(end),zPert(end),'ro')
    hold on
    errorCube(xF,yF,zF,PosError) %Plot the error cube
    hold on
    
    %Generate the name of the file to save
    %To generate a reasonable file name, add 'Perturbation' to the name of
    %the file containing the gcode defining the trajectory with the exact
    %final endpoint, followed by a number 1,2,...,N_trials. This gcode file
    %will describe the ith perturbation to the original trajectory
    
    i_name = strcat(file_name,'Perturbation',num2str(i),'.gcode'); 

    %Translate the perturbed trajectory to gcode
    TrajToGCode(x,y,z,feedRate,nSteps,i_name)
end












