function cellArray = polygonKnownCells(infCells,cellArray,vorCells,vorVerts)

% determines known cells
knownCells = linspace(1,25,25);
knownCells([infCells]) = [];

% gets polygon vertices
for nCell = 1:size(knownCells,2)
    xcoords = [];
    ycoords = [];
    vertices = vorCells{knownCells(nCell),1};
    for nVert = 1:size(vertices,2)
        xcoords = [xcoords vorVerts(vertices(nVert),1)];
        ycoords = [ycoords vorVerts(vertices(nVert),2)];
    end
    cellArray(knownCells(nCell)).xverts = xcoords;
    cellArray(knownCells(nCell)).yverts = ycoords;
end

