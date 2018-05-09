%Create a function that takes in the final position, the number of
%discretization steps and the function type

%The function type is a power law scaling with the parameter

function [x,y,z] = TrajectoryGenerator(x_final,y_final,z_final,N,power)
%x_,y_,z_final are the final position of the gantry; N is the number of
%discretization steps; power is the power law scaling behavior; the outputs
%x,y,z are the parametrized functions defining the trajectory of the gantry

    t = linspace(0,1,N); %parametrize the trajectory
    x = x_final*t; %define the x parametrization
    y = y_final*t; %define the y parametrization
    z = z_final*(t).^(power); %define the z parametrization
end