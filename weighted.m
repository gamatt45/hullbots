function weighted(bots, hull)

bots = potgrad(bots,hull);
sysPot = sum([bots.potential]);
figure
hold on
boundaryViz

while sum([bots.potential]) > 2500 % threshold for "equilibrium"
    bots = locUpdate(bots);
    bots = potgrad(bots,hull);
    sysPot = sum([bots.potential]);
end

    time2completion = equilibriumCalc(hull,bots);
    disp('Time to completion for a multi agent, weighted system:')
    disp(time2completion)
    disp('Figure 3 illustrates the positions of the robot system overtime, which culminates in their paths')
    disp('Figure 4 displays the bot distribution and connection grid (A) and the voronoi decomposition (B) at the end of the program')
    systemViz(bots)
end

