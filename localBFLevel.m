% determines the sum of biofouling in the local region for the robot

function [localBioFoul] = localBFLevel(hull,loc)

xInRange = [];
yInRange = [];

for xpt = 1:100
    for ypt = 1:100
        point = [xpt;ypt];
        if distance(loc,point) <= 5
            xInRange = [xInRange xpt];
            yInRange = [yInRange ypt];
        else
        end
    end
end

localBioFoul = 0;
for ifoul = 1:size(xInRange,2)
    localBioFoul = localBioFoul + hull.F(xInRange(ifoul),yInRange(ifoul));
end
