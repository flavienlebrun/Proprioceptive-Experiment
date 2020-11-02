clear all
close all
%% load data
COVABeste = load('Data/COVAESTIFull','COVABest');
COVABesteAme = load('Data/COVAESTISAmelio','CovaBeste');
covaesti =COVABeste.COVABest;
covaamelio = COVABesteAme.CovaBeste; 

%% Angle applied
AngleOrdonne = [-0.174532900000000,-0.139626300000000,-0.104719800000000,-0.069813170000000,-0.034906580000000,0,0.034906580000000,0.069813170000000,0.104719800000000,0.139626300000000,0.174532900000000];
AngleOrdonne2 = [-0.139626300000000,-0.104719800000000,-0.069813170000000,-0.052359880000000,-0.017453290000000,0,0.017453290000000,0.052359880000000,0.069813170000000, 0.104719800000000,0.139626300000000];
AngleOrdonne3 = [-0.226892800000000,-0.174532900000000,-0.139626300000000,-0.104719800000000,-0.0872664700000000,-0.0698131700000000,-0.0349065800000000,0,0.0349065800000000,0.0698131700000000,0.0872664700000000,0.104719800000000,0.139626300000000,0.174532900000000,0.226892800000000];
AngleOrdonne4 = [-0.226892800000000,-0.1570796,-0.104719800000000,-0.0872664700000000,-0.0698131700000000,-0.05235988,-0.0349065800000000,0,0.0349065800000000,-0.05235988,0.0698131700000000,0.0872664700000000,0.104719800000000,0.1570796,0.226892800000000];
%% load the TargetNumber
TargetNumberGlobalConcatene = load('TargetNumberGlobal.mat','TargetNumberGlobal');
TargetNumberGlobal = TargetNumberGlobalConcatene.TargetNumberGlobal;
TargetNumberGlobal(1,8) = 1;
%% open file and get data in column vector
coeffsNeutralBg = [];
curveNeutralBg = [];
thresholdNeutralBg = [];
choiceOrganise = [];
statistiques = []; 
CHOICE = [];
ANGLE = [];
% participantsPasse = [10,11,12,13,14,15,17,18,19,20,21];
participantsPasse = [10,11,12,13,14,15,16,17,18,19,20,21];
Threshold = [];
Amplitude = [];


for i = 1:1:12
    k = participantsPasse(i);
    iStr = int2str(k);
    filename = strcat('Data/expe2Part0',iStr);
    filename = strcat(filename,'.txt');
    [coeffsNeutralBgi, curveNeutralBgi, thresholdNeutralBgi, choiceOrganisei,stati,TargetNumber,choice,angle] = processExpe2(filename,0);
    ANGLE = [ANGLE angle];
    statistiques = [statistiques;stati];
    Threshold = [Threshold;thresholdNeutralBgi];
    Amplitude = [Amplitude;(-thresholdNeutralBgi(3)+thresholdNeutralBgi(1))];
    coeffsNeutralBg = [coeffsNeutralBg coeffsNeutralBgi];
    curveNeutralBg = [curveNeutralBg curveNeutralBgi];
    thresholdNeutralBg = [thresholdNeutralBg thresholdNeutralBgi];
    TargetNumberGlobal = [TargetNumberGlobal TargetNumber];
    CHOICE = [CHOICE choice];
%     figure(i)
%     scatter(AngleOrdonne3,stati)
%     hold on
%     plot(curveNeutralBgi(:,1), curveNeutralBgi(:,2), 'LineStyle', '--')
%     xline(thresholdNeutralBgi(1))
%     xline(thresholdNeutralBgi(3))
%     titleStr = strcat('Psychometric fit for the 2AFC task','Part');
%     titleStr = strcat(titleStr,iStr);
%     title(titleStr,'FontSize',20)
%     xlabel('angle of redirection in radian','FontSize',16)
%     ylabel('percentage of answer right','FontSize',16)
%  
%     hold off
%     choiceOrganise = [choiceOrganise;choiceOrganisei];
%     
%     filesave = strcat('psychometricPassage1Part0',iStr);
%     saveas(gcf,filesave,'svg');
%     filesavePdf = strcat(filesave,'.pdf');
%     export_fig(filesavePdf);  
end
ThresholdByTarget = ones(12,4);
ThresholdLeft = ones(12,4);
ThresholdRight = ones(12,4);
participantTrieeParTarget = [10,11,12,13,14,15,16,17,18,19,20,21]
for i=1:1:12
    k = participantTrieeParTarget(i)-9
    choiceNew = CHOICE(:,k);
    angleNew = ANGLE(:,k);
    i
    for m=0:1:3 
         choiceParTarget = [];
         angleParTarget = [];
        for j=1:1:240
            if TargetNumberGlobal(j,k)==m
                choiceParTarget = [choiceParTarget;choiceNew(j)];
                angleParTarget = [angleParTarget;angleNew(j)];
            end
        end
        
        [choiceOrganiseT,statT] = organise2(choiceParTarget,angleParTarget,15,AngleOrdonne3);
        targets = [0.25, 0.5, 0.75]; % 25%, 50% and 75% performance
        weights = ones(15,1);
        [coeffsNeutralBg, ~, curveNeutralBg, thresholdNeutralBg] = ...
        FitPsycheCurveLogit(AngleOrdonne3, statT, weights, targets); 
        ThresholdByTarget(k,m+1) = thresholdNeutralBg(1)-thresholdNeutralBg(3);
        ThresholdLeft(k,m+1) = thresholdNeutralBg(3);
        ThresholdRight(k,m+1) = thresholdNeutralBg(1);
        figure(4*i+m)
        scatter(AngleOrdonne3,statT)
        hold on
        plot(curveNeutralBg(:,1), curveNeutralBg(:,2), 'LineStyle', '--')
        xline(thresholdNeutralBg(1))
        xline(thresholdNeutralBg(3))
        mStr = int2str(m+1);
        titleStr = strcat('Psychometric fit for the 2AFC task Target ',mStr);
        titleStr = strcat(titleStr,'Part0');
        iStr = int2str(participantTrieeParTarget(i));
        titleStr = strcat(titleStr,iStr)
        title(titleStr,'FontSize',20)
        xlabel('angle of redirection in radian','FontSize',16)
        ylabel('percentage of answer right','FontSize',16)
