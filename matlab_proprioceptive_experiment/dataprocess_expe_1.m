clear all
close all

%% experiment caracterisation
TargetNbr = 7;
TrialNbr = 20;
VarXP = [];
VarXV = [];
VarYP = [];
VarYV = [];
VarXL = [];
VarYL = [];
CovaP = [];
CovaV = [];
CovaL = [];
sumVarXP = [];
sumVarXV = [];
sumVarYP = [];
sumVarYV = [];
sumVarXL = [];
sumVarYL = [];
sumCovaP = [];
sumCovaV = [];
sumCovaL = [];
participantsID = [];
Participant_Name = "Reyehanneh";
%% data recuperation participants
% filename = 'Data/Rlog1et2et3.txt';
% [covaAReel,varAReelX,varAReelZ,covaReel,varReelX,varReelZ,covaIntR,PosTargetXsortR,PosTargetZsortR,timebytrialR,ID,PosXsortR,PosZsortR] =process(filename,TrialNbr,TargetNbr,0,10,'Reyehanneh');
% [TargetSimpleXR,TargetSimpleZR] = CalculCentreSimple(PosTargetXsortR,PosTargetZsortR,TrialNbr,TargetNbr)
% [VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReel,varAReelX,varAReelZ,TargetNbr);
% participantsID = [participantsID 01];
% %  
% 
% filename = 'Data/FlaLog123.txt';
% [covaAReelF,varAReelXF,varAReelZF,covaReelF,varReelXF,varReelZF,covaIntF,PosTargetXsortF,PosTargetZsortF,timebytrialF,ID,PosXsortF,PosZsortF] =process(filename,TrialNbr,TargetNbr,0,10,'FlavienLebrun1');
% [TargetSimpleXF,TargetSimpleZF] = CalculCentreSimple(PosTargetXsortF,PosTargetZsortF,TrialNbr,TargetNbr);
% [VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelF,varAReelXF,varAReelZF,TargetNbr);
% participantsID = [participantsID 02];
% 
% filename1 = 'Data/Cond123Fla2Expe1.txt';
% [covaAReelF2,varAReelXF2,varAReelZF2,covaReelF2,varReelXF2,varReelZF2,covaIntF2,PosTargetXsortF2,PosTargetZsortF2,timebytrialF2,ID,PosXsortF2,PosZsortF2] =process(filename1,50,TargetNbr,0,10,'FlaNormal50');
% [TargetSimpleXF2,TargetSimpleZF2] = CalculCentreSimple(PosTargetXsortF2,PosTargetZsortF2,50,TargetNbr);
% [VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelF2,varAReelXF2,varAReelZF2,TargetNbr);

% filename2 = 'Data/Fla123FatigueExpe1.txt';
% [covaAReelFF,varAReelXFF,varAReelZFF,covaReelFF,varReelXFF,varReelZFF,covaIntFF,PosTargetXsortFF,PosTargetZsortFF,timebytrialFF,ID,PosXsortFF,PosZsortFF] =process(filename2,50,TargetNbr,0,10,'FlaFatigue50');
% [TargetSimpleXFF,TargetSimpleZFF] = CalculCentreSimple(PosTargetXsortFF,PosTargetZsortFF,50,TargetNbr);
% [VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelFF,varAReelXFF,varAReelZFF,TargetNbr);

filename10 = 'Data/LogPart010complete.txt';
[covaAReelP010,varAReelXP010,varAReelZP010,covaReelP010,varReelXP010,varReelZP010,covaIntP010,PosTargetXsortP010,PosTargetZsortP010,timebytrialP010,distMeanP010,distTargetP010,ID,PosXsortP010,PosZsortP010] =process(filename10,TrialNbr,TargetNbr,0,10,'Part010');
[TargetSimpleXP010,TargetSimpleZP010] = CalculCentreSimple(PosTargetXsortP010,PosTargetZsortP010,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP010,varAReelXP010,varAReelZP010,TargetNbr);
participantsID = [participantsID 10];

filename = 'Data/LogPart011Complete.txt';
[covaAReelP011,varAReelXP011,varAReelZP011,covaReelP011,varReelXP011,varReelZP011,covaIntP011,PosTargetXsortP011,PosTargetZsortP011,timebytrialP011,distMeanP011,distTargetP011,ID,PosXsortP011,PosZsortP011] =process(filename,TrialNbr,TargetNbr,0,10,'Part011');
[TargetSimpleXP011,TargetSimpleZP011] = CalculCentreSimple(PosTargetXsortP011,PosTargetZsortP011,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP011,varAReelXP011,varAReelZP011,TargetNbr);
participantsID = [participantsID 11];

filename = 'Data/LogPart012Complete.txt';
[covaAReelP012,varAReelXP012,varAReelZP012,covaReelP012,varReelXP012,varReelZP012,covaIntP012,PosTargetXsortP012,PosTargetZsortP012,timebytrialP012,distMeanP012,distTargetP012,ID,PosXsortP012,PosZsortP012] =process(filename,TrialNbr,TargetNbr,0,10,'Part012');
[TargetSimpleXP012,TargetSimpleZP012] = CalculCentreSimple(PosTargetXsortP012,PosTargetZsortP012,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP012,varAReelXP012,varAReelZP012,TargetNbr);
participantsID = [participantsID 12];

