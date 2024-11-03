function [vorX, vorY] = voronoiInputs(bots)
vorX = zeros(1,25);
vorY = zeros(1,25);
for ibot = 1:25
    vorX(ibot) = bots(ibot).location(1);
    vorY(ibot) = bots(ibot).location(2);
end