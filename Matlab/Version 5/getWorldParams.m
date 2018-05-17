function [ params ] = getWorldParams()
%WORLDPARAMS Set up the parameters of the world
%
%OUTPUTS:
%   params - Structure of parameters

params.tankDimX=1100;
params.tankDimY=400;
params.tankDimZ=850;
params.gripChannel=0; %the fan channel you connected your valve to
params.timeHome = 500;
params.timeGrasp = 3000;
params.timeRelease = 4000;





end

