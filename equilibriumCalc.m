function [time2completion] = equilibriumCalc(hull,bots)

cellArray = makeCellArray;

% gets locations of bots for voronoi diagram
[vorX, vorY] = voronoiInputs(bots);

% gets vertices and cells of voronoi diagram
[vertices, cells] = voronoin([vorX;vorY]');

% gets vertices with arbitrary extremes
[extX,extY] = extVorPoints(vorX,vorY);

% find cells with infinite vert
[infCells, cellArray] = findInfinityCells(cellArray,cells, vertices, extX, extY,bots);

% find cell w/o inf vert and define polygon
cellArray = polygonKnownCells(infCells,cellArray,cells,vertices);

cellFouling = zeros(1,25);
% for each cell, calculates the total fouling within
for icell = 1:25
    polyX = cellArray(icell).xverts;
    polyY = cellArray(icell).yverts;
    cellFouling(icell) = equiBiofouling(hull,polyX,polyY);
end
timeArray = cellFouling./[bots.health];
time2completion = max(timeArray);
end

