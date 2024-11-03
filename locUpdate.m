function [bots] = locUpdate(bots)
    for ibot = 1:25
        botLoc = bots(ibot).location;
        grad = bots(ibot).gradient;
        epsilon = .01;
        newLoc = botLoc - epsilon * grad;
        bots(ibot).location = newLoc;
    end
loc = [bots.location];
scatter(loc(1,:),loc(2,:),'.','r');