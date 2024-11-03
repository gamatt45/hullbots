function foulingTot = equiBiofouling(hull,polyX,polyY)
foulingTot = 0;
for xcoord = 1:100
    for ycoord = 1:100
        if inpolygon(xcoord,ycoord,polyX,polyY)
            foulingTot = foulingTot+hull.F(xcoord,ycoord);
        end
    end
end
