function [PosXsortTri,PosZsortTri] = TriMahalanobisDistance(PosXsort,PosZsort,varX,varZ,cova,TrialNbr,TargetNbr,Xcenter,Zcenter)
PosXsortTri = PosXsort;
PosZsortTri = PosZsort;
for k=0:1:TargetNbr*3-1
    sigmax = sqrt(varX(k+1));
    sigmaz = sqrt(varZ(k+1));
    rho = cova(k+1)/(sigmax*sigmaz);
    mu1 = Xcenter(k+1);
    mu2 = Zcenter(k+1);
    for i = 1:1:TrialNbr
        x = PosXsort(k*TrialNbr+i);
        z = PosZsort(k*TrialNbr+i);
        r2 = (1/(1-rho^2))*(((x - mu1)/(sigmax))^2 + ((z - mu2)/(sigmaz))^2 - 2*rho*((x - mu1)/(sigmax))*((z - mu2)/(sigmaz)));
        if r2 > 9;
            PosXsortTri(k*TrialNbr+i) = mu1;
            PosZsortTri(k*TrialNbr+i) = mu2;
        end
    end
end
end
