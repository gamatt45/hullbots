% This is the overall program that takes in the system. 
% Inputs are the biofouling function, the system type, either a single
% agent, multi, non-weighted agent, or multi-weighted agent, and then the
% health of the robots (a 1x25 array for a nulti system or a single integer
% if a single system)

% It will output the time to completion for the system, and 
% visualizes the overall movement in the case of the last system

function deployment(biofoulingFunction)
health = ones(1,25);
% creates the hull environment
hull = makeHull();

% determines the biofouling on the hull
bioHull = biofouling(hull, biofoulingFunction);

% initialize a multirobot system
bots = init25bots(health);
bots = neighborAssignment(bots);

% illustrates the hull 
hullViz(bioHull);

% illustrates the inital system
disp('Figure 2 displays the initial bot distribution and connection grid (A) and the voronoi decomposition (B)')
systemViz(bots);

% single agent system
singleSystem(bioHull);

% unweighted system
unweighted(bots, bioHull);

% weighted system
weighted(bots, bioHull);

end
