%Create a function that takes in the final position, the number of
%discretization steps and the function type

%The function type is a power law scaling with the parameter

function [x_traj] = TrajectoryGenPow(x_final, x_home, numSegs,power)
%x_,y_,z_final are the final position of the gantry; x_,y_,z_home are the
%home coordinates; N is the number of discretization steps; power is the 
%power law scaling behavior; the outputs x,y,z are the parametrized 
%functions defining the trajectory of the gantry

if numSegs<1
error('HEY: The number of segments must be at least 1');
elseif numSegs==1
warning('HEY: If you just want line segments, use the "TrajectoryGenLin"');
end

    t = linspace(0,1,numSegs+1); %parametrize the trajectory
    x_traj=zeros(3,numSegs+1);
    x_traj(1,1:numSegs+1) = (x_final(1)-x_home(1)).*t + x_home(1); %define the x parametrization
    x_traj(2,1:numSegs+1) = (x_final(2)-x_home(2)).*t + x_home(2); %define the y parametrization
    x_traj(3,1:numSegs+1) = (x_final(3)-x_home(3)).*(t).^(power) + x_home(3); %define the z parametrization
end