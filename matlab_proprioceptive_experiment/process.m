function[covaAReel,varAReelX,varAReelZ,covaReel,varReelX,varReelZ,covaInt,PosTargetXsort,PosTargetZsort,timebytrial,distMean,distTarget,participantID,PosXsort,PosZsort] =process(filename,TrialNbr,TargetNbr,corr,n,nomPDF)
nbrBootstrap = 100;
nomData = strcat(nomPDF,'.mat');
nomPdf = strcat(nomPDF,'.pdf');
[C_header,C_posCenter,Data] = lireDataExpe1(filename);
% continu = 0;
% i = 1;
% while(continu == 0)
%     if(Data(i,11)<4)
%         B = Data(1,:);
%         Data(1,:)  = Data(i,:);
%         Data(i,:) = B;
%         continu = 1;
%     end
%     i=i+1;
% end
% i = 1;
% while(continu == 0)
%     if(Data(i+140,11)<4)
%         B = Data(1+140,:);
%         Data(1+140,:)  = Data(i+140,:);
%         Data(i+140,:) = B;
%         continu = 1;
%     end
%     i=i+1;
% end
% i = 1;
% while(continu == 0)
%     if(Data(i+280,11)<4)
%         B = Data(1+280,:);
%         Data(1+280,:)  = Data(i+280,:);
%         Data(i+280,:) = B;
%         continu = 1;
%     end
%     i=i+1;
% end
participantID = Data(:,2)
DateLog = Data(:,3);    
PosX = Data(:,4);
PosY = Data(:,5);
PosZ = Data(:,6);
Target = Data(:,11);
Condition = Data(:,12);
if corr ==1
    Condition(141:280) = Condition(141:280,1) + ones(140,1);
end
TimeElapsed = Data(:,14);
PosTargetX = Data(:,15);
PosTargetY = Data(:,16);    
PosTargetZ = Data(:,17);
StartingPosX = Data(:,18);
StartingPosZ = Data(:,20);
CalibrationCubeX = Data(:,21);
CalibrationCubeZ = Data(:,23);
participantID = participantID(1);



%% sorting data by target and condition and changement de repère
[PosXsort,PosZsort] = organise(PosX, PosY, PosZ,Target,Condition,TargetNbr,TrialNbr);

[PosTargetXsort,PosTargetZsort] = organise(PosTargetX, PosTargetY, PosTargetZ,Target,Condition,TargetNbr,TrialNbr);

[origineX,origineY] = changementDeRepere(StartingPosX,StartingPosZ,StartingPosX,StartingPosZ,PosTargetX,PosTargetZ,Target,TargetNbr,TrialNbr);
[PosXsort,PosZsort] = changementDeRepere(PosXsort,PosZsort,StartingPosX,StartingPosZ,PosTargetX,PosTargetZ,Target,TargetNbr,TrialNbr);
[PosTargetXsort,PosTargetZsort] = changementDeRepere(PosTargetXsort,PosTargetZsort,StartingPosX,StartingPosZ,PosTargetX,PosTargetZ,Target,TargetNbr,TrialNbr);

% if participantID(1) == 11
%     a = 5
%     [PosXsort(1:140),PosZsort(1:140)] = changementDeRepere(PosXsort(1:140),PosZsort(1:140),StartingPosX(1:140),StartingPosZ(1:140),PosTargetX(1:140),PosTargetZ(1:140));
%     [PosXsort(141:280),PosZsort(141:280)] = changementDeRepere(PosXsort(141:280),PosZsort(141:280),StartingPosX(141:280),StartingPosZ(141:280),PosTargetX(141:280),PosTargetZ(141:280));
%     [PosXsort(281:420),PosZsort(281:420)] = changementDeRepere(PosXsort(281:420),PosZsort(281:420),StartingPosX(281:420),StartingPosZ(281:420),PosTargetX(281:420),PosTargetZ(281:420));
% 
% 
%     [PosTargetXsort(1:140),PosTargetZsort(1:140)] = changementDeRepere(PosTargetXsort(1:140),PosTargetZsort(1:140),StartingPosX(1:140),StartingPosZ(1:140),PosTargetX(1:140),PosTargetZ(1:140));
%     [PosTargetXsort(141:280),PosTargetZsort(141:280)] = changementDeRepere(PosTargetXsort(141:280),PosTargetZsort(141:280),StartingPosX(141:280),StartingPosZ(141:280),PosTargetX(141:280),PosTargetZ(141:280));
%     [PosTargetXsort(281:420),PosTargetZsort(281:420)] = changementDeRepere(PosTargetXsort(281:420),PosTargetZsort(281:420),StartingPosX(281:420),StartingPosZ(281:420),PosTargetX(281:420),PosTargetZ(281:420));
% 
% end


