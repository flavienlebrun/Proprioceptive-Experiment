function [] = SommeVarPlot(VarXP,VarXV,VarYP,VarYV,CovaP,CovaV,TargetSimpleXP010,TargetSimpleZP010,participantsID,TargetNbr,TrialNbr)

%% comparaison des valeurs de variance proprioceptive droite selon x pour tout les participants 
figure
for i=1:1:size(VarXP,2)
    scatter(VarXP(i),0,[],[0.5 0 + i*0.3 0.5],'*')
    Legend{i}=strcat(sprintf('%d',participantsID(i)));
    hold on
end
moyenne = mean(VarXP);
standarDeviation = std(VarXP);
x = [moyenne-2*standarDeviation:.000001:moyenne+2*standarDeviation];
y = normpdf(x,moyenne,standarDeviation);
plot(x,y)

legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);
title('comparaison of variance among participants along the x direction for proprioceptive sensibility','FontSize',5);
xlabel('value of the variance for each participant')
hold off

%% comparaison des valeurs de variance proprioceptive droite selon y pour tout les participants 
figure
for i=1:1:size(VarYP,2)
    scatter(VarYP(i),0,[],[0.5 0 + i*0.3 0.5],'*')
    Legend{i}=strcat(sprintf('%d',participantsID(i)));
    hold on
end
moyenne = mean(VarYP);
standarDeviation = std(VarYP);
x = [moyenne-2*standarDeviation:.000001:moyenne+2*standarDeviation];
y = normpdf(x,moyenne,standarDeviation);
plot(x,y)

legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);
title('comparaison of variance among participants along the y direction for proprioceptive sensibility','FontSize',5);
xlabel('value of the variance for each participant')
hold off
%% comparaison des valeurs de variance visuel selon x pour tout les participants 
figure
for i=1:1:size(VarXV,2)
    scatter(VarXV(i),0,[],[0.5 0 + i*0.3 0.5],'*')
    Legend{i}=strcat(sprintf('%d',participantsID(i)));
    hold on
end
moyenne = mean(VarXV);
standarDeviation = std(VarXV);
x = [moyenne-2*standarDeviation:.000001:moyenne+2*standarDeviation];
y = normpdf(x,moyenne,standarDeviation);
plot(x,y)
legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);
title('comparaison of variance among participants along the x direction for visual sensibility','FontSize',5);
xlabel('value of the variance for each participant')
hold off

%% comparaison des valeurs de variance visuel selon y pour tout les participants 
figure
for i=1:1:size(VarYV,2)
    scatter(VarYV(i),0,[],[0.5 0 + i*0.3 0.5],'*');
    Legend{i}=strcat(sprintf('%d',participantsID(i)));
    hold on
end
moyenne = mean(VarYV);
standarDeviation = std(VarYV);
x = [moyenne-2*standarDeviation:.000001:moyenne+2*standarDeviation];
y = normpdf(x,moyenne,standarDeviation);
plot(x,y)
legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);
title('comparaison of variance among participants along the y direction for visual sensibility','FontSize',5);
xlabel('value of the variance for each participant')
hold off

%% variance X selon r pour les 3 modalités

figure
subplot(3,1,1)
A = sum(VarXP')';
scatter(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4));
coeffVA1 = sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2)\A(1:4);
c = polyfit(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),1);
y_est = polyval(c,sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2));
title('Azimuth Variance Proprioceptive Right');
xlabel('distance (r in m)')
ylabel('Variance (m²)')
hold on
errlow = [min(VarAzimuthP(1,:)) min(VarAzimuthP(2,:)) min(VarAzimuthP(3,:)) min(VarAzimuthP(4,:))];
errhigh = [max(VarAzimuthP(1,:)) max(VarAzimuthP(2,:)) max(VarAzimuthP(3,:)) max(VarAzimuthP(4,:))];
er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
ylim([0 0.00145])
hold on
plot(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),y_est,'r--','LineWidth',2)
subplot(3,1,2)
A = sum(VarXL')';
coeffVA2 = sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2)\A(1:4);
scatter(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4));
c = polyfit(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),A(1:4,1),1);
y_est = polyval(c,sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2));
title('Azimuth Variance Proprioceptive Left');
xlabel('distance (r in m)')
ylabel('Variance (m²)')
hold on
errlow = [min(VarAzimuthL(1,:)) min(VarAzimuthL(2,:)) min(VarAzimuthL(3,:)) min(VarAzimuthL(4,:))];
errhigh = [max(VarAzimuthL(1,:)) max(VarAzimuthL(2,:)) max(VarAzimuthL(3,:)) max(VarAzimuthL(4,:))];
er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
ylim([0 0.00145])
plot(sqrt(TargetSimpleXP010(TargetNbr+1:2*TargetNbr-3).^2+TargetSimpleZP010(TargetNbr+1:2*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
subplot(3,1,3)
A = sum(VarXV')';
coeffVA3 = sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2)\A(1:4);
scatter(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4));
c = polyfit(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),A(1:4,1),1);
y_est = polyval(c,sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2));
title('Azimuth Variance Visual');
xlabel('distance (r in m)')
ylabel('Variance (m²)')
hold on
errlow = [min(VarAzimuthV(1,:)) min(VarAzimuthV(2,:)) min(VarAzimuthV(3,:)) min(VarAzimuthV(4,:))];
errhigh = [max(VarAzimuthV(1,:)) max(VarAzimuthV(2,:)) max(VarAzimuthV(3,:)) max(VarAzimuthV(4,:))];
er = errorbar(sqrt(TargetSimpleXP010(1:TargetNbr-3).^2+TargetSimpleZP010(1:TargetNbr-3).^2),A(1:4),errlow,errhigh);
ylim([0 0.00145])
plot(sqrt(TargetSimpleXP010(2*TargetNbr+1:3*TargetNbr-3).^2+TargetSimpleZP010(2*TargetNbr+1:3*TargetNbr-3).^2),y_est,'r--','LineWidth',2)
saveas(gcf,'varianceAzimuthSelonrPourLes3modalités','svg');
export_fig('varianceAzimuthSelonrPourLes3modalités.pdf'); 
end

