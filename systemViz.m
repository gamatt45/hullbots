function systemViz(bots)
figure
hold on
subplot(1,2,1)
botViz(bots)
boundaryViz()
gridViz(bots)
title('A');
subplot(1,2,2)
boundaryViz()
[x, y]=voronoiInputs(bots);
voronoi(x,y)
title('B');