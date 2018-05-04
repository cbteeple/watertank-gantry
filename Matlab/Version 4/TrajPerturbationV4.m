function TrajPerturbationV4(N_Trials, xF, yF, zF, xH, yH, zH, nSteps, fx_type,PosError,feedRate,file_name)
%Takes in the number of trials N_Trials (if the user chooses n, there will be n^3
%total trials), the final position defined by (xF,yF,zF), the number of
%discretization steps, the power law scaling, the position error, the
%feedrate, and the file name for the exact trajectory; also, note the home
%position is (xH, yH, zH)
    for i=0:1:N_Trials-1 %Discrete steps in the x direction
        for j=0:1:N_Trials-1 %Discrete steps in the y direction
            for k = 0:1:N_Trials-1 %Discrete steps in the z direction
            
                %Run the trajectory along the 3-dimensional array of
                %discretized final positions, given the maximum error
                %defined as PosError
                [xi,yj,zk] = TrajectoryGeneratorV4(xF - PosError + ...
                    i*(2*PosError/(N_Trials-1)),yF-PosError + ...
                    j*(2*PosError/(N_Trials-1)),zF-PosError + ...
                    k*(2*PosError/(N_Trials-1)),xH,yH,zH,nSteps,fx_type);
                plot3(xi,yj,zk) %Plot the perturbed trajectories
                xlabel('x')
                ylabel('y')
                zlabel('z')
                hold on
                plot3(xi(end),yj(end),zk(end),'ro')
                hold on
                errorCubeV4(xF,yF,zF,PosError) %Plot the error cube
                hold on
                
                %Name the file according to the final position xyz of the
                %perturbed trajectory given the maximum error
                i_name = strcat(file_name,'Perturbation',num2str(i),...,
                    num2str(j),num2str(k),'.gcode'); 

                %Translate the perturbed trajectory to gcode
                TrajToGCodeV4(xi,yj,zk,feedRate,nSteps,i_name)
        end
    end
end