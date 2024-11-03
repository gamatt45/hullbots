function gridViz(bots)
hold on
for ibot = 1:25
    neighbors = bots(ibot).neighbors;
    botLoc = bots(ibot).location;
    for jnu = 1:size(neighbors,2)
        nuLoc = bots(neighbors(jnu)).location;
        plot([nuLoc(1) botLoc(1)],[nuLoc(2) botLoc(2)],'k')
    end
    if ~isempty(bots(ibot).corner)
        corner = bots(ibot).corner;
        plot([corner(1) botLoc(1)],[corner(2) botLoc(2)],'k')
    else
    end
end
end