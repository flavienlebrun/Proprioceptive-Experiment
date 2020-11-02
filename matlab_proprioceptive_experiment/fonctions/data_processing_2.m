clear all
%% experiment caracterisation
TargetNbr = 8;
TrialNbr = 20;


%% data recuperation 
filename = 'flavien_19_11_8_20_1_2.txt';
Data = lire_data(filename);
Data = [Data];
    
PosX = Data(:,1);
PosY = Data(:,2);
PosZ = Data(:,3);
Target = Data(:,4);
Condition = Data(:,5);

%% sorting data by target and condition

[PosXsort,PosZsort] = organise(PosX, PosY, PosZ,Target,Condition,TargetNbr,TrialNbr);
%% calculate the center

Xcenter = zeros(TargetNbr*3,1);
Zcenter = zeros(TargetNbr*3,1);
for i = 1:1:TargetNbr*3

    Xcenter(i) = mean(PosXsort((i-1)*TrialNbr + 1:i*TrialNbr));
    Zcenter(i) = mean(PosZsort((i-1)*TrialNbr + 1:i*TrialNbr));
    
end

%% filtrage des donn�es ab�ranttes
max = 0;
indice = zeros(TargetNbr);
PosXsortNew = PosXsort;
PosZsortNew = PosZsort;
tour_de_filtre = 0;

while tour_de_filtre < 4
    
    for cond = 1:1:3
        
        c = (cond-1)*TrialNbr*TargetNbr;
        for i = 1:1:TargetNbr
        max = 0;
            for k = 1:1:TrialNbr
                xcarre = (Xcenter((cond-1)*TargetNbr + i) - PosXsortNew(c + (i-1)*TrialNbr + k))*(Xcenter((cond-1)*TargetNbr + i) - PosXsortNew(c+(i-1)*TrialNbr + k));
                zcarre = (Zcenter((cond-1)*TargetNbr + i) - PosZsortNew(c+(i-1)*TrialNbr + k))*(Zcenter((cond-1)*TargetNbr + i) - PosZsortNew(c+(i-1)*TrialNbr + k));
                norme = sqrt(xcarre + zcarre);
                if norme > max
                    indice(i) = k;
                    max = norme;
                end
            end
            PosXsortNew(c+(i-1)*TrialNbr+indice(i)) = Xcenter((cond-1)*TargetNbr + i);
            PosZsortNew(c+(i-1)*TrialNbr+indice(i)) = Zcenter((cond-1)*TargetNbr + i);

        end
    end
tour_de_filtre = tour_de_filtre + 1;
end

%% Calculate the unidimensionnal variance
sigmaX = zeros(TargetNbr*3,1);
sigmaZ = zeros(TargetNbr*3,1);

for i = 1:1:TargetNbr*3
    for k = 1:1:TrialNbr
        sigmaX(i) = sigmaX(i) + (PosXsort(k+(i-1)*TrialNbr) - Xcenter(i)) * (PosXsort(k+(i-1)*TrialNbr) - Xcenter(i));
        sigmaZ(i) = sigmaZ(i) + (PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)) * (PosZsort(k+(i-1)*TrialNbr) - Zcenter(i));
    end
    sigmaX(i) = sigmaX(i)/TrialNbr;
    sigmaZ(i) = sigmaZ(i)/TrialNbr;
end
%% Calculate the correlation coefficient
rho = zeros(TargetNbr*3,1);
cova = zeros(TargetNbr*3,1);
for i = 1:1:TargetNbr*3
    for k=1:1:TrialNbr
        rho(i) = rho(i) + ((PosXsort(k+(i-1)*TrialNbr) - Xcenter(i))*(PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)));
        cova(i) = cova(i) + ((PosXsort(k+(i-1)*TrialNbr) - Xcenter(i))*(PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)));   
    end
    rho(i) = rho(i)/(sqrt(sigmaX(i))*sqrt(sigmaZ(i))*TrialNbr);
    cova(i) = cova(i)/TrialNbr;
end

%% calcule et plot des ellipsoides


