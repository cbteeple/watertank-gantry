%Create a function that takes in the final position, the number of
%discretization steps and the function type

%The function type is a power law scaling with the parameter

function [x,y,z] = TrajectoryGeneratorV3(x_final,y_final,z_final,x_home,y_home,z_home, N,power)
%x_,y_,z_final are the final position of the gantry; x_,y_,z_home are the
%home coordinates; N is the number of discretization steps; power is the 
%power law scaling behavior; the outputs x,y,z are the parametrized 
%functions defining the trajectory of the gantry

    t = linspace(0,1,N); %parametrize the trajectory
    x = (x_final-x_home)*t + x_home; %define the x parametrization
    y = (y_final-y_home)*t + y_home; %define the y parametrization
    z = (z_final-z_home)*(t).^(power) + z_home; %define the z parametrization
end