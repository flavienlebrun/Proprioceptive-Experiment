function [PosXsort,PosZsort] = organise(PosX, PosY, PosZ,Target,Condition,TargetNbr,TrialNbr)

%sort fonction organisant les vecteurs par target
%   La fonction prends les vecteurs avec les différents points mélangés et
%   les organise par target dans l'ordre croissant
%  
[length,l] = size(Condition)

% new vector with result sorted
AlreadyAimed = ones(3*TargetNbr,1);
PosXsort = ones(length,1);
PosYsort = ones(length,1);
PosZsort = ones(length,1);

for i = 1:1:length
     condition = Condition(i);
     target = Target(i);
     pos = TrialNbr*target + AlreadyAimed(1 + target + (condition-1)*TargetNbr) + (TrialNbr*TargetNbr)*(condition-1);
     arrayIndice1 = 1 + target + (condition-1)*TargetNbr;
     
     PosXsort(pos) = PosX(i);
     PosYsort(pos) = PosY(i);
     PosZsort(pos) = PosZ(i);
     
     AlreadyAimed(1 + target + (condition-1)*TargetNbr) = AlreadyAimed(1 + target + (condition-1)*TargetNbr) + 1;
     
end
end