filename = 'Data/LogPart013Complete.txt';
[covaAReelP013,varAReelXP013,varAReelZP013,covaReelP013,varReelXP013,varReelZP013,covaIntP013,PosTargetXsortP013,PosTargetZsortP013,timebytrialP013,distMeanP013,distTargetP013,ID,PosXsortP013,PosZsortP013] =process(filename,TrialNbr,TargetNbr,0,10,'Part013');
[TargetSimpleXP013,TargetSimpleZP013] = CalculCentreSimple(PosTargetXsortP013,PosTargetZsortP013,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP013,varAReelXP013,varAReelZP013,TargetNbr);
participantsID = [participantsID 13];

filename = 'Data/LogPart014complete.txt';
[covaAReelP014,varAReelXP014,varAReelZP014,covaReelP014,varReelXP014,varReelZP014,covaIntP014,PosTargetXsortP014,PosTargetZsortP014,timebytrialP014,distMeanP014,distTargetP014,ID,PosXsortP014,PosZsortP014] =process(filename,TrialNbr,TargetNbr,0,10,'Part014');
[TargetSimpleXP014,TargetSimpleZP014] = CalculCentreSimple(PosTargetXsortP014,PosTargetZsortP014,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP014,varAReelXP014,varAReelZP014,TargetNbr);
participantsID = [participantsID 14];

filename = 'Data/LogPart015complete.txt';
[covaAReelP015,varAReelXP015,varAReelZP015,covaReelP015,varReelXP015,varReelZP015,covaIntP015,PosTargetXsortP015,PosTargetZsortP015,timebytrialP015,distMeanP015,distTargetP015,ID,PosXsortP015,PosZsortP015] =process(filename,TrialNbr,TargetNbr,0,10,'Part015');
[TargetSimpleXP015,TargetSimpleZP015] = CalculCentreSimple(PosTargetXsortP015,PosTargetZsortP015,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP015,varAReelXP015,varAReelZP015,TargetNbr);
participantsID = [participantsID 15];

filename = 'Data/LogPart016complete.txt';
[covaAReelP016,varAReelXP016,varAReelZP016,covaReelP016,varReelXP016,varReelZP016,covaIntP016,PosTargetXsortP016,PosTargetZsortP016,timebytrialP016,distMeanP016,distTargetP016,ID,PosXsortP016,PosZsortP016] =process(filename,TrialNbr,TargetNbr,0,10,'Part016');
[TargetSimpleXP016,TargetSimpleZP016] = CalculCentreSimple(PosTargetXsortP016,PosTargetZsortP016,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP016,varAReelXP016,varAReelZP016,TargetNbr);
participantsID = [participantsID 16];

filename = 'Data/LogPart017Complete.txt';
[covaAReelP017,varAReelXP017,varAReelZP017,covaReelP017,varReelXP017,varReelZP017,covaIntP017,PosTargetXsortP017,PosTargetZsortP017,timebytrialP017,distMeanP017,distTargetP017,ID,PosXsortP017,PosZsortP017] =process(filename,TrialNbr,TargetNbr,0,10,'Part017');
[TargetSimpleXP017,TargetSimpleZP017] = CalculCentreSimple(PosTargetXsortP017,PosTargetZsortP017,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP017,varAReelXP017,varAReelZP017,TargetNbr);
participantsID = [participantsID 17];

filename = 'Data/LogPart018Complete.txt';
[covaAReelP018,varAReelXP018,varAReelZP018,covaReelP018,varReelXP018,varReelZP018,covaIntP018,PosTargetXsortP018,PosTargetZsortP018,timebytrialP018,distMeanP018,distTargetP018,ID,PosXsortP018,PosZsortP018] =process(filename,TrialNbr,TargetNbr,0,10,'Part018');
[TargetSimpleXP018,TargetSimpleZP018] = CalculCentreSimple(PosTargetXsortP018,PosTargetZsortP018,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP018,varAReelXP018,varAReelZP018,TargetNbr);
participantsID = [participantsID 18];

filename = 'Data/LogPart019Complete.txt';
[covaAReelP019,varAReelXP019,varAReelZP019,covaReelP019,varReelXP019,varReelZP019,covaIntP019,PosTargetXsortP019,PosTargetZsortP019,timebytrialP019,distMeanP019,distTargetP019,ID,PosXsortP019,PosZsortP019] =process(filename,TrialNbr,TargetNbr,0,10,'Part019');
[TargetSimpleXP019,TargetSimpleZP019] = CalculCentreSimple(PosTargetXsortP019,PosTargetZsortP019,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP019,varAReelXP019,varAReelZP019,TargetNbr);
participantsID = [participantsID 19];

filename = 'Data/LogPart020Complete.txt';
[covaAReelP020,varAReelXP020,varAReelZP020,covaReelP020,varReelXP020,varReelZP020,covaIntP020,PosTargetXsortP020,PosTargetZsortP020,timebytrialP020,distMeanP020,distTargetP020,ID,PosXsortP020,PosZsortP020] =process(filename,TrialNbr,TargetNbr,0,10,'Part020');
[TargetSimpleXP020,TargetSimpleZP020] = CalculCentreSimple(PosTargetXsortP020,PosTargetZsortP020,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP020,varAReelXP020,varAReelZP020,TargetNbr);
participantsID = [participantsID 20];

