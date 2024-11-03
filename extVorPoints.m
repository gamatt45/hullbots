function [extX,extY] = extVorPoints(vorX,vorY)
[arbX,arbY] = voronoi(vorX,vorY);
extX = [0;0];
extY = [0;0];
tail = size(arbX,2);
for ipoint = 1:tail
    if arbY(2,ipoint)>100 
        extX = [extX(1,:) arbX(1,ipoint);extX(2,:) arbX(2,ipoint)];
        extY = [extY(1,:) arbY(1,ipoint); extY(2,:) arbY(2,ipoint)];
    elseif arbY(2,ipoint)<1
        extX = [extX(1,:) arbX(1,ipoint);extX(2,:) arbX(2,ipoint)];
        extY = [extY(1,:) arbY(1,ipoint); extY(2,:) arbY(2,ipoint)];
    elseif arbX(2,ipoint)>100 
        extX = [extX(1,:) arbX(1,ipoint);extX(2,:) arbX(2,ipoint)];
        extY = [extY(1,:) arbY(1,ipoint); extY(2,:) arbY(2,ipoint)];
    elseif arbX(2,ipoint)<1 
        extX = [extX(1,:) arbX(1,ipoint);extX(2,:) arbX(2,ipoint)];
        extY = [extY(1,:) arbY(1,ipoint); extY(2,:) arbY(2,ipoint)];
    end
end
extY(:,1) = [];
extX(:,1) = [];