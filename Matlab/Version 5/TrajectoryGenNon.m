function [x_traj] = TrajectoryGenNon(x_points)

    x_traj={};
    for i=1:size(x_points,2)
        x_traj{i} = x_points(:,i);
    end
end