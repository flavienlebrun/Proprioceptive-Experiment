function [Theta,covaInt] = VarianceInterpolationAllSurface(PosTargetXsort,PosTargetZsort,varX,varZ,Cova,x,y,typeOfInterpol,TrialNbr)
% crée la fonction f(r,theta) qui permet d'obtenir la variance en tout point de l'espace 
% le retour de cette fonction est une matrice de covariance qui dépend de
% (r,theta)
%% creation de point de centre target pour l'interpolation
X = [PosTargetXsort(1,1) PosTargetXsort(1 +TrialNbr,1) PosTargetXsort(1 + 2*TrialNbr,1) PosTargetXsort(1 + 3*TrialNbr,1) ...
    PosTargetXsort(1 + 4*TrialNbr,1) PosTargetXsort(1 + 5*TrialNbr,1) PosTargetXsort(1 + 6*TrialNbr,1)];
Z = [PosTargetZsort(1,1) PosTargetZsort(1 +TrialNbr,1) PosTargetZsort(1 + 2*TrialNbr,1) PosTargetZsort(1 + 3*TrialNbr,1) ...
    PosTargetZsort(1 + 4*TrialNbr,1) PosTargetZsort(1 + 5*TrialNbr,1) PosTargetZsort(1 + 6*TrialNbr,1)];
%% calcul de theta
theta = calculTheta(x,y);
%% calcul de la matrice de covariance interpolé
Theta = [];
Theta(1) = calculTheta(X(1),Z(1));
Theta(2) = calculTheta(X(2),Z(2));
Theta(3) = calculTheta(X(3),Z(3));
Theta(4) = calculTheta(X(4),Z(4));
Theta(5) = calculTheta(X(5),Z(5));   
Theta(6) = calculTheta(X(6),Z(6));
Theta(7) = calculTheta(X(7),Z(7));

covaInt = [interpn(Z(1:4),varX(1:4),sqrt(x^2+y^2),typeOfInterpol) ...
    ,interpn([Theta(3) Theta(5:7)],[Cova(3) Cova(5:7)],theta,typeOfInterpol); ...
    interpn([Theta(3) Theta(5:7)],[Cova(3) Cova(5:7)],theta,typeOfInterpol), ...
    interpn(Z(1:4),varZ(1:4),sqrt(x^2+y^2),typeOfInterpol)];



end