%% calcul variance unidemensionnel and center

[varX,varZ,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,cova2] = varianceCorrRhoTheta(PosXsort,PosZsort,TargetNbr,TrialNbr,nbrBootstrap);

%% filtrage des valeurs 
[PosXsort,PosZsort] = TriMahalanobisDistance(PosXsort,PosZsort,varX,varZ,cova,TrialNbr,TargetNbr,Xcenter,Zcenter);

% recalcul des variances,covariances et centres
[varX,varZ,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,cova2] = varianceCorrRhoTheta(PosXsort,PosZsort,TargetNbr,TrialNbr,nbrBootstrap);

%% calcul des nouvelles distributions
[covaAReel,varAReelX,varAReelZ,covaReel,varReelX,varReelZ] = DistributionUnimodale(PosTargetXsort,PosTargetZsort,PosXsort,PosZsort,TargetNbr,TrialNbr,nbrBootstrap);
%% interpolation de la variance multidimensionnelle pour n'importe qu'elle position de la surface


[Theta,covaInt] = VarianceInterpolationAllSurface(PosTargetXsort,PosTargetZsort,varAReelX(15:21),varAReelZ(15:21),covaAReel(15:21),0,0.3,'spline',TrialNbr);


%% Calcul des centres des target en simplifié
[TargetSimpleX,TargetSimpleZ] = CalculCentreSimple(PosTargetXsort,PosTargetZsort,TrialNbr,TargetNbr);



