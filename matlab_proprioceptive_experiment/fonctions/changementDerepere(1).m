function [Pointhomotx,Pointhomoty] = changementDerepere(Pointx,Pointy,posXStartingPos,posZStartingPos,posXCubeCenter,posZCubeCenter)



Pointhomot = [Pointx;Pointy];
theta = atan((posZStartingPos-posZCubeCenter)/(posXCubeCenter - posXStartingPos));

matrot = [cos(theta) -sin(theta);sin(theta) cos(theta)];
Pointhomot = matrot*Pointhomot;
Pointhomotx = Pointhomot(1)-posXCubeCenter;
Pointhomoty = Pointhomot(2)-posZCubeCenter;
end