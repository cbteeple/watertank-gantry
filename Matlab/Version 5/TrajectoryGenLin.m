function [ x_traj ] = TrajectoryGenLin( x_points,subdiv )
%TrajectoryGenLin Transforms a list of points into a trajectory using
%linear interpolation with subdivisions
%
%INPUTS:
%   x_points - a row vector of points (3 x N) 
%   subdiv   - number of subsegments to make each segment into
%
%OUTPUTS:
%   x_traj   - the trajectory
%



x_traj=zeros(size(x_points,1), (size(x_points,2)-1).*subdiv);

for i=1:size(x_points,2)-1
    x_traj(:,i*subdiv+1 -[subdiv:-1:0]) =...
        interp1(x_points(1,i:i+1)',x_points(:,i:i+1)',...
        linspace(x_points(1,i),x_points(1,i+1),subdiv+1)')';



end

