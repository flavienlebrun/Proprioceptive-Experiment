function [vrai]  = ScatterPlotCondition123(PosXsort,PosZsort,PosTargetXsort,PosTargetZsort,TrialNbr,TargetNbr,sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,n,nomPDF)
   
    nomPdf = strcat(nomPDF,'.pdf');
    

    figure('visible','on')
    for i = 1:1:TrialNbr
        Xascatter = [];
        Yascatter = [];
        for k= 1:1:TargetNbr
            
            Xascatter = [Xascatter;PosXsort(( k-1)*TrialNbr+i)];
            Yascatter = [Yascatter;PosZsort(( k-1)*TrialNbr+i)];
        end
        scatter(Xascatter,Yascatter,[],[0.5 0 + i*0.05*(20/TrialNbr) 0.5])
        Legend{i}=strcat(sprintf('%d',i));
        hold on
    end
    for i = 1:1:TrialNbr
        Xascatter = [];
        Yascatter = [];
        for k= 1:1:TargetNbr
            
            Xascatter = [Xascatter;PosTargetXsort(( k-1)*TrialNbr+i)];
            Yascatter = [Yascatter;PosTargetZsort(( k-1)*TrialNbr+i)];
        end
        scatter(Xascatter,Yascatter,[],'+')
        
        hold on
    end
%     legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);
%     scatter(xStartingPosition,yStartingPosition,'+');
    for k=1:1:TargetNbr
        A = [sigmaX(k),cova(k);cova(k),sigmaZ(k)];
        elpt = ellipsedata(A,[Xcenter(k) Zcenter(k)],100,[3]);
        plot(elpt(:,1:2:end),elpt(:,2:2:end));
    end
    titrePlot = strcat('condition RHV ',nomPDF);
    title(titrePlot,'FontSize',12);
    xlabel('x coordinate in meter')
    ylabel('y coordinate in meter')
    xlim([-0.15 0.4])
    ylim([0 0.6])
    nomSVG1 = strcat(nomPDF,'RHV');
    nomSVG1 = strcat(nomSVG1,'.svg');
    saveas(gcf,nomSVG1,'svg');
    export_fig(strcat(nomPDF,'ScatGlobVTRH.pdf')); 
    append_pdfs(nomPdf,strcat(nomPDF,'ScatGlobVTRH.pdf'))

    hold off
    
    
    
    
    figure('visible','on')
    for i = 1:1:TrialNbr
        Xascatter = [];
        Yascatter = [];
        for k= 1:1:TargetNbr

            Xascatter = [Xascatter;PosXsort((TargetNbr +  k-1)*TrialNbr+i)];
            Yascatter = [Yascatter;PosZsort((TargetNbr +  k-1)*TrialNbr+i)];
        end
        scatter(Xascatter,Yascatter,[],[0.5 0 + i*0.05*(20/TrialNbr) 0.5])
        Legend{i}=strcat(sprintf('%d',i));
        hold on
    end
    for i = 1:1:TrialNbr
        Xascatter = [];
        Yascatter = [];
        for k= 1:1:TargetNbr
            
            Xascatter = [Xascatter;PosTargetXsort(( TargetNbr +k-1)*TrialNbr+i)];
            Yascatter = [Yascatter;PosTargetZsort((TargetNbr + k-1)*TrialNbr+i)];
        end
        scatter(Xascatter,Yascatter,[],'+')

        hold on
    end
    for k=1:1:TargetNbr
        A = [sigmaX(k + TargetNbr),cova(k + TargetNbr);cova(k + TargetNbr),sigmaZ(k + TargetNbr)];
        elpt = ellipsedata(A,[Xcenter(k + TargetNbr) Zcenter(k + TargetNbr)],100,[3]);
        plot(elpt(:,1:2:end),elpt(:,2:2:end));
    end
%     scatter(xStartingPosition,yStartingPosition,'+');
%     legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);
    titrePlot = strcat('condition LHV ',nomPDF);
    title(titrePlot,'FontSize',12);
    xlabel('x coordinate in meter')
    ylabel('y coordinate in meter')
    xlim([-0.15 0.4])
    ylim([0 0.6])
    nomSVG2 = strcat(nomPDF,'LHV');
    nomSVG2 = strcat(nomSVG2,'.svg');
    saveas(gcf,nomSVG2,'svg');
    export_fig(strcat(nomPDF,'ScatGlobVTLH.pdf')); 
    append_pdfs(nomPdf,strcat(nomPDF,'ScatGlobVTLH.pdf'))
    hold off
    
    
    figure('visible','on')
    for i = 1:1:TrialNbr
        Xascatter = [];
        Yascatter = [];
        for k= 1:1:TargetNbr

            Xascatter = [Xascatter;PosXsort((2*TargetNbr + k-1)*TrialNbr+i)];
            Yascatter = [Yascatter;PosZsort((2*TargetNbr + k-1)*TrialNbr+i)];
        end
        scatter(Xascatter,Yascatter,[],[0.5 0 + i*0.05*(20/TrialNbr) 0.5])
        Legend{i}=strcat(sprintf('%d',i));
        hold on
    end
    for i = 1:1:TrialNbr
        Xascatter = [];
        Yascatter = [];
        for k= 1:1:TargetNbr
            
            Xascatter = [Xascatter;PosTargetXsort(( 2*TargetNbr +k-1)*TrialNbr+i)];
            Yascatter = [Yascatter;PosTargetZsort((2*TargetNbr + k-1)*TrialNbr+i)];
        end
        scatter(Xascatter,Yascatter,[],'+')

        hold on
    end
    for k=1:1:TargetNbr
        A = [sigmaX(k + 2*TargetNbr),cova(k + 2*TargetNbr);cova(k + 2*TargetNbr),sigmaZ(k + 2*TargetNbr)];
        elpt = ellipsedata(A,[Xcenter(k + 2*TargetNbr) Zcenter(k + 2*TargetNbr)],100,[3]);
        plot(elpt(:,1:2:end),elpt(:,2:2:end));
    end
%     scatter(xStartingPosition,yStartingPosition,'+');
%     legend(Legend,'FontSize',5,'location',[0.8 0.5 0.1 0.2]);
    titrePlot = strcat('condition RHP ',nomPDF);
    title(titrePlot,'FontSize',12);
    xlabel('x coordinate in meter')
    ylabel('y coordinate in meter')
    xlim([-0.15 0.4])
    ylim([0 0.6])
    nomSVG3 = strcat(nomPDF,'RHP');
    nomSVG3 = strcat(nomSVG3,'.svg');
    saveas(gcf,nomSVG3,'svg');
    export_fig(strcat(nomPDF,'ScatGlobPTRH.pdf')); 
    append_pdfs(nomPdf,strcat(nomPDF,'ScatGlobPTRH.pdf'))
    hold off
end
