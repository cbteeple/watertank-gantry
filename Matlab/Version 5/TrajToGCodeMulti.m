function TrajToGCode(x_traj,x_grip,FR,fileName)
%X,Y,Z are the parametrized trajectories; FR is the feed rate; N is the
%number of discretization steps

%This function takes in the parametrized trajectories and generates a gcode
%translation using a sequence of linear steps

    fileID = fopen(fileName,'w');

    %Translate the trajectory to gcode
    fprintf(fileID,'G1 F%1.1f\n',FR);

    %Generate the gcode by translating the trajectory into a sequence of
    %linear movements
    
    worldParams=getWorldParams();
    gripChan=worldParams.gripChannel;
    
    fprintf(fileID,'M107 P%d\n',gripChan); %release Fingers
    fprintf(fileID,'G4 P1000\n'); %Dwell for 4 sec while releasing
    
    for idx=1:length(x_traj)
        x_traj_i=x_traj{idx};
           
        for i=1:1:size(x_traj_i,2)
            if i == 1 & idx==1
                formatSpec = 'G1 X%1.1f Y%1.0f Z%1.1f\n%';
                fprintf(fileID,formatSpec, x_traj_i(:,i)');
            else
                formatSpec = 'G1 X%1.1f Y%1.0f Z%1.1f\n%';
                fprintf(fileID,formatSpec, x_traj_i(:,i)');      
                
            end             
        end
        
        if x_grip{idx}(1)
            fprintf(fileID,'M106 P%d\n',gripChan); %Actuate Fingers
        else
            fprintf(fileID,'M107 P%d\n',gripChan); %Actuate Fingers
        end
        
        fprintf(fileID,'G4 P%d\n',x_grip{idx}(2)); %Dwell for specified time
        
    end   

    fclose(fileID);
    [~,name,~] = fileparts(fileName);
    disp(name)
    
    
end