%      
%         hold off
%         filesave = strcat('psychometricPassage1Part0',iStr);
%         saveas(gcf,filesave,'svg');
%         filesavePdf = strcat(filesave,'.pdf');
%         export_fig(filesavePdf); 
    end
end
[coeffsNeutralBgi, curveNeutralBgi, thresholdNeutralBgi, choiceOrganisei,stati,TargetNumber,choice,angle] = processExpe2('Data/expe2Part021Passage2.txt',1);

%     coeffsNeutralBg = [coeffsNeutralBg coeffsNeutralBgi];
%     curveNeutralBg = [curveNeutralBg curveNeutralBgi];
%     thresholdNeutralBg = [thresholdNeutralBg thresholdNeutralBgi];
statistiques2 = [];
coeffsNeutralBg2 = [];
curveNeutralBg2 = [];
thresholdNeutralBg2 = [];
choiceOrganise2 = [];
participantsPasse = [12,15,17,18,19,21];
Amplitude2 = [];
Threshold2 = [];
ANGLE2 = [];
CHOICE2 = [];
for i = 1:1:6
    k = participantsPasse(i);
    iStr = int2str(k);
    filename = strcat('Data/expe2Part0',iStr);
    filename = strcat(filename,'Passage2');
    filename = strcat(filename,'.txt');
    [coeffsNeutralBgi, curveNeutralBgi, thresholdNeutralBgi, choiceOrganisei,stati,TargetNumber,choice,angle] = processExpe2(filename,1);
    statistiques2 = [statistiques2;stati];
    ANGLE2 = [ANGLE2 angle];
    Threshold2 = [Threshold2;thresholdNeutralBgi];
    Amplitude2 = [Amplitude2;(-thresholdNeutralBgi(3)+thresholdNeutralBgi(1))];
    coeffsNeutralBg2 = [coeffsNeutralBg coeffsNeutralBgi];
    curveNeutralBg2 = [curveNeutralBg curveNeutralBgi];
    thresholdNeutralBg2 = [thresholdNeutralBg thresholdNeutralBgi];

    CHOICE2 = [CHOICE2 choice];
%     figure(12+i)
%     scatter(AngleOrdonne4,stati)
%     hold on
%     plot(curveNeutralBgi(:,1), curveNeutralBgi(:,2), 'LineStyle', '--')
%     xline(thresholdNeutralBgi(1))
%     xline(thresholdNeutralBgi(3))
%     titleStr = strcat('Psychometric fit for the 2AFC task','Part');
%     titleStr = strcat(titleStr,iStr);
%     title(titleStr,'FontSize',20)
%     xlabel('angle of redirection in radian','FontSize',16)
%     ylabel('percentage of answer right','FontSize',16)
%     
%     hold off
%     filesave = strcat('psychometricPassage2Part0',iStr);
%     saveas(gcf,filesave,'svg');
%     filesavePdf = strcat(filesave,'.pdf');
%     export_fig(filesavePdf); 
end
%% psy for everybody
stat = [];
[lengthe,l] = size(choiceOrganise);
for k = 1:1:l
    stat(1,k) = sum(choiceOrganise(:,k))/lengthe;
end
nbrTarget = 15;
targets = [0.25, 0.5, 0.75]; % 25%, 50% and 75% performance
weights = ones(nbrTarget,1);


