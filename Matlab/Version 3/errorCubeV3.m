function errorCubeV3(x_final,y_final,z_final,epsilonFinalPosition)
%The purpose of this function is to generate a cube that illustrates the
%permitted error window centered about the final point

%x_,y_,z_final describe the final spatial postion, epsilonFinalPosition is
%the upper bound on the error

%Define the 12 lines that describe the cube centered about the final
%position with side length equal to 2 times the error (since it runs from
%(x_i-error) to (x_i+error) 
    xMinus = x_final - epsilonFinalPosition;
    xPlus = x_final + epsilonFinalPosition;
    yMinus = y_final - epsilonFinalPosition;
    yPlus = y_final + epsilonFinalPosition;
    zMinus = z_final - epsilonFinalPosition;
    zPlus = z_final + epsilonFinalPosition;
    
    xLine(1,:) = [xMinus,xPlus];
    yLine(1,:) = [yMinus,yMinus];
    zLine(1,:) = [zMinus,zMinus];
    
    xLine(2,:) = [xPlus,xPlus];
    yLine(2,:) = [yMinus,yPlus];
    zLine(2,:) = [zMinus,zMinus];
    
    xLine(3,:) = [xMinus,xPlus];
    yLine(3,:) = [yPlus,yPlus];
    zLine(3,:) = [zMinus,zMinus];
    
    xLine(4,:) = [xMinus,xMinus];
    yLine(4,:) = [yMinus,yPlus];
    zLine(4,:) = [zMinus,zMinus];
    
    xLine(5,:) = [xMinus,xMinus];
    yLine(5,:) = [yMinus,yMinus];
    zLine(5,:) = [zMinus, zPlus];
    
    xLine(6,:) = [xPlus,xPlus];
    yLine(6,:) = [yMinus,yMinus];
    zLine(6,:) = [zMinus, zPlus];
    
    xLine(7,:) = [xPlus,xPlus];
    yLine(7,:) = [yPlus,yPlus];
    zLine(7,:) = [zMinus, zPlus];
    
    xLine(8,:) = [xMinus,xMinus];
    yLine(8,:) = [yPlus,yPlus];
    zLine(8,:) = [zMinus, zPlus];
    
    xLine(9,:) = [xMinus,xPlus];
    yLine(9,:) = [yMinus,yMinus];
    zLine(9,:) = [zPlus,zPlus];
    
    xLine(10,:) = [xPlus,xPlus];
    yLine(10,:) = [yMinus,yPlus];
    zLine(10,:) = [zPlus,zPlus];
    
    xLine(11,:) = [xMinus,xPlus];
    yLine(11,:) = [yPlus,yPlus];
    zLine(11,:) = [zPlus,zPlus];
    
    xLine(12,:) = [xMinus,xMinus];
    yLine(12,:) = [yMinus,yPlus];
    zLine(12,:) = [zPlus,zPlus];
    
    %Plot the cube
    for i = 1:12
       
        plot3(xLine(i,:),yLine(i,:),zLine(i,:),'b','LineWidth',1)
        hold on
    
end
    