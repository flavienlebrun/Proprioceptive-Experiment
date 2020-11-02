function [timebytrial,distMean,distTarget] = plottemps(TrialNbr,TargetNbr,TimeElapsed,Xcenter,Zcenter,PosTargetXsort,PosTargetZsort,PosXsort,PosZsort,nomPDF)
nomPdf = strcat(nomPDF,'.pdf');

timebytrial = zeros(1,3*TrialNbr*TargetNbr-1);
distMean = zeros(1,3*TrialNbr*TargetNbr-1);
distTarget = zeros(1,3*TrialNbr*TargetNbr-1);
% calcul du temps par essai, de la distance par rapport à la cible et de la distance par rapport au centre par condition
for i=1:1:3*TrialNbr*TargetNbr-1
    timebytrial(i) = TimeElapsed(i+1)-TimeElapsed(i);
    if timebytrial(i)<0
        timebytrial(i) = 0;
    end
    if timebytrial(i) > 100;
        timebytrial(i) = 0;
    end
    distMean(i) = sqrt((PosXsort(i+1)-Xcenter(floor((i)/TrialNbr)+1))*(PosXsort(i+1)-Xcenter(floor((i)/TrialNbr)+1)) + (PosZsort(i+1)-Zcenter(floor((i)/TrialNbr)+1))*(PosZsort(i+1)-Zcenter(floor((i)/TrialNbr)+1)));
    distTarget(i) = sqrt((PosXsort(i+1)-PosTargetXsort(i+1))*(PosXsort(i+1)-PosTargetXsort(i+1)) + (PosZsort(i+1)-PosTargetZsort(i+1))*(PosZsort(i+1)-PosTargetZsort(i+1)));
end
% 
% figure
% scatter(2:1:3*TrialNbr*TargetNbr,timebytrial);
% title('evolution du temps par essai au cours de l''experience');
% xlabel('numéro de l''essai')
% ylabel('temps(s)')
% export_fig(strcat(nomPDF,'TpsAuCoursExpe.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'TpsAuCoursExpe.pdf'))
% 
% figure
% scatter(2:1:3*TrialNbr*TargetNbr,distMean);
% title('distance au centre de la distribution au cours de l''experience');
% xlabel('numéro de l''essai')
% ylabel('distance(m)')
% export_fig(strcat(nomPDF,'DeriveDistCentrePRE.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DeriveDistCentrePRE.pdf'))
% 
% 
% figure
% scatter(timebytrial,distMean);
% title('distance au centre de la distribution par rapport au temps d''execution');
% xlabel('temps(s) de l''essai')
% ylabel('distance(m)')
% export_fig(strcat(nomPDF,'DeriveDistCentrePRTps.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DeriveDistCentrePRTps.pdf'))
% 
% figure
% scatter(2:1:3*TrialNbr*TargetNbr,distTarget);
% title('distance à la cible au cours de l''experience');
% xlabel('numéro de l''essai')
% ylabel('distance(m)')
% export_fig(strcat(nomPDF,'DeriveDistCiblePRTps.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DeriveDistCentrePRTps.pdf'))
% 
% 
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],timebytrial(1:TrialNbr*TargetNbr-1));
% x = 2:1:TrialNbr*TargetNbr;
% y = timebytrial(1:TrialNbr*TargetNbr-1);
% g = fittype(@(A,B,x) exp(-A./(x.^B)));
% f = fit(x(:),y(:),g);
% yh = f([2:1:TrialNbr*TargetNbr]);
% title('evolution du temps par essai au cours de l''experience condition 1 ');
% xlabel('numéro de l''essai')
% ylabel('temps(s)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],yh,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'TpsAuCoursExpeC1.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'TpsAuCoursExpeC1.pdf'))
% 
% 
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],timebytrial(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],timebytrial(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr-1),2);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution du temps par essai au cours de l''experience condition 2 ');
% xlabel('numéro de l''essai')
% ylabel('temps(s)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'TpsAuCoursExpeC2.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'TpsAuCoursExpeC2.pdf'))
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],timebytrial(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],timebytrial(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1),2);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution du temps par essai au cours de l''experience condition 3 ');
% xlabel('numéro de l''essai')
% ylabel('temps(s)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'TpsAuCoursExpeC3.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'TpsAuCoursExpeC3.pdf'))
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],distMean(1:TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],distMean(1:TrialNbr*TargetNbr-1),1);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution de la distance à la moyenne au cours de l''experience condition 1 ');
% xlabel('numéro de l''essai')
% ylabel('dist(m)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'DistMeanC1.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DistMeanC1.pdf'))
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],distMean(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],distMean(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr-1),1);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution de la distance à la moyenne au cours de l''experience condition 2 ');
% xlabel('numéro de l''essai')
% ylabel('dist(m)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'DistMeanC2.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DistMeanC2.pdf'))
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],distMean(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],distMean(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1),1);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution de la distance à la moyenne au cours de l''experience condition 3 ');
% xlabel('numéro de l''essai')
% ylabel('dist(m)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'DistMeanC3.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DistMeanC3.pdf'))
% 
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],distTarget(1:TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],distTarget(1:TrialNbr*TargetNbr-1),3);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution de la distance à la cible au cours de l''experience condition 1 ');
% xlabel('numéro de l''essai')
% ylabel('dist(m)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'DistCibleC1.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DistCibleC1.pdf'))
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],distTarget(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],distTarget(TrialNbr*TargetNbr+1:2*TrialNbr*TargetNbr-1),3);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution de la distance à la cible au cours de l''experience condition 2 ');
% xlabel('numéro de l''essai')
% ylabel('dist(m)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'DistCibleC2.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DistCibleC2.pdf'))
% 
% figure
% scatter([2:1:TrialNbr*TargetNbr],distTarget(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1));
% c = polyfit([2:1:TrialNbr*TargetNbr],distTarget(2*TrialNbr*TargetNbr+1:3*TrialNbr*TargetNbr-1),3);
% y_est = polyval(c,[2:1:TrialNbr*TargetNbr]);
% title('evolution de la distance à la cible au cours de l''experience condition 3 ');
% xlabel('numéro de l''essai')
% ylabel('dist(m)')
% hold on
% plot([2:1:TrialNbr*TargetNbr],y_est,'r--','LineWidth',2)
% export_fig(strcat(nomPDF,'DistCibleC3.pdf')); 
% append_pdfs(nomPdf,strcat(nomPDF,'DistCibleC3.pdf'))
% 
% end