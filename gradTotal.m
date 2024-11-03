function [gradTotal] = gradTotal(bots,current)
    gradAttr = gradAttractive(bots,current);
    % gradAttr = [0;0];
    gradRep = gradRepulsive(bots,current);
    % gradRep = [0;0];
    gradBound = boundaryG(bots,current);
    % gradBound = [0;0];
    gradTotal = gradRep + gradBound + gradAttr;
end

