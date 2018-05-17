function TrajectoryPlotter(x_traj)
	%Plot a simulation showing the position of the gantry system
% 	%Note that N is the number of discretization steps and X, Y, Z are the
	%parametrized trajectories
   
	%This function plots a simulation indicating the positioning of the
	%gantry system over time
   
    %Set up the figure
    figure(1)
        clf
        plot3(x_traj(1,:),x_traj(2,:),x_traj(3,:),'b');
        hold on
        point_h = plot3(x_traj(1,1),x_traj(2,1),x_traj(3,1),'ro');
    
        %Make the plot window look nice       
        axis equal
        axis vis3d
        rotate3d on
        xlabel('x')
        ylabel('y')
        zlabel('z')
        
        ax=gca;
        params = worldParams();
        ax.XLim=[0, params.tankDimX];
        ax.YLim=[0, params.tankDimY];
        ax.ZLim=[0, params.tankDimZ];
        
        
        drawnow
    
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