[coeffsNeutralBg, ~, curveNeutralBg, thresholdNeutralBg] = ...
FitPsycheCurveLogit(AngleOrdonne3, stat, weights, targets);

%% plot All

% figure(22)
% scatter(AngleOrdonne3,stat)
% hold on
% plot(curveNeutralBg(:,1), curveNeutralBg(:,2), 'LineStyle', '--')
% xline(thresholdNeutralBg(1))
% xline(thresholdNeutralBg(3))
% title('Psychometric fit for the 2AFC task All','FontSize',20)
% xlabel('angle of redirection in radian','FontSize',16)
% ylabel('percentage of answer right','FontSize',16)
% saveas(gcf,'Psychometric fit for the 2AFC task Globale','svg');
% export_fig('Psychometric fit for the 2AFC task Globale.pdf'); 
% 
% capacite = [];
% participantpasse = [1 2 3 4 5 6 7 8 9 10 11 12];
% VarVx = [];
% VarPx = [];
% for k=1:1:12
%     i = participantpasse(k);
%     varVx = exp(covaesti(i,1));
%     varPx = exp(covaesti(i,3));
%     rapport = varPx/varVx;
%     capacite = [capacite;rapport];
%     VarVx = [VarVx varVx]; 
%     VarPx = [VarPx varPx];
% end
% 
% figure(23)
% c = linspace(1,10,length([1:1:12]));
% scatter([1:1:11],capacite,[],c)
% title('ratio of Visual and Proprioceptive Variance for each participant')
% xlabel('participant')
% ylabel('ratio of Visual and Proprioceptive Variance')
% saveas(gcf,'ratioofVisualandProprioceptiveVarianceforeachparticipant','svg');
% export_fig('ratioofVisualandProprioceptiveVarianceforeachparticipant.pdf');
% 
% figure(24)
% c = linspace(1,10,length([1:1:12]));
% scatter([1:1:12],Amplitude,[],c)
% title('Amplitude of non detection for each participant')
% xlabel('participant')
% ylabel('Amplitude in rad')
% saveas(gcf,'Amplitudeofnondetectionforeachparticipant','svg');
% export_fig('Amplitudeofnondetectionforeachparticipant.pdf');

% 
% figure(25)
% c = linspace(1,10,length(capacite));
% scatter(capacite,Amplitude,[],c)
% title('Amplitude of non detection function of varVisual/varProprioceptive')
% xlabel('ratio of Visual and Proprioceptive Variance')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofvarVisualSurvarProprioceptive','svg');
% export_fig('AmplitudeofnondetectionfunctionofvarVisualSurvarProprioceptive.pdf');
% 
% 
% figure(26)
% c = linspace(1,10,length(VarVx));
% scatter(VarVx,Amplitude,[],c)
% title('Amplitude of non detection function of Visual variance')
% xlabel('Visual Variance m²')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofVisualvariance','svg');
% export_fig('AmplitudeofnondetectionfunctionofVisualvariance.pdf'); 
% 
% figure(27)
% c = linspace(1,10,length(VarPx));
% scatter(VarPx,Amplitude,[],c)
% title('Amplitude of non detection function of Proprioceptive variance')
% xlabel('Proprioceptive Variance m²')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofProprioceptivevariance','svg');
% export_fig('AmplitudeofnondetectionfunctionofProprioceptivevariance.pdf'); 
% 
DistanceP = [];
DistanceV = [];
Comparaison = [];
CovaPV = [];
CovaP = [];
CovaV = [];
for m=1:1:12
    DistancePi = [];
    DistanceVi = [];
    Comparaisoni = [];
    for R=0:0.01:1
        [distanceP,distanceV,covaPV,covaV,covaP] = calculDistance(0.05,R,0,covaesti,covaamelio,m);
        DistancePi = [DistancePi,distanceP];
        DistanceVi = [DistanceVi,distanceV];
        Comparaisoni = [Comparaisoni,(distanceP/distanceV)];
        
    end
    CovaPV = [CovaPV covaPV];
    CovaV = [CovaV covaV];
    CovaP = [CovaP covaP];
    DistanceP = [DistanceP;DistancePi];
    DistanceV = [DistanceV;DistanceVi];
    Comparaison = [Comparaison;Comparaisoni];

end
for m=1:1:12
    
    figure(m)
%     scatter([0:0.01:1],Comparaison(m,:))
    xlim([0 1])
    ylim([0 2])
end


SurfacePV = [];
SurfaceP = [];
SurfaceV = [];
for i=0:1:11
    surfacePV = CovaPV(1,2*i+1)*CovaPV(2,2*(i+1));
    surfaceP = CovaP(1,2*i+1)*CovaP(2,2*(i+1));
    surfaceV = CovaV(1,2*i+1)*CovaV(2,2*(i+1));
    SurfacePV = [SurfacePV;surfacePV];
    SurfaceP = [SurfaceP;surfaceP];
    SurfaceV = [SurfaceV;surfaceV]
