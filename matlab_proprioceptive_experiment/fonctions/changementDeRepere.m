function [PosChangeX,PosChangeZ] = changementDeRepere(PosX,PosZ,xStartingPos,zStartingPos,xSecondPoint,zSecondPoint,Target,TargetNbr,TrialNbr)
theta = 0;
%% translation
PosChangeX = PosX;
PosChangeZ = PosZ;
PosChangeX = PosChangeX - xStartingPos;
PosChangeZ = PosChangeZ - zStartingPos;
xSecondPoint = xSecondPoint - xStartingPos;
zSecondPoint = zSecondPoint - zStartingPos;


%% rotation
xSecondpoint = 0;
zSecondpoint = 0;
for i=1:1:4
    if Target(i)<4
        xSecondpoint = xSecondPoint(i);
        zSecondpoint = zSecondPoint(i);
    end    
end

for i=1:1:TargetNbr*TrialNbr
    if Target(i)<4
        xSecondpoint = xSecondPoint(i);
        zSecondpoint = zSecondPoint(i);
    end
    if xSecondpoint>0 && zSecondpoint>=0
        theta = atan(zSecondpoint/xSecondpoint(1));
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

xSecondpoint = 0;
zSecondpoint = 0;
for i=1:1:4
    if Target(TargetNbr*TrialNbr+i)<4
        xSecondpoint = xSecondPoint(i);
        zSecondpoint = zSecondPoint(i);
    end    
end

for i=TargetNbr*TrialNbr+1:1:2*TargetNbr*TrialNbr
    if Target(i)<4
        xSecondpoint = xSecondPoint(i);
        zSecondpoint = zSecondPoint(i);
    end
    if xSecondpoint>0 && zSecondpoint>=0
        theta = atan(zSecondpoint/xSecondpoint(1));
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

xSecondpoint = 0;
zSecondpoint = 0;
for i=1:1:4
    if Target(2*TargetNbr*TrialNbr+i)<4
        xSecondpoint = xSecondPoint(i);
        zSecondpoint = zSecondPoint(i);
    end    
end

for i=2*TargetNbr*TrialNbr+1:1:3*TargetNbr*TrialNbr
    if Target(i)<4
        xSecondpoint = xSecondPoint(i);
        zSecondpoint = zSecondPoint(i);
    end
    if xSecondpoint>0 && zSecondpoint>=0
        theta = atan(zSecondpoint/xSecondpoint(1));
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


