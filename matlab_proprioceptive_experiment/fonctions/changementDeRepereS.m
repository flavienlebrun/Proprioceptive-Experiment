function [PosChangeX,PosChangeY] = changementDeRepereS(PosX,PosY,xStartingPos,yStartingPos,xCubeCenter,yCubeCenter)
theta = atan((yStartingPos-yCubeCenter)/(xCubeCenter - xStartingPos));
rotangledroit = [cos(-pi/2-theta) -sin(-pi/2-theta);sin(-pi/2-theta) cos(-pi/2-theta)];
PosChangeX = -PosX;
PosChangeY = PosY;
PosChangeX = PosChangeX + xStartingPos;
PosChangeY = PosChangeY - yStartingPos;
PosChangeY = - PosChangeY; 
A = [PosChangeX,PosChangeY]*rotangledroit;

PosChangeX = A(:,1);
PosChangeY = A(:,2);