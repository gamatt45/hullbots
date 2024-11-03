% calculates time for a single system with health 5 to clear the hull
function singleSystem(hull)
    % total fouling
    StotalFouling = sum(sum(hull.F));
    % time to clear 
    time2completion = StotalFouling/10;
    disp('Time to completion for a single agent system:')
    disp(time2completion)
end

