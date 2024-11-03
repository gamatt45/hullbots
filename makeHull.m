% Function to create the ship hull, a 100x100 grid

function [hull] = makeHull()
points = linspace(1,100,100);
hull = struct('xx',points,'yy',points);
