function cellArray = makeCellArray()
cellArray = struct('number',[],'xverts',[],'yverts',[]);
for icell = 1:25
    cellArray(icell).number = icell;
end