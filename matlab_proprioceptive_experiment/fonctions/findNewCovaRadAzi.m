function [covaRadAzi] = findNewCovaRadAzi(cova,x,y)
theta = calculTheta(x,y);
matRot = [cos(theta) -sin(theta);sin(theta) cos(theta)];
 
covaRadAzi = inv(matRot)*cova*matRot;
end