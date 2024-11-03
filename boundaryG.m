function [boundG] = boundaryG(bots,current)
% repulsive based on proximity to bounds (attractive for corner bots)
gradEdge = zeros(2,4);
gradCorner = [0;0];
edge = [1 100];
botLoc = bots(current).location;

% repulsive prox to vert boundaries
for iHoz = 1:2
    prox = abs(botLoc(1)-edge(iHoz));
    grad = gradDistance(botLoc,[edge(iHoz);botLoc(2)]);
    if prox<=5    
        gradEdge(:,iHoz) = -(1./prox-1/5).*(1./prox.^2).*grad;
    else
        gradEdge(:,iHoz) = [0;0];
    end
end
for iVert = 1:2
    prox = abs(botLoc(2)-edge(iVert));
    grad = gradDistance(botLoc,[botLoc(1);edge(iVert)]);
    if prox<=5    
        gradEdge(:,2+iVert) = -(1./prox-1/5).*(1./prox.^2).*grad;
    else
        gradEdge(:,2+iVert) = [0;0];
    end
end

if ~isempty(bots(current).corner)
    corner = bots(current).corner;
    dist = distance(botLoc,corner);
    if dist >= 15
        gradCorner = 3*((botLoc-corner)/dist);
    end
end
totEdge = [sum(gradEdge(1,:));sum(gradEdge(2,:))];
boundG = gradCorner+totEdge;