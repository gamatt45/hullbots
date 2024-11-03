function [infCells, cellArray] = findInfinityCells(cellArray, vorCells, vorVerts, extX, extY,bots)
% finds the cells with infinity
infCells = [];
for icell = 1:25
    vert = vorCells{icell,1};
    for jvert = 1:size(vert,2)
        if vert(jvert)==1
            infCells = [infCells icell];
        end
    end
end

% seperates the ext coords into xy pairs
innerVert = [extX(1,:);extY(1,:)];
extVert = [extX(2,:);extY(2,:)];

%find vertecies of voronoi cell loops for each cell
for nCell = 1:size(infCells,2)
    xcoords = [];
    ycoords = [];
    vertices = vorCells{infCells(nCell),1};
   
    % gets coordinates for all known vertices
    for nVert = 1:size(vertices,2)
        if vertices(nVert)~=1
            xcoords = [xcoords vorVerts(vertices(nVert),1)];
            ycoords = [ycoords vorVerts(vertices(nVert),2)];
        end
    end

    % gets coords for unknowns
    vertNum = size(xcoords,2);
    for matchE = 1:size(innerVert,2)
        for matchI = 1:vertNum
            if innerVert(1,matchE) == xcoords(matchI) && innerVert(2,matchE) == ycoords(matchI) 
                % does corner
                if ~isempty(bots(infCells(nCell)).corner)
                xcoords = [xcoords extVert(1,matchE)];
                ycoords = [ycoords extVert(2,matchE)];
                elseif infCells(nCell)<5.5 || infCells(nCell)>20.5
                    if extVert(1,matchE)<1 || extVert(1,matchE)>100
                        xcoords = [xcoords extVert(1,matchE)];
                        ycoords = [ycoords extVert(2,matchE)];
                    end
                elseif infCells(nCell)>5.5 && infCells(nCell)<20.5
                    if extVert(2,matchE)<1 || extVert(2,matchE)>100
                        xcoords = [xcoords extVert(1,matchE)];
                        ycoords = [ycoords extVert(2,matchE)];
                    end
                end
            end
        end
    end
    if ~isempty(bots(infCells(nCell)).corner)
        xcoords = [xcoords(1:2) bots(infCells(nCell)).corner(1) xcoords(3:end)];
        ycoords = [ycoords(1:2) bots(infCells(nCell)).corner(2) ycoords(3:end)];
    end
    % pushes polygon vert to the cell Array
    cellArray(infCells(nCell)).xverts = xcoords;
    cellArray(infCells(nCell)).yverts = ycoords;
end

