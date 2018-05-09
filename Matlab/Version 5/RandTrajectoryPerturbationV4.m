function [x,y,z] = RandTrajectoryPerturbationV4(x_final,y_final,z_final,x_home,y_home,z_home,N,power,epsilonFinalPosition,epsilonPower)
    %The x_,y_,z_final are the final position of the gantry; N is the
    %number of discretization steps; power is the power law scaling
    %behavior of the parametrization; epsilonFinalPosition is the maximal
    %error in position; epsilonPower is the maximal error in the power law
    %scaling; the home position is described by x_,y_,z_home
    
    %The x,y,z outputs define the parametrized perturbed trajectories

    %Choose a random number between 0 and 1 that will be used to determine
    %the final position of the gantry within some maximal spatial cube
    %centered about the exact final position
    randX = rand;
    randY = rand;
    randZ = rand;
    randEps = rand;

    PosPerturbationX = epsilonFinalPosition*randX;
    PosPerturbationY = epsilonFinalPosition*randY;
    PosPerturbationZ = epsilonFinalPosition*randZ;
    PowPerturbation = epsilonPower*randEps;
    
    nX = round(randX);
    nY = round(randY);
    nZ = round(randZ);
    
    nEps = round(randEps);
    
    %Define the final positions of the perturbed trajectory
    xFinal = x_final + ((-1).^nX) * PosPerturbationX;
    yFinal = y_final + ((-1).^nY) * PosPerturbationY;
    zFinal = z_final + ((-1).^nZ) * PosPerturbationZ;
    
    Pow = power + ((-1).^nEps) * PowPerturbation;
    
    t = linspace(0,1,N); %parametrize the trajectory
    x = (xFinal-x_home)*t + x_home; %define the x parametrization
    y = (yFinal-y_home)*t + y_home; %define the y parametrization
    z = (zFinal-z_home)*t.^(Pow) + z_home; %define the z parametrization
    
end