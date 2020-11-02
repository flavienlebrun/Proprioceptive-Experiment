function [ecart_type, moyenne_variance,max_variance,min_variance] = VarianceEval(PositionPoint,nbrePoint)
%VarianceEval fonction retournant les variances et la moyenne de ces
%variances pour toute les combinaisons de taille nbrePoint d'une
%distribution de point PositionPoint


%% generations de toutes les combinaisons de nbrePoint éléments de PositionPoint

combinaisons = combnk(PositionPoint,nbrePoint);

sizeC = size(combinaisons);
variances = ones(sizeC(1),1);

%% Calcul de toutes les variances

for i=1:1:sizeC(1)
    Selection = combinaisons(i,:);
    center = (sum(Selection)/nbrePoint)*ones(1,nbrePoint);
    variances(i) = sum((Selection - center).*(Selection - center))/nbrePoint;

end    
 
%% calcul de la moyenne des variances
moyenne_variance = sum(variances)/sizeC(1);
Moyenne = moyenne_variance * ones(1,sizeC(1));
ecart_type = sum((variances' - Moyenne).*(variances' - Moyenne))/sizeC(1);
max_variance = max(variances);
min_variance = min(variances);



%%plot des variances

hist(variances,10);
end
