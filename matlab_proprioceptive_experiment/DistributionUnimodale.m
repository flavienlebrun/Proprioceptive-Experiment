function [covaAReel,varAReelX,varAReelZ,covaReel,varReelX,varReelZ] = DistributionUnimodale(PosTargetXsort,PosTargetZsort,PosXsort,PosZsort,TargetNbr,TrialNbr,nbrBootstrap)

cova = zeros(TargetNbr*3,1);
varX = zeros(TargetNbr*3,1);
varZ = zeros(TargetNbr*3,1);

for i = 1:1:TargetNbr*3
    A = mean(bootstrp(nbrBootstrap,@cov,[PosXsort((i-1)*TrialNbr+1:i*TrialNbr,1) PosZsort((i-1)*TrialNbr+1:i*TrialNbr,1)]));
    cova(i) = A(2);   
    varX(i) = A(1);
    varZ(i) = A(4);
end

[R,theta,varCoorX,varCoorZ] = InterpolationVariance(PosTargetXsort,PosTargetZsort,varX,varZ,TargetNbr,TrialNbr);

%% calcul des nouvelle variances selon la direction X
varX1 =  varX(1:TargetNbr,1);
varX2 =  varX(TargetNbr+1:2*TargetNbr,1);
varX3 =  varX(2*TargetNbr+1:3*TargetNbr,1);
varReelX(1:TargetNbr) = (1/2)*(varX1 + varX3 - varX2);
varReelX(TargetNbr+1:2*TargetNbr) = (1/2)*(varX2 + varX3 - varX1);
varReelX(2*TargetNbr+1:3*TargetNbr) = (1/2)*(varX1 + varX2 - varX3);

%% calcul des nouvelle variances selon la direction Z
varZ1 =  varZ(1:TargetNbr,1);
varZ2 =  varZ(TargetNbr+1:2*TargetNbr,1);
varZ3 =  varZ(2*TargetNbr+1:3*TargetNbr,1);
varReelZ(1:TargetNbr) = (1/2)*(varZ1 + varZ3 - varZ2);
varReelZ(TargetNbr+1:2*TargetNbr) = (1/2)*(varZ2 + varZ3 - varZ1);
varReelZ(2*TargetNbr+1:3*TargetNbr) = (1/2)*(varZ1 + varZ2 - varZ3);

%% calcul des covariances 
cova1 = cova(1:TargetNbr,1);
cova2 = cova(TargetNbr+1:2*TargetNbr,1);
cova3 = cova(2*TargetNbr+1:3*TargetNbr,1);

covaReel(1:TargetNbr) = (1/2)* (cova1+cova3-cova2);
covaReel(TargetNbr+1:2*TargetNbr) = (1/2)*(cova2+cova3-cova1);
covaReel(2*TargetNbr+1:3*TargetNbr) = (1/2)* (cova1+cova2-cova3);

%% calcul des nouvelle variances selon la direction X avec correction

varX1 =  varCoorX(1:TargetNbr,1);
varX2 =  varCoorX(TargetNbr+1:2*TargetNbr,1);
varX3 =  varCoorX(2*TargetNbr+1:3*TargetNbr,1);
varAReelX(1:TargetNbr) = (1/2)*(varX1 + varX3 - varX2);
varAReelX(TargetNbr+1:2*TargetNbr) = (1/2)*(varX2 + varX3 - varX1);
varAReelX(2*TargetNbr+1:3*TargetNbr) = (1/2)*(varX1 + varX2 - varX3);

%% calcul des nouvelle variances selon la direction Z avec correction
varZ1 =  varCoorZ(1:TargetNbr,1);
varZ2 =  varCoorZ(TargetNbr+1:2*TargetNbr,1);
varZ3 =  varCoorZ(2*TargetNbr+1:3*TargetNbr,1);
varAReelZ(1:TargetNbr) = (1/2)*(varZ1 + varZ3 - varZ2);
varAReelZ(TargetNbr+1:2*TargetNbr) = (1/2)*(varZ2 + varZ3 - varZ1);
varAReelZ(2*TargetNbr+1:3*TargetNbr) = (1/2)*(varZ1 + varZ2 - varZ3);

%% calcul des nouvelles covariances avec correction
cova1 = cova(1:TargetNbr,1);
cova2 = cova(TargetNbr+1:2*TargetNbr,1);
cova3 = cova(2*TargetNbr+1:3*TargetNbr,1);

covaAReel(1:TargetNbr) = (1/2)* (cova1+cova3-cova2);
covaAReel(TargetNbr+1:2*TargetNbr) = (1/2)*(cova2+cova3-cova1);
covaAReel(2*TargetNbr+1:3*TargetNbr) = (1/2)* (cova1+cova2-cova3);

%% correction des valeurs abhérantes 
for k = 1:1:TargetNbr*3
    if varReelX(k) < 0
        varReelX(k)= 0;
    end
    if varReelZ(k)<0
        varReelZ(k) = 0;
    end
end
for k = 1:1:TargetNbr*3
    if varAReelX(k) < 0
        varAReelX(k)= 0;
    end
    if varAReelZ(k)<0
        varAReelZ(k) = 0;
    end
end
for k = 1:1:TargetNbr*3
    if sqrt(varReelX(k)*varReelZ(k))<covaReel(k)
        covaReel(k) = sqrt(varReelX(k)*varReelZ(k));
    end
end
for k = 1:1:TargetNbr*3
    if sqrt(varAReelX(k)*varAReelZ(k))<covaAReel(k)
        covaAReel(k) = sqrt(varAReelX(k)*varReelZ(k));
    end
end
end