% %% log des données intéressante
% % variance X selon r pour les 3 modalités
% figure
% subplot(3,1,1)
% scatter(sqrt(TargetSimpleX(1:TargetNbr).^2+TargetSimpleZ(1:TargetNbr).^2),varX(1:TargetNbr));
% title('variance selon la direction x en fonction de r condition VTRH');
% xlabel('r(m)')
% ylabel('var x direction')
% subplot(3,1,2)
% scatter(sqrt(TargetSimpleX(TargetNbr+1:2*TargetNbr).^2+TargetSimpleZ(TargetNbr+1:2*TargetNbr).^2),varX(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction x en fonction de r condition VTLH');
% xlabel('r(m)')
% ylabel('var x direction')
% subplot(3,1,3)
% scatter(sqrt(TargetSimpleX(TargetNbr+1:2*TargetNbr).^2+TargetSimpleZ(TargetNbr+1:2*TargetNbr).^2),varX(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction x en fonction de r condition PTRH');
% xlabel('r(m)')
% ylabel('var x direction')
% export_fig(strcat(nomPDF,'VarX3CPRR.pdf')); 
% export_fig(nomPdf);
% 
% %% variance Z selon r pour les 3 modalités
% figure
% subplot(3,1,1)
% scatter(sqrt(TargetSimpleX(1:TargetNbr).^2+TargetSimpleZ(1:TargetNbr).^2),varZ(1:TargetNbr));
% title('variance selon la direction y en fonction de r condition VTRH');
% xlabel('r(m)')
% ylabel('var y direction')
% subplot(3,1,2)
% scatter(sqrt(TargetSimpleX(TargetNbr+1:2*TargetNbr).^2+TargetSimpleZ(TargetNbr+1:2*TargetNbr).^2),varZ(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction y en fonction de r condition VTLH');
% xlabel('r(m)')
% ylabel('var y direction')
% subplot(3,1,3)
% scatter(sqrt(TargetSimpleX(2*TargetNbr+1:3*TargetNbr).^2+TargetSimpleZ(2*TargetNbr+1:3*TargetNbr).^2),varZ(2*TargetNbr+1:3*TargetNbr));
% title('variance selon la direction y en fonction de r condition PTRH');
% xlabel('r(m)')
% ylabel('var y direction')
% export_fig(strcat(nomPDF,'VarY3CPRR.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'VarY3CPRR.pdf'))
% 
% %% variance X selon x pour les 3 modalités
% figure
% subplot(3,1,1)
% scatter(TargetSimpleZ(1:TargetNbr),varX(1:TargetNbr));
% title('variance selon la direction x en fonction de y condition VTRH');
% xlabel('x(m)')
% ylabel('var x direction')
% subplot(3,1,2)
% scatter(TargetSimpleZ(TargetNbr+1:2*TargetNbr),varX(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction x en fonction de y condition VTLH');
% xlabel('x(m)')
% ylabel('var x direction')
% subplot(3,1,3)
% scatter(TargetSimpleZ(TargetNbr+1:2*TargetNbr),varX(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction x en fonction de y condition PTRH');
% xlabel('x(m)')
% ylabel('var x direction')
% export_fig(strcat(nomPDF,'VarX3CPRX.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'VarX3CPRX.pdf'))

% %% variance Z selon x pour les 3 modalités
% figure
% subplot(3,1,1)
% scatter(TargetSimpleZ(1:TargetNbr),varZ(1:TargetNbr));
% title('variance selon la direction y en fonction de y condition VTRH');
% xlabel('x(m)')
% ylabel('var y direction')
% subplot(3,1,2)
% scatter(TargetSimpleZ(TargetNbr+1:2*TargetNbr),varZ(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction y en fonction de y condition VTLH');
% xlabel('x(m)')
% ylabel('var y direction')
% subplot(3,1,3)
% scatter(TargetSimpleZ(2*TargetNbr+1:3*TargetNbr),varZ(2*TargetNbr+1:3*TargetNbr));
% title('variance selon la direction y en fonction de y condition PTRH');
% xlabel('x(m)')
% ylabel('var y direction')
% 
% export_fig(strcat(nomPDF,'VarY3CPRX.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'VarY3CPRX.pdf'))
% %% Covariance selon r pour les 3 modalités
% figure
% subplot(3,1,1)
% scatter(sqrt(TargetSimpleX(1:TargetNbr).^2+TargetSimpleZ(1:TargetNbr).^2),cova2(1:TargetNbr));
% title('Covariance fonction de r condition VTRH');
% xlabel('r(m)')
% ylabel('covariance')
% subplot(3,1,2)
% scatter(sqrt(TargetSimpleX(TargetNbr+1:2*TargetNbr).^2+TargetSimpleZ(TargetNbr+1:2*TargetNbr).^2),cova2(TargetNbr+1:2*TargetNbr));
% title('Covariance en fonction de r condition VTLH');
% xlabel('r(m)')
% ylabel('covariance')
% subplot(3,1,3)
% scatter(sqrt(TargetSimpleX(TargetNbr+1:2*TargetNbr).^2+TargetSimpleZ(TargetNbr+1:2*TargetNbr).^2),cova2(TargetNbr+1:2*TargetNbr));
% title('Covariance en fonction de r condition PTRH');
% xlabel('r(m)')
% ylabel('covariance')
% export_fig(strcat(nomPDF,'Cova3CPRR.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'Cova3CPRR.pdf'))
% % variance X selon theta pour les 3 modalités
% Theta = ones(TargetNbr*3,1);
% for k = 1:1:TargetNbr*3
%     Theta(k,1) = calculTheta(TargetSimpleX(k),TargetSimpleZ(k));
% end
% 
% figure
% subplot(3,1,1)
% scatter(Theta(1:TargetNbr),varX(1:TargetNbr));
% title('variance selon la direction y en fonction de theta condition VTRH');
% xlabel('Theta(rad)')
% ylabel('var y direction')
% subplot(3,1,2)
% scatter(Theta(TargetNbr+1:2*TargetNbr),varX(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction y en fonction de theta condition VTLH');
% xlabel('theta(rad)')
% ylabel('var y direction')
% subplot(3,1,3)
% scatter(Theta(2*TargetNbr+1:3*TargetNbr),varX(2*TargetNbr+1:3*TargetNbr));
% title('variance selon la direction y en fonction de theta condition PTRH');
% xlabel('theta(rad)')
% ylabel('var y direction')
% export_fig(strcat(nomPDF,'VarX3CPRThe.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'VarX3CPRThe.pdf'))
% % variance Z selon theta pour les 3 modalités
% Theta = ones(TargetNbr*3,1);
% for k = 1:1:TargetNbr*3
%     Theta(k,1) = calculTheta(TargetSimpleX(k),TargetSimpleZ(k));
% end
% 
% figure
% subplot(3,1,1)
% scatter(Theta(1:TargetNbr),varZ(1:TargetNbr));
% title('variance selon la direction y en fonction de theta condition VTRH');
% xlabel('Theta(rad)')
% ylabel('var y direction')
% subplot(3,1,2)
% scatter(Theta(TargetNbr+1:2*TargetNbr),varZ(TargetNbr+1:2*TargetNbr));
% title('variance selon la direction y en fonction de theta condition VTLH');
% xlabel('theta(rad)')
% ylabel('var y direction')
% subplot(3,1,3)
% scatter(Theta(2*TargetNbr+1:3*TargetNbr),varZ(2*TargetNbr+1:3*TargetNbr));
% title('variance selon la direction y en fonction de theta condition PTRH');
% xlabel('theta(rad)')
% ylabel('var y direction')
% export_fig(strcat(nomPDF,'VarY3CPRThe.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'VarY3CPRThe.pdf'))
% % Covariance selon theta pour les 3 modalités
% Theta = ones(TargetNbr*3,1);
% for k = 1:1:TargetNbr*3
%     Theta(k,1) = calculTheta(TargetSimpleX(k),TargetSimpleZ(k));
% end
% 
% figure
% subplot(3,1,1)
% scatter(Theta(1:TargetNbr),cova2(1:TargetNbr));
% title('covariance fonction de theta condition VTRH');
% xlabel('Theta(rad)')
% ylabel('covariance')
% subplot(3,1,2)
% scatter(Theta(TargetNbr+1:2*TargetNbr),cova2(TargetNbr+1:2*TargetNbr));
% title('covariance en fonction de theta condition VTLH');
% xlabel('theta(rad)')
% ylabel('covariance')
% subplot(3,1,3)
% scatter(Theta(2*TargetNbr+1:3*TargetNbr),cova2(2*TargetNbr+1:3*TargetNbr));
% title('covariance en fonction de theta condition PTRH');
% xlabel('theta(rad)')
% ylabel('covariance')
% export_fig(strcat(nomPDF,'Cova3CPRThe.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'Cova3CPRThe.pdf'))
%% 7 allures des variances pour les 3 modalités

% ScatterPlotCondition123(PosXsort,PosZsort,PosTargetXsort,PosTargetZsort,TrialNbr,TargetNbr,varX,varZ,Xcenter,Zcenter,rho,cova2,n,nomPDF);

% 7 allures des variances avant traitement pour les 3 modalités
% PlotNouvelleDistri(covaReel,varReelX,varReelZ,Xcenter,Zcenter,PosTargetXsort,PosTargetZsort,TargetNbr,TrialNbr,n,nomPDF,'');

% % allures des variances après traitement pour les 3 modalités
% PlotNouvelleDistri(covaAReel,varAReelX,varAReelZ,Xcenter,Zcenter,PosTargetXsort,PosTargetZsort,TargetNbr,TrialNbr,n+3,nomPDF,' avec correction');
% PlotNouvelleDistri(covaAReel,varAReelX,varAReelZ,Xcenter,Zcenter,PosTargetXsort,PosTargetZsort,TargetNbr,TrialNbr,n+3,nomPDF,'');
% 
% plot des évolutions en fonction du temps
[timebytrial,distMean,distTarget] = plottemps(TrialNbr,TargetNbr,TimeElapsed,Xcenter,Zcenter,PosTargetXsort,PosTargetZsort,PosXsort,PosZsort,nomPDF);


save(nomData,'PosXsort','PosZsort','PosTargetXsort','PosTargetZsort');

end