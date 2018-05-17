%Create a function that takes in the final position, the number of
%discretization steps and the function type

%The function type is a power law scaling with the parameter

function [x_traj] = TrajectoryGenPow(x_points, settings)
%x_,y_,z_final are the final position of the gantry; x_,y_,z_home are the
%home coordinates; N is the number of discretization steps; power is the 
%power law scaling behavior; the outputs x,y,z are the parametrized 
%functions defining the trajectory of the gantry

%Unpack
numSegs = settings.numSegs;
power   = settings.power;

if numSegs<1
error('HEY: The number of segments must be at least 1');
elseif numSegs==1
warning('HEY: If you just want line segments, use the "TrajectoryGenLin"');
end

x_traj={};
for  i =1:size(x_points,2)-1
    
    x_home=x_points(:,i);
    x_final=x_points(:,i+1);


    t = linspace(0,1,numSegs+1); %parametrize the trajectory
    x_traj_i=zeros(3,numSegs+1);
    x_traj_i(1,1:numSegs+1) = (x_final(1)-x_home(1)).*t + x_home(1); %define the x parametrization
    x_traj_i(2,1:numSegs+1) = (x_final(2)-x_home(2)).*t + x_home(2); %define the y parametrization
    x_traj_i(3,1:numSegs+1) = (x_final(3)-x_home(3)).*(t).^(power) + x_home(3); %define the z parametrization
    
    x_traj{i}=x_traj_i;
end
end