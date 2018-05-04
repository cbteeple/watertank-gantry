function TrajectoryPlotterV4(X,Y,Z,N)
   %Plot a simulation showing the position of the gantry system
   %Note that N is the number of discretization steps and X, Y, Z are the
   %parametrized trajectories
   
   %This function plots a simulation indicating the positioning of the
   %gantry system over time
    for i=1:1:N-1
        plot3(X,Y,Z,'b')
        hold on
        plot3(X(i),Y(i),Z(i),'ro')
        hold off
        pause(0.001);
   end
   xlabel('x')
   ylabel('y')
   zlabel('z')
end