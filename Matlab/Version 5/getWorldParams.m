function [ params ] = getWorldParams()
%WORLDPARAMS Set up the parameters of the world
%
%OUTPUTS:
%   params - Structure of parameters

params.tankDimX=900;
params.tankDimY=350;
params.tankDimZ=550;
params.gripChannel=0; %the fan channel you connected your valve to
params.timeHome = 550;
params.timeGrasp = 3000;
params.timeRelease = 4000;





end

