function [R,theta,varCoorX,varCoorZ] = InterpolationVariance(PosTargetXsort,PosTargetZsort,varX,varZ,TargetNbr,TrialNbr)
%% creation of R and theta from Xtargetpos and Ztargetpos
X = zeros(TargetNbr,1);
Z = zeros(TargetNbr,1);
R = zeros(TargetNbr,1);
theta = zeros(TargetNbr,1);

for i =1:1:TargetNbr
    X(i,1) = PosTargetXsort((i-1)*TrialNbr+1);
    Z(i,1) = PosTargetZsort((i-1)*TrialNbr+1);
    %  calcul de theta
    if X(i,1)>0 && Z(i,1)>=0
        theta(i,1) = atan(Z(i,1)/X(i,1));
    end

    if X(i,1)>0 && Z(i,1)<0
        theta(i) = atan(Z(i,1)/X(i,1)) + 2*pi;
    end    

    if X(i,1)<0
        theta(i) = atan(Z(i,1)/X(i,1)) + pi;
    end

    if X(i,1)==0 && Z(i,1)>0
        theta(i) = pi/2;
    end

    if X(i,1)==0 && Z(i,1)<0
        theta(i) = -pi/2;
    end 
end
% calcul de R
R = sqrt(X.*X+Z.*Z);


%% interpolation polynomiale des variances pour corriger les données
varCoorX = varX;
varCoorZ = varZ;
A = zeros(4,1);
for i = 1:1:3     
    
    p = polyfit(R(1:4),varX((i-1)*TargetNbr+1:(i-1)*TargetNbr+4),1);
    varCoorX((i-1)*TargetNbr+1:(i-1)*TargetNbr+4,1) = polyval(p,R(1:4));
    q = polyfit(theta(4:7),[varCoorX((i-1)*TargetNbr+3);varX((i-1)*TargetNbr+5:(i-1)*TargetNbr+7)],1);
    A = polyval(q,theta(4:7));
    varCoorX((i-1)*TargetNbr+3,1) = A(1,1);
    varCoorX((i-1)*TargetNbr+5:(i-1)*TargetNbr+7,1) = A(2:4,1);
end
for i = 1:1:3     
    p = polyfit(R(1:4),varZ((i-1)*TargetNbr+1:(i-1)*TargetNbr+4),1);
    varCoorZ((i-1)*TargetNbr+1:(i-1)*TargetNbr+4,1) = polyval(p,R(1:4));
    q = polyfit(theta(4:7),[varCoorZ((i-1)*TargetNbr+3);varZ((i-1)*TargetNbr+5:(i-1)*TargetNbr+7)],1);
    A = polyval(q,theta(4:7));
    varCoorZ((i-1)*TargetNbr+3,1) = A(1,1);
    varCoorZ((i-1)*TargetNbr+5:(i-1)*TargetNbr+7,1) = A(2:4,1);
    
end

    % p = polyfit(x,varX(i),n)

end