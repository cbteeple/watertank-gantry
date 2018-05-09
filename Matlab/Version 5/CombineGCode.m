function [finished] = CombineGCode(folder_name)
%COMBINEGCODE combines all of the trajectory perturbations into 1 file
%
%INPUTS:
%   folder_name =   the folder where all of the perturbation trajectories
%                   live
%OUTPUTS:
%   finished = indicator that the code has finished sucessfully

finished=0;
d = dir(fullfile(folder_name,'*.gcode*'));

delete(fullfile(folder_name,[folder_name,'_Full.gcode']));
outFid = fopen(fullfile(folder_name,[folder_name,'_Full.gcode']),'a' );
for i=1:length(d)
    %Read in the files one by one
    fid=fopen(fullfile(d(i).folder,'/',d(i).name));
    data=fread(fid);
    fclose(fid);
    
    %Append to the ouptu file
    fwrite(outFid,data);
end

fclose(outFid);

disp('Files Combined')
finished=1;

end

