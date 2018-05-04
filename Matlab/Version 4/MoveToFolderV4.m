function MoveToFolderV4(N_Trials,file_name,folder_name)
%This function will move the perturbation codes to the appropriate folder

for i = 0:1:N_Trials-1
    for j = 0:1:N_Trials - 1
        for k = 0:1:N_Trials - 1
            fileToMove = strcat(file_name,'Perturbation',num2str(i),...,
                    num2str(j),num2str(k),'.gcode'); 
            movefile(fileToMove,folder_name)
        end
    end
end
                
    