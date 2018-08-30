function [ params ] = getWorldParams()
%WORLDPARAMS Set up the parameters of the world
%
%OUTPUTS:
%   params - Structure of parameters

params.tankDimX=900;
params.tankDimY=350;
params.tankDimZ=300;
params.gripChannel=0; %the fan channel you connected your valve to
params.timeHome = 550; %[ms]
params.timeGrasp = 3000; %[ms]
params.timeRelease = 4000; %[ms]
params.feedRateFirst=5000; %[mm/min]




end

