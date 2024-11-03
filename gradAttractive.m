function [gradAttr] = gradAttractive(bots,current)
% location of bot
locEval = bots(current).location;
% list of neighbors
neighbors = bots(current).neighbors;
gradAttr = zeros(2,size(neighbors,2));
for ineighbor = 1:size(neighbors,2)
    % location of current neighbor in question
    neighborLoc = bots(neighbors(ineighbor)).location;
    nuHealth = bots(neighbors(ineighbor)).health;
    nuBio = bots(neighbors(ineighbor)).localFouling/50;
    % distance between bot and neighbor
    dist = distance(locEval,neighborLoc);
    gradAttr(:,ineighbor) = ((locEval-neighborLoc)/dist)*(nuBio/nuHealth);
end
gradAttr = [sum(gradAttr(1,:));sum(gradAttr(2,:))];
