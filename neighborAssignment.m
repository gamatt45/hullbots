% Assigns neighbors for the multi-weighted system

function bots = neighborAssignment(bots)

% determines neighbor for every bot
for ibot = 1:25
    neighbors = [];
    center = bots(ibot).location;
    % checks if bot is within area of influence
    for nbot = 1:25
        point = bots(nbot).location;
        dist = distance(center,point) ;
        if bots(nbot).id ~= bots(ibot).id && dist < 21
            neighbors = [neighbors bots(nbot).id];
        else
            neighbors = neighbors;
        end
    end
    bots(ibot).neighbors = neighbors;
end

corners = [1 1 100 100; 1 100 1 100];
cornerBots = [1 5 21 25];
for cbot = 1:4
    bots(cornerBots(cbot)).corner = corners(:,cbot);
end
