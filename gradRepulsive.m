function [gradRep] = gradRepulsive(bots,current)
% location of bot
locEval = bots(current).location;
% list of neighbors
neighbors = bots(current).neighbors;
potRep = zeros(1,size(neighbors,2));
for ineighbor = 1:size(neighbors,2)
    % location of current neighbor in question
    neighborLoc = bots(neighbors(ineighbor)).location;
    % distance between bot and neighbor
    dist = distance(locEval,neighborLoc);
    grad = gradDistance(locEval,neighborLoc);
    % repulsive potential of neighbor
    if dist<=10    
        gradRep = -(1./dist-1/10).*(1./dist.^2).*grad;
    else
        gradRep = [0;0];
    end
potRep = sum(potRep);
end
