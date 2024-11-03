%function [gradDPointsSphere]=sphere_distanceGrad(sphere,points)
%Computes the gradient of the signed distance between points and the sphere,
%consistently with the definition of sphere_distance.
function [grad]=gradDistance(bot,neighbor)
diff = bot - neighbor;
grad = (1/norm(diff))*diff;