filename = 'Data/LogPart021Complete.txt';
[covaAReelP021,varAReelXP021,varAReelZP021,covaReelP021,varReelXP021,varReelZP021,covaIntP021,PosTargetXsortP021,PosTargetZsortP021,timebytrialP021,distMeanP021,distTargetP021,ID,PosXsortP021,PosZsortP021] =process(filename,TrialNbr,TargetNbr,0,10,'Part021');
[TargetSimpleXP021,TargetSimpleZP021] = CalculCentreSimple(PosTargetXsortP021,PosTargetZsortP021,TrialNbr,TargetNbr);
[VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelP021,varAReelXP021,varAReelZP021,TargetNbr);
participantsID = [participantsID 21];



%% data process for sophia
% TargetNbr = 7;
% TrialNbr = 20;
% xStartingPos = 0.1059495;
% yStartingPos = 0.8128;
% xCubeCenter = 0.1599109;
% yCubeCenter = 1.211317;
% 
% [calibX,calibY] = changementDeRepere(xCubeCenter,yCubeCenter,xStartingPos,yStartingPos,xCubeCenter,yCubeCenter);
% % data recuperation 
% filename = 'Data/Sophia_cond1et2_expe1 (1).txt';
% [C_header,C_posCenter,Data] = lireDataExpe1sophia(filename);
% 
%     
% PosX = Data(:,4);
% PosY = Data(:,5);
% PosZ = Data(:,6);
% Target = Data(:,11);
% Condition = Data(:,12);
% PosTargetX = Data(:,15);
% PosTargetY = Data(:,16);    
% PosTargetZ = Data(:,17);
% % sorting data by target and condition
% 
% [PosXsort,PosZsort] = organise(PosX, PosY, PosZ,Target,Condition,TargetNbr,TrialNbr);
% 
% [PosTargetXsort,PosTargetZsort] = organise(PosTargetX, PosTargetY, PosTargetZ,Target,Condition,TargetNbr,TrialNbr);
% 
% 
% [origineX,origineY] = changementDeRepereS(xStartingPos,yStartingPos,xStartingPos,yStartingPos,PosTargetXsort(1,1),PosTargetZsort(1,1));
% [PosXsort,PosZsort] = changementDeRepereS(PosXsort,PosZsort,PosTargetXsort(21,1),PosTargetZsort(21,1),PosTargetXsort(1,1),PosTargetZsort(1,1));
% [PosTargetXsort,PosTargetZsort] = changementDeRepereS(PosTargetXsort,PosTargetZsort,PosTargetXsort(21,1),PosTargetZsort(21,1),PosTargetXsort(1,1),PosTargetZsort(1,1));
% 
% 
% % calcul variance unidemensionnel and center
% 
% [varX,varZ,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,cova2] = varianceCorrRhoTheta(PosXsort,PosZsort,TargetNbr,TrialNbr,1000);
% 
%% plot globale puis unimodale
% % % ScatterPlotCondition123(PosXsort,PosZsort,PosTargetXsort,PosTargetZsort,TrialNbr,TargetNbr,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,20,'SophiaExpe1');
% [covaAReelS,varAReelXS,varAReelZS,covaReelS,varReelXS,varReelZS] = DistributionUnimodale(PosTargetXsort,PosTargetZsort,PosXsort,PosZsort,TargetNbr,TrialNbr,100);
% [VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL] = ConcatenVariable(VarXP,VarXV,VarYP,VarXL,VarYL,VarYV,CovaP,CovaV,CovaL,sumVarXP,sumVarXV,sumVarYP,sumVarXL,sumVarYL,sumVarYV,sumCovaP,sumCovaV,sumCovaL,covaAReelS,varAReelXS,varAReelZS,TargetNbr);
% % 
% 
varSommeX = (varReelXP010 +varReelXP011+varReelXP012+varReelXP013+varReelXP014+varReelXP015+varReelXP016+varReelXP017+varReelXP018+varReelXP019+varReelXP020+varReelXP021)/12;

varSommeZ = (varReelZP010 +varReelZP011+varReelZP012+varReelZP013+varReelZP014+varReelZP015+varReelZP016+varReelZP017+varReelZP018+varReelZP019+varReelZP020+varReelZP021)/12;
covaSomme = (covaReelP010 +covaReelP011+covaReelP012+covaReelP013+covaReelP014+covaReelP015+covaReelP016+covaReelP017+covaReelP018+covaReelP019+covaReelP020+covaReelP021)/12;

varASommeX = (varAReelXP010 +varAReelXP011+varAReelXP012+varAReelXP013+varAReelXP014+varAReelXP015+varAReelXP016+varAReelXP017+varAReelXP018+varAReelXP019+varAReelXP020+varAReelXP021)/12;
varASommeZ = (varAReelZP010 +varAReelZP011+varAReelZP012+varAReelZP013+varAReelZP014+varAReelZP015+varAReelZP016+varAReelZP017+varAReelZP018+varAReelZP019+varAReelZP020+varAReelZP021)/12;
covaASomme = (covaReelP010 +covaReelP011+covaReelP012+covaReelP013+covaReelP014+covaReelP015+covaReelP016+covaReelP017+covaReelP018+covaReelP019+covaReelP020+covaReelP021)/12;

% PlotNouvelleDistriGlo(covaSomme,varSommeX,varSommeZ,PosTargetXsortP010,PosTargetZsortP010,PosTargetXsortP010,PosTargetZsortP010,TargetNbr,TrialNbr,40,'AverageParticipant','');
% PlotNouvelleDistriGlo(covaASomme,varASommeX,varASommeZ,PosTargetXsortP010,PosTargetZsortP010,PosTargetXsortP010,PosTargetZsortP010,TargetNbr,TrialNbr,50,'AverageParticipant',' avec correction');

