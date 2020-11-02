function buttonPlot
% Create a figure window
fig = uifigure;

% Create a UI axes
ax = uiaxes('Parent',fig,...
            'Units','pixels',...
            'Position', [104, 123, 300, 201]);   
participantNumber = 10;
% Create a push button
btn = uibutton(fig,'push',...
               'Position',[420, 218, 100, 22],...
               'ButtonPushedFcn', @(btn,event) plotButtonPushed(btn,ax,participantNumber));


end

% Create the function for the ButtonPushedFcn callback
function plotButtonPushed(btn,ax,participantNumber)

        iStr = int2str(participantNumber);
        TargetNumberGlobale = load('TargetNumberGlobal','TargetNumberGlobal');
        TargetNumberGlobal = TargetNumberGlobale.TargetNumberGlobal;
        
        filename = strcat('Data/RedirectionAngle/RedirectionAngle',iStr);
        filename = strcat(filename,'.mat');
        RedirectionAnglee = load(filename,'RedirectionAngle');
        RedirectionAngle = RedirectionAnglee.RedirectionAngle;
        
        filename = strcat('Data/Trajectoire/Trajectoire',iStr);
        filename = strcat(filename,'.mat');
        Trajectoiree = load(filename,'Trajectoire');
        Trajectoire = Trajectoiree.Trajectoire;
        
        filename = strcat('Data/Indice/Indice',iStr);
        filename = strcat(filename,'.mat');
        Indicee = load(filename,'Indice');
        Indice = Indicee.Indice;
        
        filename = strcat('Data/centreDesTargets/centreDesTargets',iStr);
        filename = strcat(filename,'.mat');
        centreDesTargetse = load(filename,'centreDesTargets');
        centreDesTargets = centreDesTargetse.centreDesTargets;



    previous = 1;
    for i=1:1:239
        
        NombreDePoints = Indice(i,3)-Indice(i,1);
        NombreDePointsT = Indice(i,4)-Indice(i,1);
        if RedirectionAngle(i)==-0.226892800000000
            figure(i) 
            c = linspace(1,10,length(Trajectoire(previous:previous+NombreDePointsT,1)));
            scatter(Trajectoire(previous:previous+NombreDePointsT,1),Trajectoire(previous:previous+NombreDePointsT,2),[],c,'.')
            hold on
            scatter(centreDesTargets(:,1),centreDesTargets(:,2),'*')
            hold off
            xlim([-0.3 0.3])
            ylim([-0.05 0.6])
        end
        previous = previous +NombreDePoints+1;

end
% clear g
% g(1,1)=gramm('x',x,'y',y,'color',c);
% g(1,2)=copy(g(1));
% g(2,1)=copy(g(1));
% g(2,2)=copy(g(1));
% g(3,3)=copy(g(1));
% 
% g(1,1).geom_point();
% g(1,1).set_title('geom_point()');
% 
% g(1,2).geom_line();
% g(1,2).set_title('geom_line()');
% 
% g(2,1).stat_smooth();
% g(2,1).set_point_options('base_size',3);
% g(2,1).set_title('stat_smooth()');
% 
% 
% g(2,2).stat_summary();
% g(2,2).set_title('stat_summary()');
% 
% g.set_title('Visualization of repeated trajectories ');
% 
% figure('Position',[100 100 800 550]);
% g.draw(); 