end
% 
% figure(13)
% c = linspace(1,10,length(VarPx));
% scatter(SurfacePV,Amplitude,[],c)
% title('Amplitude of non detection function of integrated accuracy')
% xlabel('Surface of Variance m²')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofIntegratedAccuracy','svg');
% export_fig('AmplitudeofnondetectionfunctionofIntegratedAccuracy.pdf'); 
% 
% figure(14)
% scatter(SurfaceP,Amplitude,[],c)
% title('Amplitude of non detection function of proprioceptive accuracy')
% xlabel('Surface of Variance m²')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofProprioceptiveAccuracy','svg');
% export_fig('AmplitudeofnondetectionfunctionofProprioceptiveAccuracy.pdf'); 
% 
% figure(15)
% scatter(SurfaceP,Amplitude,[],c)
% title('Amplitude of non detection function of visual accuracy')
% xlabel('Surface of Variance m²')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofVisualAccuracy','svg');
% export_fig('AmplitudeofnondetectionfunctionofVisualAccuracy.pdf'); 

% figure(16)
% c = linspace(1,10,length(VarPx));
% scatter(Comparaison(:,101),Amplitude,[],c)
% title('Amplitude of non detection function of Proprio/Visual')
% xlabel('Comparaison of Variance')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofComparaison','svg');
% export_fig('AmplitudeofnondetectionfunctionofComparaison.pdf'); 
% xlim([1 1.5])
% ylim([0 0.22])

% Comparaison2 = [];
% participantsPasse = [12,15,17,18,19,21];
% Amplitude3 = [];
% for i=1:1:length(participantsPasse)
%     k = participantsPasse(i)-9;
%     Comparaison2 = [Comparaison2;Comparaison(k,101)];
%     Amplitude3 = [Amplitude3;(Amplitude2(i)+Amplitude(k))/2];
%     
% end
% long = length(participantsPasse);
% c = linspace(1,10,length([1:1:long]));
% figure(17)
% scatter(Comparaison2,Amplitude2,[],c)
% title('Amplitude 2 of non detection function of Proprio/Visual')
% xlabel('Comparaison of Variance')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofComparaison','svg');
% export_fig('AmplitudeofnondetectionfunctionofComparaison.pdf'); 
% xlim([1 1.5])
% ylim([0 0.22])
% 
% figure(18)
% scatter(Comparaison2,Amplitude3,[],c)
% title('Amplitude 2 of non detection function of Proprio/Visual')
% xlabel('Comparaison of Variance')
% ylabel('Amplitude in rad')
% saveas(gcf,'AmplitudeofnondetectionfunctionofComparaison','svg');
% export_fig('AmplitudeofnondetectionfunctionofComparaison.pdf'); 
% xlim([1 1.5])
% ylim([0 0.22])
% 
% 
% for m=1:1:12
%     DistancePi = [];
%     DistanceVi = [];
%     Comparaisoni = [];
%     for R=0:0.01:1
%         [distanceP,distanceV,covaPV,covaV,covaP] = calculDistance(0.05,R,0,covaesti,covaamelio,m);
%         DistancePi = [DistancePi,distanceP];
%         DistanceVi = [DistanceVi,distanceV];
%         Comparaisoni = [Comparaisoni,(distanceP/distanceV)];
%         
%     end
%     CovaPV = [CovaPV covaPV];
%     CovaV = [CovaV covaV];
%     CovaP = [CovaP covaP];
%     DistanceP = [DistanceP;DistancePi];
%     DistanceV = [DistanceV;DistanceVi];
%     Comparaison = [Comparaison;Comparaisoni];
% 
% end

%% write data to a csv
cHeader = {'ParticipantID(1to12)' 'Target(1to4)' 'Angle-' 'Angle+'}; %dummy header
commaHeader = [cHeader;repmat({','},1,numel(cHeader))]; %insert commaas
commaHeader = commaHeader(:)';
textHeader = cell2mat(commaHeader); %cHeader in text with commas
textHeader = textHeader(1:end-1);%delet the last comma of the header
Data = zeros(4*12,4);
Data(:,1) = repelem((1:1:12),4)';
TargetDDD = repmat((1:1:4),12,1)';

TargetDDD = TargetDDD(:);
Data(:,2) = TargetDDD; 
ThresholdLeft = ThresholdLeft';

Data(:,3) = ThresholdLeft(:);
ThresholdRight = ThresholdRight';
Data(:,4) = ThresholdRight(:);

%write header to file
fid = fopen('Data2ndExpe.csv','w'); 
fprintf(fid,'%s\n',textHeader)
fclose(fid)
%write data to end of file

dlmwrite('Data2ndExpe.csv',Data,'-append');