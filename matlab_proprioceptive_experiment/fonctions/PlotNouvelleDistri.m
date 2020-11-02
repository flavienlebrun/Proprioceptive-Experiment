function [sucess] =PlotNouvelleDistri(covaAReel,varAReelX,varAReelZ,Xcenter,Zcenter,PosTargetXsort,PosTargetZsort,TargetNbr,TrialNbr,n,nomPDF,corr)
nomPdf = strcat(nomPDF,'.pdf');

figure
for k = 1:1:TargetNbr
        A = [varAReelX(k),covaAReel(k);covaAReel(k),varAReelZ(k)];
        if det(A)>0
            elpt = ellipsedata(A,[PosTargetXsort((k-1)*TrialNbr +1) PosTargetZsort((k-1)*TrialNbr +1)],100,[3]);
            plot(elpt(:,1:2:end),elpt(:,2:2:end));
    xlim([-0.15 0.4])
    ylim([0 0.6])
    %     else 
    %         det(A)
    %         A
    %         if A(1,1)<0
    %             A(1,1) = 0;
    %         end
    %         if A(2,1)>0
    %             A(2,1) = 0;
    %             A(1,2) = 0;
    %         end
    %         if A(2,1)<0
    %             A(2,1) = 0;
    %             A(1,2) = 0;
    %         end
%             elpt = ellipsedata(A,[Xcenter(k) Zcenter(k)],100,[1,2,3]);
%             plot(elpt(:,1:2:end),elpt(:,2:2:end));
        end

        hold on
end
title(strcat('Proprioceptive right modality',corr));
    xlabel('x coordinate in meter')
    ylabel('y coordinate in meter')
    export_fig(strcat(nomPDF,'VarRRHSC',corr,'.pdf'));
    append_pdfs(nomPdf,strcat(nomPDF,'VarRRHSC',corr,'.pdf'))
    hold off

figure

for k = TargetNbr+1:1:2*TargetNbr
    A = [varAReelX(k),covaAReel(k);covaAReel(k),varAReelZ(k)];
    if det(A)>0
        elpt = ellipsedata(A,[PosTargetXsort((k-1)*TrialNbr +1) PosTargetZsort((k-1)*TrialNbr +1)],100,[3]);
        plot(elpt(:,1:2:end),elpt(:,2:2:end));
    xlim([-0.15 0.4])
    ylim([0 0.6])
    end

    hold on
end
title(strcat('Proprioceptive left modality',corr));
xlabel('x coordinate in meter')
ylabel('y coordinate in meter')
export_fig(strcat(nomPDF,'VarRLHSC.pdf',corr,'.pdf'));
append_pdfs(nomPdf,strcat(nomPDF,'VarRLHSC.pdf',corr,'.pdf'))
hold off

figure
for k = 2*TargetNbr+1:1:3*TargetNbr
    A = [varAReelX(k),covaAReel(k);covaAReel(k),varAReelZ(k)];
    if det(A)>0
        elpt = ellipsedata(A,[PosTargetXsort((k-1)*TrialNbr +1) PosTargetZsort((k-1)*TrialNbr +1)],100,[3]);
        plot(elpt(:,1:2:end),elpt(:,2:2:end));
    xlim([-0.15 0.4])
    ylim([0 0.6])
    end

    hold on
end
title(strcat('visual modality',corr));
xlabel('x coordinate in meter')
ylabel('y coordinate in meter')
export_fig(strcat(nomPDF,'VarRV',corr,'.pdf'));
append_pdfs(nomPdf,strcat(nomPDF,'VarRV',corr,'.pdf'))
hold off

sucess = 1;
end