% 
% % % PlotNouvelleDistri(covaAReelS,varAReelXS,varAReelZS,Xcenter,Zcenter,PosTargetXsort,PosTargetZsort,TargetNbr,TrialNbr,30);
% % % theta = calculTheta(0,0);
%% plot diagramme bar des variances et covariance comparé entre les conditions
%%calcul des matrices de covariance selon le depth et azimuth
VarDepthP = [];
VarAzimuthP = [];
VarDepthL = [];
VarAzimuthL = [];
VarDepthV = [];
VarAzimuthV = [];
CovaDPP = [];
CovaDPL = [];
CovaDPV = [];
for i = 1:1:TargetNbr
    [rien,taille] = size(VarXP);

    Varminp = 0;
    Varmaxp = 0;
    for k = 1:1:taille
        [VarDepthP(i,k),VarAzimuthP(i,k),CovaDPP(i,k)] = DepthAzimuthVariance(PosTargetXsortP010((i-1)*TrialNbr +1),PosTargetZsortP010((i-1)*TrialNbr +1),[VarXP(i,k) CovaP(i,k);CovaP(i,k) VarYP(i,k)]);
        [VarDepthL(i,k),VarAzimuthL(i,k),CovaDPL(i,k)] = DepthAzimuthVariance(PosTargetXsortP010((i-1)*TrialNbr +1),PosTargetZsortP010((i-1)*TrialNbr +1),[VarXL(i,k) CovaL(i,k);CovaL(i,k) VarYL(i,k)]);
        [VarDepthV(i,k),VarAzimuthV(i,k),CovaDPV(i,k)] = DepthAzimuthVariance(PosTargetXsortP010((i-1)*TrialNbr +1),PosTargetZsortP010((i-1)*TrialNbr +1),[VarXV(i,k) CovaV(i,k);CovaV(i,k) VarYV(i,k)]);

    end
end   
    
% figure
% for i = 1:1:TargetNbr
%        
%     errlow = [min(VarDepthP(i,:)) min(VarDepthL(i,:)) min(VarDepthV(i,:))];
%     errhigh = [max(VarDepthP(i,:)) max(VarDepthL(i,:)) max(VarDepthV(i,:))];
%     Xbar = categorical({'PR','PL','Vi'});
%     Xbar = reordercats(Xbar,{'PR','PL','Vi'});
%     Ybar = [sum(VarDepthP(i,:)),sum(VarDepthL(i,:)) ,sum(VarDepthV(i,:))];
%     subplot(7,2,2*(i-1)+1)
%     bar(Xbar,Ybar)
%     ylim([0 0.001])
%     hold on
%     er = errorbar(Xbar,Ybar,errlow,errhigh); 
%     title(strcat('target',num2str(i)));
% end
% for i = 1:1:TargetNbr
%     errlow = [min(VarAzimuthP(i,:)) min(VarAzimuthL(i,:)) min(VarAzimuthV(i,:))];
%     errhigh = [max(VarAzimuthP(i,:)) max(VarAzimuthL(i,:)) max(VarAzimuthV(i,:))];
%     Xbar = categorical({'PR','PL','Vi'});
%     Xbar = reordercats(Xbar,{'PR','PL','Vi'});
%     Ybar = [sum(VarAzimuthP(i,:)),sum(VarAzimuthL(i,:)) ,sum(VarAzimuthV(i,:))];
%     subplot(7,2,2*(i-1)+2)
%     bar(Xbar,Ybar)
%     ylim([0 0.001])
%     hold on
%     er = errorbar(Xbar,Ybar,errlow,errhigh); 
%     title(strcat('target',num2str(i)));
% end
% for i = 1:1:TargetNbr
%     errlow = [min(CovaP(i,:)) min(CovaL(i,:)) min(CovaV(i,:))];
%     errhigh = [max(CovaP(i,:)) max(CovaL(i,:)) max(CovaV(i,:))];
%     Xbar = categorical({'PR','PL','Vi'});
%     Xbar = reordercats(Xbar,{'PR','PL','Vi'});
%     Ybar = [covaASomme(i),covaASomme(TargetNbr+i),covaASomme(2*TargetNbr+i)];
%     subplot(7,3,3*(i-1)+3)
%     bar(Xbar,Ybar)
%     hold on
%     er = errorbar(Xbar,Ybar,errlow,errhigh); 
%     title(strcat('target',num2str(i)));
% end
% 
% sgtitle('variance according to the direction x and y and covariance for the different condition');

%% plot des moyennes des variances selon R dans les trois conditions
% figure
% errlow = [min(VarXP(1,:)) min(VarXP(2,:)) min(VarXP(3,:)) min(VarXP(4,:))];
% errhigh = [max(VarXP(1,:)) max(VarXP(2,:)) max(VarXP(3,:)) max(VarXP(4,:))];
% Xbar = categorical({num2str(TargetSimpleZP010(1)),num2str(TargetSimpleZP010(2)),num2str(TargetSimpleZP010(3)),num2str(TargetSimpleZP010(4))});
% Xbar = reordercats(Xbar,{num2str(TargetSimpleZP010(1)),num2str(TargetSimpleZP010(2)),num2str(TargetSimpleZP010(3)),num2str(TargetSimpleZP010(4))});
% 
% Ybar = [varASommeX(1),varASommeX(2),varASommeX(3),varASommeX(4)];
% bar(Xbar,Ybar)
% hold on
% er = errorbar(Xbar,Ybar,errlow,errhigh); 
% title('evolution de la variance selon X par rapport à la distance à l''origine');