% % subplot(3,1,1)
Xstarting = 0.6747376;
Zstarting = -0.0140203;
XcubeCenter = 1.000612;
ZcubeCenter = -0.06078989;
theta = atan((Zstarting-ZcubeCenter)/(XcubeCenter - Xstarting));
matrot = [cos(theta) -sin(theta);sin(theta) cos(theta)];
hold on
for i = 1:1:TrialNbr
    Xascatter = [];
    Yascatter = [];
    for k= 1:1:TargetNbr
        coordTxtranslate = PosXsort((2*TargetNbr + k-1)*TrialNbr+i);
        coordTytranslate = PosZsort((2*TargetNbr + k-1)*TrialNbr+i);
        coord = [coordTxtranslate coordTytranslate];
        pointhomot = matrot*coord';
        Xascatter = [Xascatter;pointhomot(1) - ZcubeCenter];
        Yascatter = [Yascatter;pointhomot(2)-XcubeCenter];
    end
    scatter(Yascatter,-Xascatter,[],[0.5 0 + i*0.05 0.5])
    Legend{i}=strcat(sprintf('%d',i));
    
end


hold on 

Xstarting = 0.6747376;
Zstarting = -0.0140203;
XcubeCenter = 1.000612;
ZcubeCenter = -0.06078989;
dy1 = 0.15*cos(atan((Zstarting - ZcubeCenter)/(XcubeCenter-Xstarting)));
dx1 = 0.15*sin(atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dy2 = 0.27*cos(atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dx2 = 0.27*sin(atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dy3 = 0.15*cos(0.523599+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dx3 = 0.15*sin(0.523599+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dy4 = 0.27*cos(0.523599+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dx4 = 0.27*sin(0.523599+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dy5 = 0.15*cos(1.0472+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dx5 = 0.15*sin(1.0472+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dy6 = 0.27*cos(1.0472+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dx6 = 0.27*sin(1.0472+atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dy7 = 0.15*cos(0.523599 - atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dx7 = 0.15*sin(0.523599 - atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dy8 = 0.27*cos(0.523599 - atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
dx8 = 0.27*sin(0.523599 - atan((Zstarting- ZcubeCenter)/(XcubeCenter-Xstarting)));
coordTx = [Xstarting+dx1;Xstarting+dx2;Xstarting+dx3;Xstarting+dx4;Xstarting+dx5;Xstarting+dx6;Xstarting-dx7;Xstarting-dx8];
coordTy = [Zstarting+dy1;Zstarting+dy2;Zstarting+dy3;Zstarting+dy4;Zstarting+dy5;Zstarting+dy6;Zstarting+dy7;Zstarting+dy8];

coordTxtranslate = coordTx - ones(8,1)*XcubeCenter;
coordTytranslate = coordTy - ones(8,1)*ZcubeCenter;
scatter(0,0,'+');
theta = atan((Zstarting-ZcubeCenter)/(XcubeCenter - Xstarting));
matrot = [cos(theta) -sin(theta);sin(theta) cos(theta)];
point = matrot*[Xstarting-XcubeCenter;Zstarting-ZcubeCenter];
coord = [coordTxtranslate coordTytranslate];
coordNew = matrot*coord';
scatter(point(1), point(2),'+');
scatter(coordNew(1,:),coordNew(2,:),'+');
hold on 
scatter(Zcenter(17:24),-Xcenter(17:24),1000,'x')
Legend{21} =strcat('startingposition');
Legend{22} =strcat('calibration cube');
Legend{23} =strcat('Reel target center');
Legend{24} = strcat('Mean of target aimed');

legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);

hold off 
xlabel('x coordinate in meter')
ylabel('y coordinate in meter')
title('scatter plot de toutes les vis�es pour toute les cibles cible proprioceptive') 

figure(2)
scatter(0,0,'+');
hold on

hold on
coordTxtranslate = coordTx - ones(8,1)*XcubeCenter;
coordTytranslate = coordTy - ones(8,1)*ZcubeCenter;

theta = atan((Zstarting-ZcubeCenter)/(XcubeCenter - Xstarting));
matrot = [cos(theta) -sin(theta);sin(theta) cos(theta)];
point = matrot*[Xstarting-XcubeCenter;Zstarting-ZcubeCenter];
coord = [coordTxtranslate coordTytranslate];
coordNew = matrot*coord';
scatter(point(1), point(2),'+');
scatter(coordNew(1,:),coordNew(2,:),'+');
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf

% for i = 1:1:TargetNbr
%     hold on
%     A = [sigmaZ(i),cova(i);cova(i),sigmaX(i)];
%     elpt = ellipsedata(A,[Zcenter(i),-Xcenter(i)],100,[1,2,3]);
%     plot(elpt(:,1:2:end),elpt(:,2:2:end))
% end
% subplot(3,1,2)
% polarscatter([2*pi/3;pi/2;pi/3;pi/6],[8*0.015;8*0.015;8*0.015;8*0.015]);
% hold on
% xCenterTarget = [0.41;0.29;0.35;0.47;0.53;0.29;0.17];
% zCenterTarget = [-0.625;-0.625;-0.55;-0.55;-0.475;-0.475;-0.475];
% x = 0.32;
% z = -0.75;
% scatter(x,z,'red','+')
% scatter(xCenterTarget,zCenterTarget,'red','+');
%  figure
%  scatter(PosXsortNew(TrialNbr*TargetNbr + 1 : TrialNbr*TargetNbr*2),PosZsortNew(TrialNbr*TargetNbr + 1 : TrialNbr*TargetNbr*2))
%  
% figure(2)
% %  scatter(PosXsort(TrialNbr*TargetNbr + 1 : TrialNbr*TargetNbr*2),PosZsort(TrialNbr*TargetNbr + 1 : TrialNbr*TargetNbr*2))
% for i = 1:1:TargetNbr
%     hold on
%     A = [sigmaX(i),cova(i);cova(i),sigmaZ(i)];
%     elpt = ellipsedata(A,[Xcenter(i),Zcenter(i)],100,[1,2,3]);
%     plot(elpt(:,1:2:end),elpt(:,2:2:end))
% end
% title('scatter plot of all the target + ellipse representing gaussian distribution show by the data');
% xlabel('x coordinate in meter')
% ylabel('y coordinate in meter')
% export_fig test3.pdf
% hold off

% subplot(3,1,3)
% y = [-30;0;30;60];
% x = sigmaX(1:4);
% plot(y,x)
% xlabel('theta in degree')
% ylabel('variance according to x direction')
% figure(1)
% 
% hold on
% scatter(PosXsort(TrialNbr*TargetNbr+1:TrialNbr*TargetNbr*2),PosZsort(TrialNbr*TargetNbr+1:TrialNbr*TargetNbr*2),'red')
% scatter(PosXsort(TrialNbr*TargetNbr*2+1:TrialNbr*TargetNbr*3),PosZsort(TrialNbr*TargetNbr*2+1:TrialNbr*TargetNbr*3))
% scatter(PosXsort(1:TrialNbr*TargetNbr),PosZsort(1:TrialNbr*TargetNbr),'blue')
% 
% xlim([-0.3 0.65]);
% ylim([-0.2 0.2]);
% 
% hold off
% for i = 1:1:TargetNbr*3
%     figure(i+2)
%     plotVarianceCalibration(PosXsort(1+(i-1)*TrialNbr:i*TrialNbr));
%     export_fig test2.pdf
%     append_pdfs test.pdf test2.pdf
% end


%% boostrap un peu bizarre
% figure(1);
% nombreDePoint = 15;
% varianceVariance = zeros(nombreDePoint,2);
% meanVariance = zeros(nombreDePoint,2);
% for i = (TrialNbr - (nombreDePoint-1)):1:TrialNbr
%     
% 
%     combinaisons = combnk(PosXsort(4*TrialNbr + 1:5*TrialNbr),i);
%     [sizeC ~] = size(combinaisons);
%     random = randi([1 sizeC]); 
%     Selection = combinaisons(random,:);
%     m = bootstrp(1000,@var,Selection);
%     meanVariance(i-TrialNbr + (nombreDePoint),1) = mean(m);
%     meanVariance(i-TrialNbr + (nombreDePoint),2) = i;
%     varianceVariance(i-TrialNbr + (nombreDePoint),1) = var(m); 
%     varianceVariance(i-TrialNbr + (nombreDePoint),2) = i;
%     
%     
% end
% 
% subplot(2,1,1)
% plot(varianceVariance(:,2)',varianceVariance(:,1)');
% 
% title('estimation de la variance par bootsrap pour la target 4');
% xlabel('Number of point in the base selection')
% ylabel('Variance of the variances')
% subplot(2,1,2)
% errorbar(meanVariance(:,2)',meanVariance(:,1)',sqrt(varianceVariance(:,1)));
% xlabel('Number of point in the base selection')
% ylabel('mean of variance')
% hold on
% export_fig unTirage.pdf
% append_pdfs  rapport.pdf unTirage.pdf
% hold off
% 
% 
% 
%% bootstrap en changeant la selection de point moyennedelavariance et errorbar de la variance de la variance
% figure(3);
% nombreDePoint = 46;
% nombreDeSelection = 500;
% varianceVariance = zeros(nombreDePoint,2);
% meanVariance = zeros(nombreDePoint,2);
% varianceInitiale = mean(bootstrp(1000,@var,PosXsort(1:TrialNbr)));
% RandomDistri = normrnd(0,sqrt(varianceInitiale),[1,3000]);
% 
% % for i = (TrialNbr - nombreDePoint + 1):1:TrialNbr
%     
%  for i = 3:1:50   
% %     combinaisons = combnk(PosXsort(1:TrialNbr),i);
% %     [sizeC ~] = size(combinaisons);
%     internMean = 0;
%     MeanInternListe = zeros(nombreDeSelection,1);
%     for k = 1:1:nombreDeSelection
% %         random = randi([1 sizeC]); 
% %         Selection = combinaisons(random,:);
%         Selection = datasample(RandomDistri,i,'Replace',false);
%         
%         m = bootstrp(100,@var,Selection);
% 
%         MeanInternListe(k) = mean(m);
%     end
% 
%     meanVariance(i-2,1) = mean(MeanInternListe);
%     meanVariance(i-2,2) = i;
%     varianceVariance(i-2,1) = var(MeanInternListe); 
%     varianceVariance(i-2,2) = i;
%     
%  end
% 
% subplot(2,1,1)
% title('variance pour des selections al�atoires de points dune distribution gaussienne de m�me variance')
% plot(varianceVariance(:,2)',varianceVariance(:,1)');
% 
% xlabel('Number of point in the base selection')
% ylabel('Variance  for the different selection')
% subplot(2,1,2)
% errorbar(meanVariance(:,2)',meanVariance(:,1)',sqrt(varianceVariance(:,1)));
% xlabel('Number of point in the base selection')
% ylabel('mean of bootstrap list variance')
% hold on
% export_fig unTirage.pdf
% append_pdfs  rapport.pdf unTirage.pdf
% hold off


%% calcul des variances bis
varReelX = [];
for i=0:1:1
    var1 =  abs(mean(bootstrp(100,@var,PosXsortNew(i*TrialNbr+1:(i+1)*TrialNbr))));
    var2 =  abs(mean(bootstrp(100,@var,PosXsortNew((TargetNbr+i)*TrialNbr+1:(TargetNbr+i+1)*TrialNbr))));
    var3 =  abs(mean(bootstrp(100,@var,PosXsortNew((2*TargetNbr+i)*TrialNbr+1:(2*TargetNbr+i+1)*TrialNbr))));
    varReelX = [varReelX (1/2)*(var2 + var1 - var3)]; 
end

varReelZ = [];
for i=0:1:1
    var1 =  abs(mean(bootstrp(100,@var,PosZsortNew(i*TrialNbr+1:(i+1)*TrialNbr))));
    var2 =  abs(mean(bootstrp(100,@var,PosZsortNew((TargetNbr+i)*TrialNbr+1:(TargetNbr+i+1)*TrialNbr))));
    var3 =  abs(mean(bootstrp(100,@var,PosZsortNew((2*TargetNbr+i)*TrialNbr+1:(2*TargetNbr+i+1)*TrialNbr))));
    varReelZ = [varReelZ (1/2)*(var2 + var1 - var3)]; 
end
rhoReel = [];
for i = 0:1:1
    varX1 =  abs(mean(bootstrp(100,@var,PosXsortNew(i*TrialNbr+1:(i+1)*TrialNbr))));
    varX2 =  abs(mean(bootstrp(100,@var,PosXsortNew((TargetNbr+i)*TrialNbr+1:(TargetNbr+i+1)*TrialNbr))));
    varX3 =  abs(mean(bootstrp(100,@var,PosXsortNew((2*TargetNbr+i)*TrialNbr+1:(2*TargetNbr+i+1)*TrialNbr))));
    

    
    varZ1 =  abs(mean(bootstrp(100,@var,PosZsortNew(i*TrialNbr+1:(i+1)*TrialNbr))));
    varZ2 =  abs(mean(bootstrp(100,@var,PosZsortNew((TargetNbr+i)*TrialNbr+1:(TargetNbr+i+1)*TrialNbr))));
    varZ3 =  abs(mean(bootstrp(100,@var,PosZsortNew((2*TargetNbr+i)*TrialNbr+1:(2*TargetNbr+i+1)*TrialNbr))));
    
    varReelXrho = varX1 + varX2 - varX3;
    varReelZrho = varZ1 + varZ2 - varZ3;
    
    calculrhoVR = sqrt(varX1)*sqrt(varZ1)*rho(i+1);
    calculrhoVL = sqrt(varX2)*sqrt(varZ2)*rho(TargetNbr+i+1);
    calculrhoRL = sqrt(varX3)*sqrt(varZ3)*rho(2*TargetNbr+i+1);
   
    rhoReel = [rhoReel ((calculrhoVL+calculrhoVR-calculrhoRL))];
end

% 
% for i = 1:1:1
%     hold on
%     A = [varReelX(i),rhoReel(i);rhoReel(i),varReelZ(i)];
%     elpt = ellipsedata(A,[Xcenter(i),Zcenter(i)],100,[1,2,3]);
%     plot(elpt(:,1:2:end),elpt(:,2:2:end))
% end

hold off
% %% plot variance along theta and r
% figure(2)
% plot([-30;0;30;60],[sigmaX(3);sigmaX(2);sigmaX(1);sigmaX(4)]);
% title('variance direction x en fonction de theta main droite proche');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% 
% figure(3)
% plot([-30;0;30;60],[sigmaX(7);sigmaX(6);sigmaX(5);sigmaX(8)]);
% title('variance direction x en fonction de theta main droite eloign�');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% figure(4)
% plot([-30;0;30;60],[sigmaX(11);sigmaX(10);sigmaX(9);sigmaX(12)]);
% title('variance direction x en fonction de theta main gauche proche');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% figure(5)
% plot([-30;0;30;60],[sigmaX(15);sigmaX(14);sigmaX(13);sigmaX(16)]);
% ylim([0 0.0008]);
% title('variance direction x en fonction de theta main gauche eloign�');
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% figure(6)
% plot([-30;0;30;60],[sigmaZ(3);sigmaZ(2);sigmaZ(1);sigmaZ(4)]);
% title('variance direction y en fonction de theta main droite proche');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% 
% figure(7)
% plot([-30;0;30;60],[sigmaZ(7);sigmaZ(6);sigmaZ(5);sigmaZ(8)]);
% title('variance direction y en fonction de theta main droite �loign�');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% figure(8)
% plot([-30;0;30;60],[sigmaZ(11);sigmaZ(10);sigmaZ(9);sigmaZ(12)]);
% title('variance direction y en fonction de theta main gauche proche');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% figure(9)
% plot([-30;0;30;60],[sigmaZ(15);sigmaZ(14);sigmaZ(13);sigmaZ(16)]);
% ylim([0 0.0008]);
% title('variance direction y en fonction de theta main gauche �loign�');
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% figure(10)
% plot([-30;0;30;60],[sigmaX(19);sigmaX(18);sigmaX(17);sigmaX(20)]);
% title('variance direction x en fonction de theta proprio proche');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% 
% figure(11)
% plot([-30;0;30;60],[sigmaX(23);sigmaX(22);sigmaX(21);sigmaX(24)]);
% title('variance direction x en fonction de theta proprio eloign�');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% figure(12)
% plot([-30;0;30;60],[sigmaZ(19);sigmaZ(18);sigmaZ(17);sigmaZ(20)]);
% title('variance direction y en fonction de theta proprio proche');
% ylim([0 0.0008]);
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf
% 
% figure(13)
% plot([-30;0;30;60],[sigmaZ(23);sigmaZ(22);sigmaZ(21);sigmaZ(24)]);
% ylim([0 0.0008]);
% title('variance direction y en fonction de theta proprio �loign�');
% xlabel('angle en degr�e')
% ylabel('Variance selon la direction x')
% export_fig test2.pdf
% append_pdfs test3.pdf test2.pdf