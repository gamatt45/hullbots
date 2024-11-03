function [potRep] = potRepulsive(bots,current)
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
    % repulsive potential of neighbor if within 10
    if dist <= 10
        potRep(ineighbor) = (1/dist-1/10)^2/2;
    else
        potRep(ineighbor) = 0;
    end
end
potRep = sum(potRep);