% participantsID = [participantsID]; 
% SommeVarPlot(sumVarXP,sumVarXV,sumVarYP,sumVarYV,sumCovaP,sumCovaV,TargetSimpleXP010,TargetSimpleZP010,participantsID,TargetNbr,TrialNbr)
% % %% plot des distributions unimodales interpolé
% % AIRE = [];
% % indicex = 0;
% % k = 5.991;
% % pas = 0.02;
% % mini = 0;
% % maxi = 0.4;
% % % VisuFinal2D(k,pas,mini,maxi,PosTargetXsortF,PosTargetZsortF,varSommeX(1:7),varSommeZ(1:7),covaSomme(1:7),TrialNbr)
% % %% ANOVA 
% % % annovaFla(VarDepthP,VarAzimuthP,VarDepthL,VarAzimuthL,VarDepthV,VarAzimuthV,CovaDPP,CovaDPL,CovaDPV,TargetNbr,TargetSimpleXF,TargetSimpleZF)

% variance Depth selon r pour les 3 modalités
% 
% 
% figure
% subplot(3,1,1)
% A = sum(VarDepthP')';
% coeffVR1 = sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2)\A(1:4);
% scatter(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4));
% title('Depth Variance Proprioceptive Right');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarDepthP(1,:)) min(VarDepthP(2,:)) min(VarDepthP(3,:)) min(VarDepthP(4,:))];
% errhigh = [max(VarDepthP(1,:)) max(VarDepthP(2,:)) max(VarDepthP(3,:)) max(VarDepthP(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.003])
% c = polyfit(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4,1),1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2));
% plot(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarDepthL')';
% coeffVR2 = sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2)\A(1:4);
% scatter(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4));
% title('Depth Variance Proprioceptive Left');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarDepthL(1,:)) min(VarDepthL(2,:)) min(VarDepthL(3,:)) min(VarDepthL(4,:))];
% errhigh = [max(VarDepthL(1,:)) max(VarDepthL(2,:)) max(VarDepthL(3,:)) max(VarDepthL(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.003])
% c = polyfit(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4,1),1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2));
% plot(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarDepthV')';
% coeffVR3 = sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2)\A(1:4);
% scatter(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4));
% title('Depth Variance Visual');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarDepthV(1,:)) min(VarDepthV(2,:)) min(VarDepthV(3,:)) min(VarDepthV(4,:))];
% errhigh = [max(VarDepthV(1,:)) max(VarDepthV(2,:)) max(VarDepthV(3,:)) max(VarDepthV(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.003])
% c = polyfit(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4,1),1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2));
% plot(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% saveas(gcf,'varianceDepthSelonrPourLes3modalités','svg');
% export_fig('varianceDepthSelonrPourLes3modalités.pdf'); 
% 
% 
% % variance Azimuth selon r pour les 3 modalités
% figure
% subplot(3,1,1)
% A = sum(VarAzimuthP')';
% scatter(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4));
% coeffVA1 = sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2)\A(1:4);
% c = polyfit(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2));
% title('Azimuth Variance Proprioceptive Right');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthP(1,:)) min(VarAzimuthP(2,:)) min(VarAzimuthP(3,:)) min(VarAzimuthP(4,:))];
% errhigh = [max(VarAzimuthP(1,:)) max(VarAzimuthP(2,:)) max(VarAzimuthP(3,:)) max(VarAzimuthP(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.00145])
% hold on
% plot(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarAzimuthL')';
% coeffVA2 = sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2)\A(1:4);
% scatter(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4,1),1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2));
% title('Azimuth Variance Proprioceptive Left');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthL(1,:)) min(VarAzimuthL(2,:)) min(VarAzimuthL(3,:)) min(VarAzimuthL(4,:))];
% errhigh = [max(VarAzimuthL(1,:)) max(VarAzimuthL(2,:)) max(VarAzimuthL(3,:)) max(VarAzimuthL(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.00145])
% plot(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarAzimuthV')';
% coeffVA3 = sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2)\A(1:4);
% scatter(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4,1),1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2));
% title('Azimuth Variance Visual');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthV(1,:)) min(VarAzimuthV(2,:)) min(VarAzimuthV(3,:)) min(VarAzimuthV(4,:))];
% errhigh = [max(VarAzimuthV(1,:)) max(VarAzimuthV(2,:)) max(VarAzimuthV(3,:)) max(VarAzimuthV(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.00145])
% plot(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% saveas(gcf,'varianceAzimuthSelonrPourLes3modalités','svg');
% export_fig('varianceAzimuthSelonrPourLes3modalités.pdf'); 
% %% variance azimuth selon theta 3 modalités
% figure
% Theta = [0 0 0 0 30 45 60]';
% ThetaRad = Theta*2*pi/360;
% subplot(3,1,1)
% A = sum(VarAzimuthP')';
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% coeffVAT1 = ThetaRad(4:7)\[A(3);A(5:7)];
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Azimuth Variance Proprioceptive Right');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthP(1,:)) min(VarAzimuthP(2,:)) min(VarAzimuthP(3,:)) min(VarAzimuthP(4,:))];
% errhigh = [max(VarAzimuthP(1,:)) max(VarAzimuthP(2,:)) max(VarAzimuthP(3,:)) max(VarAzimuthP(4,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.00145])
% hold on
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarAzimuthL')';
% coeffVAT2 = ThetaRad(4:7)\[A(3);A(5:7)];
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Azimuth Variance Proprioceptive Left');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthL(1,:)) min(VarAzimuthL(2,:)) min(VarAzimuthL(3,:)) min(VarAzimuthL(4,:))];
% errhigh = [max(VarAzimuthL(1,:)) max(VarAzimuthL(2,:)) max(VarAzimuthL(3,:)) max(VarAzimuthL(4,:))];
% er = errorbar(ThetaRad(4:7),A(1:4),errlow,errhigh);
% ylim([0 0.00145])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarAzimuthV')';
% coeffVAT3 = ThetaRad(4:7)\[A(3);A(5:7)];
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Depth Variance Visual');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthV(1,:)) min(VarAzimuthV(2,:)) min(VarAzimuthV(3,:)) min(VarAzimuthV(4,:))];
% errhigh = [max(VarAzimuthV(1,:)) max(VarAzimuthV(2,:)) max(VarAzimuthV(3,:)) max(VarAzimuthV(4,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.00145])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% saveas(gcf,'varianceAzimuthSelonrPourLes3modalités','svg');
% export_fig('varianceAzimuthSelonrPourLes3modalités.pdf'); 
% 
% %% variance depth selon theta 3 modalités
% figure
% Theta = [0 0 0 0 30 45 60]';
% ThetaRad = Theta*2*pi/360;
% subplot(3,1,1)
% A = sum(VarDepthP')';
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% coeffVDT1 = ThetaRad(4:7)\[A(3);A(5:7)];
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Azimuth Variance Proprioceptive Right');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthP(1,:)) min(VarAzimuthP(2,:)) min(VarAzimuthP(3,:)) min(VarAzimuthP(4,:))];
% errhigh = [max(VarAzimuthP(1,:)) max(VarAzimuthP(2,:)) max(VarAzimuthP(3,:)) max(VarAzimuthP(4,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.003])
% hold on
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarDepthL')';
% coeffVDT2 = ThetaRad(4:7)\[A(3);A(5:7)];
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Depth Variance Proprioceptive Left');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthL(1,:)) min(VarAzimuthL(2,:)) min(VarAzimuthL(3,:)) min(VarAzimuthL(4,:))];
% errhigh = [max(VarAzimuthL(1,:)) max(VarAzimuthL(2,:)) max(VarAzimuthL(3,:)) max(VarAzimuthL(4,:))];
% er = errorbar(ThetaRad(4:7),A(1:4),errlow,errhigh);
% ylim([0 0.003])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarDepthV')';
% coeffVDT3 = ThetaRad(4:7)\[A(3);A(5:7)];
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Depth Variance Visual');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthV(1,:)) min(VarAzimuthV(2,:)) min(VarAzimuthV(3,:)) min(VarAzimuthV(4,:))];
% errhigh = [max(VarAzimuthV(1,:)) max(VarAzimuthV(2,:)) max(VarAzimuthV(3,:)) max(VarAzimuthV(4,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.003])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% saveas(gcf,'varianceAzimuthSelonrPourLes3modalités','svg');
% export_fig('varianceAzimuthSelonrPourLes3modalités.pdf'); 

%% evaluation du temps moyen par rapport à la precision pour les 3 conditions
% meanTemps =  [mean(timebytrialP010(1:TrialNbr*TargetNbr)) mean(timebytrialP011(1:TrialNbr*TargetNbr))...
%     mean(timebytrialP012(1:TrialNbr*TargetNbr)) mean(timebytrialP013(1:TrialNbr*TargetNbr)) ...
%     mean(timebytrialP014(1:TrialNbr*TargetNbr)) mean(timebytrialP015(1:TrialNbr*TargetNbr)) ...
%     mean(timebytrialP016(1:TrialNbr*TargetNbr)) mean(timebytrialP017(1:TrialNbr*TargetNbr)) ...
%     mean(timebytrialP018(1:TrialNbr*TargetNbr)) mean(timebytrialP019(1:TrialNbr*TargetNbr)) ...
%     mean(timebytrialP020(1:TrialNbr*TargetNbr)) mean(timebytrialP021(1:TrialNbr*TargetNbr));
%     mean(timebytrialP010(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(timebytrialP011(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr))...
%     mean(timebytrialP012(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(timebytrialP013(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(timebytrialP014(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(timebytrialP015(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(timebytrialP016(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(timebytrialP017(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(timebytrialP018(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(timebytrialP019(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(timebytrialP020(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(timebytrialP021(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr));mean(timebytrialP010(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(timebytrialP011(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1))...
%     mean(timebytrialP012(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(timebytrialP013(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(timebytrialP014(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(timebytrialP015(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(timebytrialP016(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(timebytrialP017(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(timebytrialP018(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(timebytrialP019(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(timebytrialP020(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(timebytrialP021(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1))];
% meanDist =  [mean(distTargetP010(1:TrialNbr*TargetNbr)) mean(distTargetP011(1:TrialNbr*TargetNbr))...
%     mean(distTargetP012(1:TrialNbr*TargetNbr)) mean(distTargetP013(1:TrialNbr*TargetNbr)) ...
%     mean(distTargetP014(1:TrialNbr*TargetNbr)) mean(distTargetP015(1:TrialNbr*TargetNbr)) ...
%     mean(distTargetP016(1:TrialNbr*TargetNbr)) mean(distTargetP017(1:TrialNbr*TargetNbr)) ...
%     mean(distTargetP018(1:TrialNbr*TargetNbr)) mean(distTargetP019(1:TrialNbr*TargetNbr)) ...
%     mean(distTargetP020(1:TrialNbr*TargetNbr)) mean(distTargetP021(1:TrialNbr*TargetNbr));
%     mean(distTargetP010(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(distTargetP011(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr))...
%     mean(distTargetP012(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(distTargetP013(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(distTargetP014(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(distTargetP015(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(distTargetP016(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(distTargetP017(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(distTargetP018(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(distTargetP019(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) ...
%     mean(distTargetP020(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr)) mean(distTargetP021(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr));mean(distTargetP010(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(distTargetP011(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1))...
%     mean(distTargetP012(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(distTargetP013(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(distTargetP014(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(distTargetP015(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(distTargetP016(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(distTargetP017(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(distTargetP018(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(distTargetP019(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) ...
%     mean(distTargetP020(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1)) mean(distTargetP021(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1))];
% 
% figure(50)
% scatter(meanTemps(1,:),meanDist(1,:))
% figure(51)
% scatter(meanTemps(2,:),meanDist(2,:))
% figure(53)
% scatter(meanTemps(3,:),meanDist(3,:))
% 
% figure
% subplot(3,1,1)
% A = sum(VarXP')'/12;
% scatter(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),1);
% coeffPRX = c(1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2));
% title('Variance X Proprioceptive Right');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarXP(1,:)) min(VarXP(2,:)) min(VarXP(3,:)) min(VarXP(4,:))];
% errhigh = [max(VarXP(1,:)) max(VarXP(2,:)) max(VarXP(3,:)) max(VarXP(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.0005])
% hold on
% plot(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarXL')'/12;
% scatter(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4,1),1);
% coeffPLX = c(1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2));
% title('Variance X Proprioceptive Left');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarXL(1,:)) min(VarXL(2,:)) min(VarXL(3,:)) min(VarXL(4,:))];
% errhigh = [max(VarXL(1,:)) max(VarXL(2,:)) max(VarXL(3,:)) max(VarXL(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.0005])
% plot(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarXV')'/12;
% scatter(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4,1),1);
% coeffVX = c(1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2));
% title('Variance X Visual');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarXV(1,:)) min(VarXV(2,:)) min(VarXV(3,:)) min(VarXV(4,:))];
% errhigh = [max(VarXV(1,:)) max(VarXV(2,:)) max(VarXV(3,:)) max(VarXV(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.0005])
% plot(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% saveas(gcf,'varianceXSelonrPourLes3modalités','svg');
% export_fig('varianceXSelonrPourLes3modalités.pdf'); 
% 
% figure
% subplot(3,1,1)
% A = sum(VarYP')'/12;
% scatter(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),1);
% coeffPRY = c(1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2));
% title('Variance Y Proprioceptive Right');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarYP(1,:)) min(VarYP(2,:)) min(VarYP(3,:)) min(VarYP(4,:))];
% errhigh = [max(VarYP(1,:)) max(VarYP(2,:)) max(VarYP(3,:)) max(VarYP(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.0005])
% hold on
% plot(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarYL')'/12;
% scatter(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4,1),1);
% coeffPLY = c(1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2));
% title('Variance Y Proprioceptive Left');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarYL(1,:)) min(VarYL(2,:)) min(VarYL(3,:)) min(VarYL(4,:))];
% errhigh = [max(VarYL(1,:)) max(VarYL(2,:)) max(VarYL(3,:)) max(VarYL(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.0005])
% plot(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarYV')'/12;
% scatter(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4));
% c = polyfit(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4,1),1);
% coeffVY = c(1);
% y_est = polyval(c,sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2));
% title('Variance Y Visual');
% xlabel('distance (r in m)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarYV(1,:)) min(VarYV(2,:)) min(VarYV(3,:)) min(VarYV(4,:))];
% errhigh = [max(VarYV(1,:)) max(VarYV(2,:)) max(VarYV(3,:)) max(VarYV(4,:))];
% er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
% ylim([0 0.0005])
% plot(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
% saveas(gcf,'varianceYSelonrPourLes3modalités','svg');
% export_fig('varianceYSelonrPourLes3modalités.pdf'); 
% 
% %% variance X selon theta 3 modalités
% figure
% Theta = [90 90 90 90 70 50 30]';
% ThetaRad = Theta*2*pi/360;
% subplot(3,1,1)
% A = sum(VarXP')'/12;
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% coeffPRXT = c(1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Variance X Proprioceptive Right');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarXP(3,:)) min(VarXP(5,:)) min(VarXP(6,:)) min(VarXP(7,:))];
% errhigh = [max(VarXP(3,:)) max(VarXP(5,:)) max(VarXP(6,:)) max(VarXP(7,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.0005])
% hold on
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarXL')'/12;
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% coeffPLXT = c(1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Variance X Proprioceptive Left');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarXL(3,:)) min(VarXL(5,:)) min(VarXL(6,:)) min(VarXL(7,:))];
% errhigh = [max(VarXL(3,:)) max(VarXL(5,:)) max(VarXL(6,:)) max(VarXL(7,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.0005])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarXV')'/12;
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% coeffVXT = c(1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Variance X Visual');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarXV(3,:)) min(VarXV(5,:)) min(VarXV(6,:)) min(VarXV(7,:))];
% errhigh = [max(VarXV(3,:)) max(VarXV(5,:)) max(VarXV(6,:)) max(VarXV(7,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.0005])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% saveas(gcf,'varianceXSelonThetaPourLes3modalités','svg');
% export_fig('varianceXSelonThetaPourLes3modalités.pdf'); 
% 
% %% variance Y selon theta 3 modalités
% figure
% Theta = [90 90 90 90 70 50 30]';
% ThetaRad = Theta*2*pi/360;
% subplot(3,1,1)
% A = sum(VarYP')'/12;
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% coeffPRYT = c(1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Variance Y Proprioceptive Right');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarAzimuthP(1,:)) min(VarAzimuthP(2,:)) min(VarAzimuthP(3,:)) min(VarAzimuthP(4,:))];
% errhigh = [max(VarAzimuthP(1,:)) max(VarAzimuthP(2,:)) max(VarAzimuthP(3,:)) max(VarAzimuthP(4,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.0005])
% hold on
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,2)
% A = sum(VarYL')'/12;
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% coeffPLYT = c(1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Variance Y Proprioceptive Left');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarYL(3,:)) min(VarYL(5,:)) min(VarYL(6,:)) min(VarYL(7,:))];
% errhigh = [max(VarYL(3,:)) max(VarYL(5,:)) max(VarYL(6,:)) max(VarYL(7,:))];
% er = errorbar(ThetaRad(4:7),A(1:4),errlow,errhigh);
% ylim([0 0.0005])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% subplot(3,1,3)
% A = sum(VarYV')'/12;
% scatter(ThetaRad(4:7),[A(3);A(5:7)]);
% c = polyfit(ThetaRad(4:7),[A(3);A(5:7)],1);
% coeffVYT = c(1);
% y_est = polyval(c,ThetaRad(4:7));
% title('Variance Y Visual');
% xlabel('angle theta (rad)')
% ylabel('Variance (m²)')
% hold on
% errlow = [min(VarYV(3,:)) min(VarYV(5,:)) min(VarYV(6,:)) min(VarYV(7,:))];
% errhigh = [max(VarYV(3,:)) max(VarYV(5,:)) max(VarYV(6,:)) max(VarYV(7,:))];
% er = errorbar(ThetaRad(4:7),[A(3);A(5:7)],errlow,errhigh);
% ylim([0 0.0005])
% plot(ThetaRad(4:7),y_est,'r--','LineWidth',2)
% hold on 
% 
% saveas(gcf,'varianceYSelonThetaPourLes3modalités','svg');
% export_fig('varianceYSelonThetaPourLes3modalités.pdf'); 


%% export data to CSV
cHeader = {'ParticipantID(1to12)' 'condition(1to3)' 'Target(1to7)' 'Trial(1to20)' 'PosTargetX' 'PosTargetY' 'PosX' 'PosY'}
commaHeader = [cHeader;repmat({','},1,numel(cHeader))]; %insert commaas
commaHeader = commaHeader(:)';
textHeader = cell2mat(commaHeader); %cHeader in text with commas
textHeader = textHeader(1:end-1);%delet the last comma of the header
Data = zeros(5040,8);
ParticipantIDDD = ones(420,12).*(1:1:12);
Data(:,1) = ParticipantIDDD(:);
ConditionDDD = ones(140,3).*(1:1:3);
ConditionDDD = ConditionDDD(:);
ConditionDDD = ConditionDDD.*ones(420,12);
ConditionDDD = ConditionDDD(:);
Data(:,2) = ConditionDDD;
Target = ones(20,7).*(1:1:7);
Target = Target(:);
Target = Target.*ones(140,36);
Target = Target(:);
Data(:,3) = Target;
TrialDDD = repmat(1:1:20,3*7*12,1)';
TrialDDD = TrialDDD(:);
Data(:,4)=TrialDDD;

PosTargetX = [PosTargetXsortP010;PosTargetXsortP011;PosTargetXsortP012;PosTargetXsortP013;PosTargetXsortP014;PosTargetXsortP015;PosTargetXsortP016;PosTargetXsortP017;PosTargetXsortP018;PosTargetXsortP019;PosTargetXsortP020;PosTargetXsortP021];
PosTargetY = [PosTargetZsortP010;PosTargetZsortP011;PosTargetZsortP012;PosTargetZsortP013;PosTargetZsortP014;PosTargetZsortP015;PosTargetZsortP016;PosTargetZsortP017;PosTargetZsortP018;PosTargetZsortP019;PosTargetZsortP020;PosTargetZsortP021];
Data(:,5) = PosTargetX;
Data(:,6) = PosTargetY;
PosX = [PosXsortP010;PosXsortP011;PosXsortP012;PosXsortP013;PosXsortP014;PosXsortP015;PosXsortP016;PosXsortP017;PosXsortP018;PosXsortP019;PosXsortP020;PosXsortP021];
PosY = [PosZsortP010;PosZsortP011;PosZsortP012;PosZsortP013;PosZsortP014;PosZsortP015;PosZsortP016;PosZsortP017;PosZsortP018;PosZsortP019;PosZsortP020;PosZsortP021];
Data(:,7) = PosX;
Data(:,8) = PosY;

%write header to file
fid = fopen('Data1stExpe.csv','w'); 
fprintf(fid,'%s\n',textHeader)
fclose(fid)
%write data to end of file

dlmwrite('Data1stExpe.csv',Data,'-append');
% cswwrite("DataToFit",