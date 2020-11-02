function [] = annovaFla(VarDepthP,VarAzimuthP,VarDepthL,VarAzimuthL,VarDepthV,VarAzimuthV,CovaDPP,CovaDPL,CovaDPV,TargetNbr,TargetSimpleXF,TargetSimpleZF)
[~,nbr_participant] = size(VarDepthP);
%% Initialization of the excel file with l'entete
A = {'factor','number of modality','n','criterium','p value','box plot path'};
% xlswrite('AnnovaExpe1.xlsx',A);
%% Depth Variance according to the distance R from the origin modality : PR 

p = anova1(VarDepthP(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)'); 
boxplot(VarDepthP(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)','notch','on');
xlabel('depth (m)','Fontsize',10,'FontWeight','bold')
ylabel('Depth Variance (m²)','Fontsize',12,'FontWeight','bold')
export_fig('AnovaRDepthVariancePR.pdf');

A = {'Distance R from the origin Proprioceptive Right modality','4',nbr_participant,'Depth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaRDepthVariancePR.pdf'};
% % % xlswrite('AnnovaExpe1.xlsx', A,1,'A2')

%% Depth Variance according to the distance R from the origin modality : PL

% p = anova1(VarDepthL(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)'); 
% boxplot(VarDepthL(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)','notch','on');
% xlabel('depth (m)','Fontsize',10,'FontWeight','bold')
% ylabel('Depth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaRDepthVariance ProprioceptiveLeft.pdf');
% 
% A = {'Distance R from the origin Proprioceptive Left modality','4',nbr_participant,'Depth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaRDepthVariancePL.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A3')

%% Depth Variance according to the distance R from the origin modality : PL
% 
% p = anova1(VarDepthV(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)'); 
% boxplot(VarDepthV(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)','notch','on');
% xlabel('depth (m)','Fontsize',10,'FontWeight','bold')
% ylabel('Depth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaRDepthVarianceV.pdf');
% A = {'Distance R from the origin Visual modality','4',nbr_participant,'Depth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaRDepthVarianceV.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A4')
%% Azimuth Variance according to the distance R from the origin modality : PR 

% p = anova1(VarAzimuthP(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)'); 
% boxplot(VarAzimuthP(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)','notch','on');
% xlabel('Azimuth (m)','Fontsize',10,'FontWeight','bold')
% ylabel('Azimuth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaRAzimuthVariancePR.pdf');
% 
% A = {'Distance R from the origin Proprioceptive Right modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaRAzimuthVariancePR.pdf'};
% xlswrite('AnnovaExpe1.xlsx', A,1,'A5')

%% Azimuth Variance according to the distance R from the origin modality : PL
% 
% p = anova1(VarAzimuthL(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)'); 
% boxplot(VarAzimuthL(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)','notch','on');
% xlabel('Azimuth (m)','Fontsize',10,'FontWeight','bold')
% ylabel('Azimuth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaRAzimuthVariance ProprioceptiveLeft.pdf');
% 
% A = {'Distance R from the origin Proprioceptive Left modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaRAzimuthVariancePL.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A6')
% 
%% Azimuth Variance according to the distance R from the origin modality : PL

% p = anova1(VarAzimuthV(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)'); 
% boxplot(VarAzimuthV(1:4,:)',sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)','notch','on');
% xlabel('Azimuth (m)','Fontsize',10,'FontWeight','bold')
% ylabel('Azimuth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaRAzimuthVarianceV.pdf');
% 
% A = {'Distance R from the origin Visual modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaRAzimuthVarianceV.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A7')
% 
%% Depth Variance according to the angle Theta from the body midline for the PR modality
% Theta = [calculTheta(TargetSimpleXF(3),TargetSimpleZF(3)) calculTheta(TargetSimpleXF(5),TargetSimpleZF(5)) calculTheta(TargetSimpleXF(6),TargetSimpleZF(6)) calculTheta(TargetSimpleXF(7),TargetSimpleZF(7))];
% Theta = Theta*(360/(2*pi));
% Theta = Theta*-1;
% Theta = Theta+90*ones(1,4);
% 
% p = anova1([VarDepthP(3,:)' VarDepthP(5:7,:)'],Theta); 
% boxplot([VarDepthP(3,:)' VarDepthP(5:7,:)'],Theta,'notch','on');
% xlabel('Theta (°)','Fontsize',10,'FontWeight','bold')
% ylabel('Depth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaThetaDepthVariancePR.pdf');
% 
% A = {'Angle Theta in degree from the body midline for the proprioceptive right modality','4',nbr_participant,'Depth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaDepthVariancePR.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A8')
%% Depth Variance according to the angle Theta from the body midline for the PL modality
% Theta = [calculTheta(TargetSimpleXF(3),TargetSimpleZF(3)) calculTheta(TargetSimpleXF(5),TargetSimpleZF(5)) calculTheta(TargetSimpleXF(6),TargetSimpleZF(6)) calculTheta(TargetSimpleXF(7),TargetSimpleZF(7))];
% Theta = Theta*(360/(2*pi));
% Theta = Theta*-1;
% Theta = Theta+90*ones(1,4);
% 
% p = anova1([VarDepthL(3,:)' VarDepthL(5:7,:)'],Theta); 
% boxplot([VarDepthL(3,:)' VarDepthL(5:7,:)'],Theta,'notch','on');
% xlabel('Theta (°)','Fontsize',10,'FontWeight','bold')
% ylabel('Depth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaThetaDepthVariancePL.pdf');
% 
% A = {'Angle Theta in degree from the body midline for the proprioceptive left modality','4',nbr_participant,'Depth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaDepthVariancePL.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A9')

%% Depth Variance according to the angle Theta from the body midline for the PL modality
% Theta = [calculTheta(TargetSimpleXF(3),TargetSimpleZF(3)) calculTheta(TargetSimpleXF(5),TargetSimpleZF(5)) calculTheta(TargetSimpleXF(6),TargetSimpleZF(6)) calculTheta(TargetSimpleXF(7),TargetSimpleZF(7))];
% Theta = Theta*(360/(2*pi));
% Theta = Theta*-1;
% Theta = Theta+90*ones(1,4);

% p = anova1([VarDepthV(3,:)' VarDepthV(5:7,:)'],Theta); 
% boxplot([VarDepthV(3,:)' VarDepthV(5:7,:)'],Theta,'notch','on');
% xlabel('Theta (°)','Fontsize',10,'FontWeight','bold')
% ylabel('Depth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaThetaDepthVarianceV.pdf');
% 
% A = {'Angle Theta in degree from the body midline for the visual modality','4',nbr_participant,'Depth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaDepthVarianceV.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A10')
%% Azimuth Variance according to the angle Theta from the body midline for the PR modality
% Theta = [calculTheta(TargetSimpleXF(3),TargetSimpleZF(3)) calculTheta(TargetSimpleXF(5),TargetSimpleZF(5)) calculTheta(TargetSimpleXF(6),TargetSimpleZF(6)) calculTheta(TargetSimpleXF(7),TargetSimpleZF(7))];
% Theta = Theta*(360/(2*pi));
% Theta = Theta*-1;
% Theta = Theta+90*ones(1,4);
% 
% p = anova1([VarAzimuthP(3,:)' VarAzimuthP(5:7,:)'],Theta); 
% boxplot([VarAzimuthP(3,:)' VarAzimuthP(5:7,:)'],Theta,'notch','on');
% xlabel('Theta (°)','Fontsize',10,'FontWeight','bold')
% ylabel('Azimuth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaThetaAzimuthVariancePR.pdf');
% 
% A = {'Angle Theta in degree from the body midline for the proprioceptive right modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaAzimuthVariancePR.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A11')
%% Azimuth Variance according to the angle Theta from the body midline for the PL modality
% Theta = [calculTheta(TargetSimpleXF(3),TargetSimpleZF(3)) calculTheta(TargetSimpleXF(5),TargetSimpleZF(5)) calculTheta(TargetSimpleXF(6),TargetSimpleZF(6)) calculTheta(TargetSimpleXF(7),TargetSimpleZF(7))];
% Theta = Theta*(360/(2*pi));
% Theta = Theta*-1;
% Theta = Theta+90*ones(1,4);
% 
% p = anova1([VarAzimuthL(3,:)' VarAzimuthL(5:7,:)'],Theta); 
% boxplot([VarAzimuthL(3,:)' VarAzimuthL(5:7,:)'],Theta,'notch','on');
% xlabel('Theta (°)','Fontsize',10,'FontWeight','bold')
% ylabel('Azimuth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaThetaAzimuthVariancePL.pdf');
% 
% A = {'Angle Theta in degree from the body midline for the proprioceptive left modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaAzimuthVariancePL.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A12')

%% Azimuth Variance according to the angle Theta from the body midline for the PL modality
% Theta = [calculTheta(TargetSimpleXF(3),TargetSimpleZF(3)) calculTheta(TargetSimpleXF(5),TargetSimpleZF(5)) calculTheta(TargetSimpleXF(6),TargetSimpleZF(6)) calculTheta(TargetSimpleXF(7),TargetSimpleZF(7))];
% Theta = Theta*(360/(2*pi));
% Theta = Theta*-1;
% Theta = Theta+90*ones(1,4);
% 
% p = anova1([VarAzimuthV(3,:)' VarAzimuthV(5:7,:)'],Theta); 
% boxplot([VarAzimuthV(3,:)' VarAzimuthV(5:7,:)'],Theta,'notch','on');
% xlabel('Theta (°)','Fontsize',10,'FontWeight','bold')
% ylabel('Azimuth Variance (m²)','Fontsize',12,'FontWeight','bold')
% export_fig('AnovaThetaAzimuthVarianceV.pdf');
% 
% A = {'Angle Theta in degree from the body midline for the visual modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaAzimuthVarianceV.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A13')

%% Aire of confidence ellipse according to depth in the proprioceptive modality
Aire = ones(nbr_participant,4);
for i = 1:1:4
    for k=1:1:nbr_participant
        [aire,~,~,~] = CalculAireOrientation95([VarDepthP(i,k),CovaDPP(i,k);CovaDPP(i,k),VarAzimuthP(i,k)]);
        Aire(k,i) = aire;
        %         Aire(k,i) = VarDepthP(i,k)*VarAzimuthP(i,k);
    end
end 
p = anova1(Aire,sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)'); 
boxplot(Aire(1:4,:),sqrt(TargetSimpleXF(1:TargetNbr-3).^2+TargetSimpleZF(1:TargetNbr-3).^2)','notch','on');
xlabel('depth (m) ','Fontsize',10,'FontWeight','bold')
ylabel('confidence ellipse area (m²)','Fontsize',12,'FontWeight','bold')
export_fig('AnovaDepthConfidenceArea.pdf');
A = {'Distance R from the origin Proprioceptive Right modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaAzimuthVarianceV.pdf'};
% % xlswrite('AnnovaExpe1.xlsx', A,1,'A14')
%% Participants classement according to the sum of area

Aire = ones(7,nbr_participant); 

for k = 1:1:nbr_participant
    for i=1:1:7 
        [aire,~,~,~] = CalculAireOrientation95([VarDepthV(i,k),CovaDPV(i,k);CovaDPV(i,k),VarAzimuthV(i,k)]);
        Aire(i,k) = aire;
    end
end 

p = anova1(Aire);
boxplot(Aire,1:1:5,'notch','on');
xlabel('Participants','Fontsize',10,'FontWeight','bold')
ylabel('confidence ellipse area (m²)','Fontsize',12,'FontWeight','bold')
export_fig('AnovaParticipantsConfidenceArea.pdf');
A = {'Distance R from the origin Proprioceptive Right modality','4',nbr_participant,'Azimuth variance (m²)',p,'C:\Users\maxle\OneDrive\Documents\MATLAB\matlabPropExpe1_V2\matlab_proprioceptive_experiment\AnovaThetaAzimuthVarianceV.pdf'};

end