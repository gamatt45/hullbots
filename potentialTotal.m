function [potTotal] = potentialTotal(bots,current)
    UA = potAttractive(bots, current);
    % UA = 0;
    UR = potRepulsive(bots, current);
    % UR = 0;
    UB = boundaryU(bots, current);
    % UB = 0;
    potTotal = UA + UR + UB;
end
