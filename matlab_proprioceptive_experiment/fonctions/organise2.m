function [choiceOrganise,stat] = organise2(choice,angleOffset,nbrTarget,AngleOrdonne)

%sort fonction organisant les vecteurs par target
%   La fonction prends les vecteur angle et choix et organise les choix en
%   fonction des angles dans une matrice 10x11 
%   Les pourcentage de 1 sont ensuite calculet pour chaque vecteur colonne
%   de la matrice
% 

[length,l] = size(choice);
choiceOrganise = ones(length/nbrTarget,nbrTarget);

alreadyPlaced = ones(1,nbrTarget);

for i = 1:1:length
    for k = 1:1:nbrTarget
        if (angleOffset(i,1) == AngleOrdonne(k) && alreadyPlaced(k)<=length/nbrTarget)
            choiceOrganise(alreadyPlaced(k),k) = choice(i,1);
            alreadyPlaced(k) = alreadyPlaced(k)+1;
        end          
    end
end
stat = ones(1,nbrTarget);
for k = 1:1:nbrTarget
    stat(1,k) = sum(choiceOrganise(:,k))/(length/nbrTarget);
end
end