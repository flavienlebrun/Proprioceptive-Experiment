clear all
%% experiment caracterisation
TargetNbr = 7;
TrialNbr = 20;
xStartingPos = 0.1059495;
yStartingPos = 0.8128;
xCubeCenter = 0.1599109;
yCubeCenter = 1.211317;

[calibX,calibY] = changementDeRepere(xCubeCenter,yCubeCenter,xStartingPos,yStartingPos,xCubeCenter,yCubeCenter);
%% data recuperation 
filename = 'Sophia_cond1et2_expe1 (1).txt';
[C_header,C_posCenter,Data] = lireDataExpe1sophia(filename);

    
PosX = Data(:,4);
PosY = Data(:,5);
PosZ = Data(:,6);
Target = Data(:,11);
Condition = Data(:,12);
PosTargetX = Data(:,15);
PosTargetY = Data(:,16);    
PosTargetZ = Data(:,17);
%% sorting data by target and condition

[PosXsort,PosZsort] = organise(PosX, PosY, PosZ,Target,Condition,TargetNbr,TrialNbr);

[PosTargetXsort,PosTargetZsort] = organise(PosTargetX, PosTargetY, PosTargetZ,Target,Condition,TargetNbr,TrialNbr);


[origineX,origineY] = changementDeRepere(xStartingPos,yStartingPos,xStartingPos,yStartingPos,PosTargetXsort(1,1),PosTargetZsort(1,1));
[PosXsort,PosZsort] = changementDeRepere(PosXsort,PosZsort,PosTargetXsort(21,1),PosTargetZsort(21,1),PosTargetXsort(1,1),PosTargetZsort(1,1));
[PosTargetXsort,PosTargetZsort] = changementDeRepere(PosTargetXsort,PosTargetZsort,PosTargetXsort(21,1),PosTargetZsort(21,1),PosTargetXsort(1,1),PosTargetZsort(1,1));


%% calcul variance unidemensionnel and center

[varX,varZ,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,cova2] = varianceCorrRhoTheta(PosXsort,PosZsort,TargetNbr,TrialNbr);

%% plot
ScatterPlotCondition123(PosXsort,PosZsort,PosTargetXsort,PosTargetZsort,TrialNbr,TargetNbr,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova);

