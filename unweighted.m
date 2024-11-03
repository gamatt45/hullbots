function unweighted(bots, hull)
    time2completion = equilibriumCalc(hull,bots);
    disp('Time to completion for a multi agent, unweighted system:')
    disp(time2completion)
end

