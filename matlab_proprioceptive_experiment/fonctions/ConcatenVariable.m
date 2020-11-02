function [VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,CovaAReel,VarAReelX,VarAReelZ,TargetNbr)
%% concaténation des variables pour toutes les cibles selon leur modalités et leur direction(x ou y)
VarXP = [VarXP VarAReelX(1:TargetNbr)'];
VarXV = [VarXV VarAReelX(2*TargetNbr+1:3*TargetNbr)'];
VarYP = [VarYP VarAReelZ(1:TargetNbr)'];
VarXL = [VarXL VarAReelX(TargetNbr+1:2*TargetNbr)'];
VarYL = [VarYL VarAReelZ(TargetNbr+1:2*TargetNbr)'];
VarYV = [VarYV VarAReelZ(2*TargetNbr+1:3*TargetNbr)'];
CovaP = [CovaP CovaAReel(1:TargetNbr)'];
CovaV = [CovaV CovaAReel(2*TargetNbr+1:3*TargetNbr)'];
CovaL = [CovaL CovaAReel(TargetNbr+1:2*TargetNbr)'];


%% concaténation de la somme des variable sur toutes les cibles
sumVarXP = [sumVarXP sum(VarAReelX(1:TargetNbr))/TargetNbr];
sumVarYP = [sumVarYP sum(VarAReelZ(1:TargetNbr))/TargetNbr];
sumVarXV = [sumVarXV sum(VarAReelX(2*TargetNbr+1:3*TargetNbr))/TargetNbr];
sumVarYV = [sumVarYV sum(VarAReelZ(2*TargetNbr+1:3*TargetNbr))/TargetNbr];
sumVarXL = [sumVarXL sum(VarAReelX(TargetNbr+1:2*TargetNbr))/TargetNbr];
sumVarYL = [sumVarYL sum(VarAReelZ(TargetNbr+1:2*TargetNbr))/TargetNbr];
sumCovaP = [sumCovaP sum(CovaAReel(1:TargetNbr))/TargetNbr];
sumCovaV = [sumCovaV sum(CovaAReel(2*TargetNbr+1:3*TargetNbr))/TargetNbr];
sumCovaL = [sumCovaL sum(CovaAReel(TargetNbr+1:2*TargetNbr))/TargetNbr];

end