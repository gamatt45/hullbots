function [boundU] = boundaryU(bots,current)
% potentials
% repulsive based on proximity to bounds (attractive for corner bots)
potEdge = zeros(1,4);
potCorner = 0;
edge = [1 100];
botLoc = bots(current).location;

% repulsive prox to vert boundaries
for iHoz = 1:2
    prox = abs(botLoc(1)-edge(iHoz));
    if prox<=5    
        potEdge(iHoz) = (1/prox-1/5)^2/2;
    else
        potEdge(iHoz) = 0;
    end
end

for iVert = 1:2
    prox = abs(botLoc(2)-edge(iVert));
    if prox<=5    
        potEdge(2+iVert) = (1/prox-1/5)^2/2;
    else
        potEdge(2+iVert) = 0;
    end
end

if ~isempty(bots(current).corner)
    corner = bots(current).corner;
    dist = distance(botLoc,corner);
    if dist >=15
        potCorner = 3*dist;
    end
end

boundU = potCorner+sum(potEdge);
end

