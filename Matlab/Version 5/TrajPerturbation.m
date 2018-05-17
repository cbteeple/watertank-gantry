function TrajPerturbation(N_Trials, x_final, x_home, nSteps, fx_type,PosError,feedRate,file_name)
%Takes in the number of trials N_Trials (if the user chooses n, there will be n^3
%total trials), the final position defined by (xF,yF,zF), the number of
%discretization steps, the power law scaling, the position error, the
%feedrate, and the file name for the exact trajectory; also, note the home
%position is (xH, yH, zH)

    %Unpack
    xF = x_final(1);
    yF = x_final(2);
    zF = x_final(3);
    
    xH = x_home(1);
    yH = x_home(2);
    zH = x_home(3);
    
    
    %Start the plot
    figure(2);

    %Make all the trajectories
    for i=0:1:N_Trials-1 %Discrete steps in the x direction
        for j=0:1:N_Trials-1 %Discrete steps in the y direction
            for k = 0:1:N_Trials-1 %Discrete steps in the z direction
            
                %Run the trajectory along the 3-dimensional array of
                %discretized final positions, given the maximum error
                %defined as PosError
                x_traj_i = TrajectoryGenPow([...
                    xF - PosError + i*(2*PosError/(N_Trials-1)),...
                    yF-PosError + j*(2*PosError/(N_Trials-1)),...
                    zF-PosError + k*(2*PosError/(N_Trials-1))],...
                    [xH,yH,zH],nSteps,fx_type);
                plot3(x_traj_i(1,:),x_traj_i(2,:),x_traj_i(3,:)) %Plot the perturbed trajectories
                hold on
                plot3(x_traj_i(1,end),x_traj_i(2,end),x_traj_i(3,end),'ro')
                
                %Name the file according to the final position xyz of the
                %perturbed trajectory given the maximum error
                i_name = strcat(file_name,'_Perturbation',num2str(i),...,
                    num2str(j),num2str(k),'.gcode'); 

                %Translate the perturbed trajectory to gcode
                TrajToGCode(x_traj_i,feedRate,i_name);
            end
        end
    end

    %Plot the cube only once at the end
    errorCube([xF,yF,zF],PosError) %Plot the error cube
    
    %Make the plot window look nice
    axis equal
    axis vis3d
    rotate3d on
    xlabel('x')
    ylabel('y')
    zlabel('z')
end