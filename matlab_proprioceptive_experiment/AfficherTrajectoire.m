%% All the candidat from who we have the condition
clear all
close all
CandidatPosition = [10,11,12,13,14,15,16,18,19,20,21];

TargetNumberGlobale = load('TargetNumberGlobal','TargetNumberGlobal');
TargetNumberGlobal = TargetNumberGlobale.TargetNumberGlobal;
%% We plot the trajectory for all the candidat
for l=1:1:11
    % exctraction of the data
    k = CandidatPosition(l);
    m = k-9;
    iStr = int2str(k);
    filename = strcat('Data/DataPosition/positionExpe2Part0',iStr);
    filename = strcat(filename,'.txt');
    filename2 = strcat('Data/Expe2/expe2Part0',iStr);
    filename2 = strcat(filename2,'.txt');
    TargetPoint = [];
    PointTargetNew = [];
    Trajectoire = [];
    ITB = 0;
    ITT = 0;
    ITE = 0;
    vitesse = [];
    acceleration = [];
    RedirectionAngle = [];
    Indice = [];
    if k==16||k==17
        SecondPassage = 1;
    else 
        SecondPassage = 0;
    end
    [PointTarget,PointTargetNew,Trajectoire,ITB,ITT,ITE,vitesse,acceleration,temps,Indice,RedirectionAngle,centreDesTargets] = trouverLesBonPoints(filename,filename2,l,SecondPassage);
    
 
    Angle = [-0.226892800000000,-0.174532900000000,-0.139626300000000,-0.104719800000000,-0.0872664700000000,-0.0698131700000000,-0.0349065800000000,0,0.0349065800000000,0.0698131700000000,0.0872664700000000,0.104719800000000,0.139626300000000,0.174532900000000,0.226892800000000];
%     OrganiseParAngle = [];
%     for i = 1:1:length(Angle)
%         IndiceAngle = find(RedirectionAngle == Angle(i));
%         IndiceAngle = IndiceAngle + ones(length(IndiceAngle),1);
%         if IndiceAngle(16) == 241
%             IndiceAngle(16) = 1;
%         end
%         OrganiseParAngle = [OrganiseParAngle IndiceAngle];
%     end           
%     c = linspace(1,10,length(Trajectoire(Indice(1,3)-Indice(1,1)+1:Indice(1,3)-Indice(1,1),1)));
%     scatter(Trajectoire(Indice(1,3)-Indice(1,1)+1:Indice(1,3)-Indice(1,1),1),Trajectoire(Indice(1,3)-Indice(1,1)+1:Indice(1,3)-Indice(1,1),2),[],c)
%     hold on
%     scatter(centreDesTargets(:,1),centreDesTargets(:,2),'*')
%     hold off
%     xlim([-0.3 0.3])
%     ylim([-0.05 0.6])
   

%     previous = 1;
%     for i=1:1:239
%         
%         NombreDePoints = Indice(i,3)-Indice(i,1);
%         NombreDePointsT = Indice(i,4)-Indice(i,1);
%         if RedirectionAngle(i)==-0.226892800000000
%             figure(i) 
%             c = linspace(1,10,length(Trajectoire(previous:previous+NombreDePointsT,1)));
%             scatter(Trajectoire(previous:previous+NombreDePointsT,1),Trajectoire(previous:previous+NombreDePointsT,2),[],c,'.')
%             hold on
%             scatter(centreDesTargets(:,1),centreDesTargets(:,2),'*')
%             hold off
%             xlim([-0.3 0.3])
%             ylim([-0.05 0.6])
%         end
%         previous = previous +NombreDePoints+1;
% 
%        if RedirectionAngle(i+1)==0.226892800000000
%             figure(i)
%             scatter(Trajectoire(Indice(i,1):Indice(i,4),1),Trajectoire(Indice(i,1):Indice(i,4),2),'.','red')
%             hold on
%             scatter(centreDesTargets(:,1),centreDesTargets(:,2),'*')
%             hold off
%        end
%        
%     end
filename = strcat('Data/Trajectoire/Trajectoire',iStr);
filename = strcat(filename,'.mat');
save(filename,'Trajectoire')
filename = strcat('Data/RedirectionAngle/RedirectionAngle',iStr);
filename = strcat(filename,'.mat');
save(filename,'RedirectionAngle')
filename = strcat('Data/Indice/Indice',iStr);
filename = strcat(filename,'.mat');
save(filename,'Indice')
filename = strcat('Data/centreDesTargets/centreDesTargets',iStr);
filename = strcat(filename,'.mat');
save(filename,'centreDesTargets')

   
end
        


  