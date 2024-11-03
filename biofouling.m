% determines the biofouling at every coordinate on the hull given user
% input

function [bioHull] = biofouling(grid, fun)

if isa(fun,'function_handle')
    bioHull = grid_eval(grid,fun);
elseif isa(fun,'string') && strcmp(fun,'peaks')
    grid.F = round((peaks(100)+7)/3);
    bioHull = grid;
elseif isa(fun,'string') && strcmp(fun,'random')
    grid.F = [round((10/2)*rand(50)) round((10/7)*rand(50));round((10/5)*rand(50)) round((10/10)*rand(50))];
    bioHull = grid;
else
    disp('Not a valid input for function. Please enter a "peaks," "random," or a function handle of the form @ (locationInput) function(locationInput) where the locationInput is of the form [x; y].')
end