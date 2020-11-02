function [PosChangeX,PosChangeZ] = changementDeReperePosition(PosX,PosZ,xStartingPos,zStartingPos,xSecondPoint,zSecondPoint)
theta = 0;
xStartingPos = xStartingPos*ones(length(PosX),1);
zStartingPos = zStartingPos*ones(length(PosX),1);
xSecondPoint = xSecondPoint*ones(length(PosX),1);
zSecondPoint = zSecondPoint*ones(length(PosX),1);

%% translation
PosChangeX = PosX;
PosChangeZ = PosZ;
PosChangeX = PosChangeX - xStartingPos;
PosChangeZ = PosChangeZ - zStartingPos;
xSecondPoint = xSecondPoint - xStartingPos;
zSecondPoint = zSecondPoint - zStartingPos;


% rotation
xSecondpoint = xSecondPoint(1);
zSecondpoint = zSecondPoint(1);


for i=1:1:length(PosX)
   
    if xSecondpoint>0 && zSecondpoint>=0
        theta = atan(zSecondpoint/xSecondpoint);
    end

    if xSecondpoint>0 && zSecondpoint<0
        theta = atan(zSecondpoint/xSecondpoint) + 2*pi;
    end    

    if xSecondpoint<0
        theta = atan(zSecondpoint/xSecondpoint) + pi;
    end

    if xSecondpoint==0 && zSecondpoint>0
        theta = pi/2;
    end

    if xSecondpoint==0 && zSecondpoint<0
        theta = -pi/2;
    end

    rotangledroit = [cos(-(pi/2)+theta) -sin(-(pi/2)+theta);sin(-(pi/2)+theta) cos(-(pi/2)+theta)];
    A = [PosChangeX(i),PosChangeZ(i)]*rotangledroit;
    PosChangeX(i) = A(:,1);
    PosChangeZ(i) = A(:,2);    
  
end

end


