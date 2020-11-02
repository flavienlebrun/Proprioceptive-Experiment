function [TargetSimpleX,TargetSimpleZ] = CalculCentreSimple(PosTargetXsort,PosTargetZsort,TrialNbr,TargetNbr)
TargetSimpleX = ones(TargetNbr*3,1);
TargetSimpleZ = ones(TargetNbr*3,1);

for k=1:1:3*TargetNbr
    PositionX = PosTargetXsort((k-1)*TrialNbr+1:k*TrialNbr);
    PositionZ = PosTargetZsort((k-1)*TrialNbr+1:k*TrialNbr);
    TargetSimpleX(k) = (sum(PositionX)-min(PositionX)-max(PositionX))/(TrialNbr-2);
    TargetSimpleZ(k) = (sum(PositionZ)-min(PositionZ)-max(PositionZ))/(TrialNbr-2);
end