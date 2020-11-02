function [varX,varZ,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,cova2] = varianceCorrRhoTheta(PosXsort,PosZsort,TargetNbr,TrialNbr,nbrBootstrap)
%% varianceCorrRhoTheta V1.001
% this function take two vector position and return unidimensionnnal
% variance of each vector position and the correlation coefficient and the
% covariance of the two dimensions

%% calculate the center
Xcenter = zeros(TargetNbr*3,1);
Zcenter = zeros(TargetNbr*3,1);
for i = 1:1:TargetNbr*3

    Xcenter(i) = mean(PosXsort((i-1)*TrialNbr + 1:i*TrialNbr));
    Zcenter(i) = mean(PosZsort((i-1)*TrialNbr + 1:i*TrialNbr));
    
end
[thetaCenter, rCenter] = cart2pol(Xcenter,Zcenter);
%% transformation en coordonnée polaire
[theta,r] =  cart2pol(PosXsort,PosZsort);
%% calcul des variances selon rho et theta

sigmaRho = zeros(TargetNbr*3,1);
sigmaTheta = zeros(TargetNbr*3,1);
sigmaX = zeros(TargetNbr*3,1);
sigmaZ = zeros(TargetNbr*3,1);

for i = 1:1:TargetNbr*3
    for k = 1:1:TrialNbr
        sigmaX(i) = sigmaX(i) + (PosXsort(k+(i-1)*TrialNbr) - Xcenter(i)) * (PosXsort(k+(i-1)*TrialNbr) - Xcenter(i));
        sigmaZ(i) = sigmaZ(i) + (PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)) * (PosZsort(k+(i-1)*TrialNbr) - Zcenter(i));
    end
    sigmaX(i) = sigmaX(i)/TrialNbr;
    sigmaZ(i) = sigmaZ(i)/TrialNbr;
end



%% Calculate the correlation coefficient
rho = zeros(TargetNbr*3,1);
cova = zeros(TargetNbr*3,1);

cova2 = zeros(TargetNbr*3,1);
varX = zeros(TargetNbr*3,1);
varZ = zeros(TargetNbr*3,1);

for i = 1:1:TargetNbr*3
    A = mean(bootstrp(nbrBootstrap,@cov,[PosXsort((i-1)*TrialNbr+1:i*TrialNbr,1) PosZsort((i-1)*TrialNbr+1:i*TrialNbr,1)]));
    cova2(i) = A(2);   
    varX(i) = A(1);
    varZ(i) = A(4);
end

for i = 1:1:TargetNbr*3
    for k=1:1:TrialNbr
        rho(i) = rho(i) + ((PosXsort(k+(i-1)*TrialNbr) - Xcenter(i))*(PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)));
        cova(i) = cova(i) + ((PosXsort(k+(i-1)*TrialNbr) - Xcenter(i))*(PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)));   
    end
    rho(i) = rho(i)/(sqrt(sigmaX(i))*sqrt(sigmaZ(i))*TrialNbr);
    cova(i) = cova(i)/TrialNbr;
end


%rho,cova
