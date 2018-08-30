function TrajToGCode(x_traj,FR,fileName)
%X,Y,Z are the parametrized trajectories; FR is the feed rate; N is the
%number of discretization steps

%This function takes in the parametrized trajectories and generates a gcode
%translation using a sequence of linear steps

    fileID = fopen(fileName,'w');

    %Translate the trajectory to gcode
    fprintf(fileID,'G1 F%1.1f\n',FR);

    %Generate the gcode by translating the trajectory into a sequence of
    %linear movements
    for i=1:1:size(x_traj,2)
        if i == 1
            formatSpec = 'G1 X%1.1f Y%1.0f Z%1.1f\n%';
            fprintf(fileID,formatSpec, x_traj(:,i)');
            fprintf(fileID,'G4 P1000\n'); %Dwell for 1 sec at "home"
        else
            formatSpec = 'G1 X%1.1f Y%1.0f Z%1.1f\n%';
            fprintf(fileID,formatSpec, x_traj(:,i)');
        end
    end

    fclose(fileID);
    [~,name,~] = fileparts(fileName);
    disp(name)
    
end