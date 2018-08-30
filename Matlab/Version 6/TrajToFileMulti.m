function TrajToGCode(x_traj,x_grip,t_moves,fileName)
%X,Y,Z are the parametrized trajectories; t_moves is the time vector; N is the
%number of discretization steps

%This function takes in the parametrized trajectories and generates a gcode
%translation using a sequence of linear steps

    fileID = fopen(fileName,'w');

    %Translate the trajectory to gcode
    %fprintf(fileID,'G1 F%1.1f\n',FR);

    %Generate the gcode by translating the trajectory into a sequence of
    %linear movements
    
    worldParams=getWorldParams();
    gripChan=worldParams.gripChannel;
       
    for idx=1:length(x_traj)
        x_traj_i=x_traj{idx};
           
        for i=1:1:size(x_traj_i,2)
            time=t_moves(idx)/size(x_traj_i,2);
            createLine(fileID,x_traj_i,x_grip,time,idx,i,worldParams);
        end
        time=x_grip{idx}(1)/1000;
        createLine(fileID,x_traj_i,x_grip,time,idx,i,worldParams);
       
        
    end   

    fclose(fileID);
    [~,name,~] = fileparts(fileName);
    disp(name)
    
    
end


function createLine(fileID,x_traj_i,x_grip,time,idx,i,worldParams)

    fprintf(fileID,'%1.3f',time);
    formatSpec = '\t%1.3f\t%1.3f\t%1.3f';
    fprintf(fileID,formatSpec, x_traj_i(:,i)');
    
    if idx==1
        FR=worldParams.feedRateFirst;
    else
        FR=0;
    end
    fprintf(fileID,'\t%1.3f',FR);

    for j = 1:(size(x_grip{idx})-1)
        formatSpec = [formatSpec, '\t%1.3'];
    end
    fprintf(fileID,formatSpec, x_grip{idx}(2:end));
    fprintf(fileID,'\n');
end