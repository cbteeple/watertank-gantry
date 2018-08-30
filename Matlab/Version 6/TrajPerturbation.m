function TrajPerturbation(x_points, x_grip, settings, N_Trials, PosError,...
                          t_moves, file_name)
%Takes in the number of trials N_Trials (if the user chooses n, there will be n^3
%total trials), the final position defined by (xF,yF,zF), the number of
%discretization steps, the power law scaling, the position error, the
%feedrate, and the file name for the exact trajectory; also, note the home
%position is (xH, yH, zH)

    %Unpack
    
    
    
    xF = x_points(1,2);
    yF = x_points(2,2);
    zF = x_points(3,2);
    
    xH = x_points(1,1);
    yH = x_points(2,1);
    zH = x_points(3,1);
    
    nSteps  = settings.numSegs;
    fx_type = settings.power;
    
    
    switch lower(settings.type) 
    case 'power'
        trajGenFun = ...
            @(x_points) TrajectoryGenPow(x_points, settings);        
    case 'subdiv'
        trajGenFun = ...
            @(x_points) TrajectoryGenLin(x_points, settings);       
    otherwise
        trajGenFun = ...
            @(x_points) TrajectoryGenNon(x_points);      
    end
    
    
    
    %Start the plot
    figure(2);

    firstcall=1;
    TrajectoryPlotter(trajGenFun(x_points),firstcall,...
    {'Color','k',...
     'LineStyle','-',...
     'LineWidth',2});
    firstcall=0;
    
    
    %Make all the trajectories
    for i=0:1:N_Trials-1 %Discrete steps in the x direction
        for j=0:1:N_Trials-1 %Discrete steps in the y direction
            for k = 0:1:N_Trials-1 %Discrete steps in the z direction
            
                %Run the trajectory along the 3-dimensional array of
                %discretized final positions, given the maximum error
                %defined as PosError
                      
                
                x_in = x_points - PosError +...
                        [i*(2*PosError/(N_Trials-1))
                         j*(2*PosError/(N_Trials-1))
                         k*(2*PosError/(N_Trials-1))];               
                
                %Create traj for each segment
                x_traj_i = trajGenFun(x_in);
                              
                
                %Plot
%                 for id=1:size(x_traj_i,2)
%                     plot3(x_traj_i{id}(1,:),x_traj_i{id}(2,:),...
%                         x_traj_i{id}(3,:)); %Plot the perturbed trajectories
%                     hold on
%                     plot3(x_traj_i{id}(1,end),x_traj_i{id}(2,end),...
%                         x_traj_i{id}(3,end),'ro');
%                 end
                if nnz([i,j,k] ==N_Trials-1 | [i,j,k] ==0)==3
                    TrajectoryPlotter(x_traj_i,firstcall,...
                        {'Color',[0.5,0.5,0.5],...
                         'LineStyle',':',...
                         'LineWidth',1});
                    firstcall=0;
                end
                
                plot3(x_traj_i{1}(1,1),...
                x_traj_i{1}(2,1),...
                x_traj_i{1}(3,1),...
                'ko','MarkerFaceColor','k','MarkerSize',3);
                
                %Name the file according to the final position xyz of the
                %perturbed trajectory given the maximum error
                i_name = strcat(file_name,'_Perturbation',num2str(i),...,
                    num2str(j),num2str(k),'.gcode'); 

                %Translate the perturbed trajectory to gcode
                TrajToFileMulti(x_traj_i,x_grip,t_moves,i_name);
            end
        end
    end

    %Plot the cube only once at the end
    %errorCube([xF,yF,zF],PosError) %Plot the error cube
    for idx=1:size(x_points,2)
        cubeColor=[0,0,1];
        if idx==1
            cubeColor = [0,1,0];
        elseif idx == size(x_points,2)
            cubeColor = [1,0,0];
        end
            
        plotcube(2*PosError*ones(1,3),...
                 x_points(:,idx)'-PosError.*ones(1,3),...
                 .2,...
                 cubeColor);
             
    end
    
    
    %Make the plot window look nice
    axis equal
    axis vis3d
    rotate3d on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    
    ax=gca;
    worldParams = getWorldParams();
    ax.XLim=[0, worldParams.tankDimX];
    ax.YLim=[0, worldParams.tankDimY];
    ax.ZLim=[0, worldParams.tankDimZ];

    drawnow

end