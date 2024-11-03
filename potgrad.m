function bots = potgrad(bots,hull)
    for ibot = 1:25
        bots(ibot).localFouling = localBFLevel(hull,bots(ibot).location);
    end
    for mbots = 1:25
        bots(mbots).potential = potentialTotal(bots,mbots);
        bots(mbots).gradient = gradTotal(bots,mbots);
    end
end