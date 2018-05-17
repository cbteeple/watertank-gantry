function TrajectoryPlotter(x_traj,firstcall,linespec)
	%Plot a simulation showing the position of the gantry system
% 	%Note that N is the number of discretization steps and X, Y, Z are the
	%parametrized trajectories
   
	%This function plots a simulation indicating the positioning of the
	%gantry system over time
   
    if nargin<3
       useLinespec=false; 
    else
       useLinespec=true; 
    end
    
    %Combine all segments into 1 trajectory
    x_traj_all=[];
    end_points = [];
    for i=1:length(x_traj)
        N=size(x_traj{i},2);
        x_traj_all(1:3,end+1:end+N) = x_traj{i};
        end_points(i) = size(x_traj_all,2);
    end
    
    
    %Set up the figure
    if firstcall
        clf
    end
    
    if useLinespec
        plot3(x_traj_all(1,:),...
              x_traj_all(2,:),...
              x_traj_all(3,:),linespec{:});
    else
        plot3(x_traj_all(1,:),...
              x_traj_all(2,:),...
              x_traj_all(3,:));
    end
      
    hold on
    
    %Plot Segment Points
    plot3(x_traj_all(1,end),...
        x_traj_all(2,end),...
        x_traj_all(3,end),...
        'ro','MarkerFaceColor','r','MarkerSize',3);
    
    plot3(x_traj_all(1,end_points(1:end-1)),...
        x_traj_all(2,end_points(1:end-1)),...
        x_traj_all(3,end_points(1:end-1)),...
        'bo','MarkerFaceColor','b','MarkerSize',3);
    
    plot3(x_traj_all(1,1),...
        x_traj_all(2,1),...
        x_traj_all(3,1),...
        'go','MarkerFaceColor','g','MarkerSize',3);
    
    if firstcall
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



        %Run Animation   
    %     for i=1:length(x_traj)
    %         point_h.XData=x_traj(1,i);
    %         point_h.YData=x_traj(2,i);
    %         point_h.ZData=x_traj(3,i);
    %         drawnow
    %         pause(0.001)
    %     end
       xlabel('x')
       ylabel('y')
       zlabel('z')
   end
end