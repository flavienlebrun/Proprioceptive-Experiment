function [PointTarget,PointTargetNew,Trajectoire,ITB,ITT,ITE,vitesse,acceleration,temps,Indice,RedirectionAngle,centreDesTargets] = trouverLesBonPoints(filename,filename2,l,SecondPassage)
    
    if SecondPassage == 1
        [C_headerPosition,DataPosition,String] = lireDataPosition2(filename);
    else
        [C_headerPosition,DataPosition,String] = lireDataPosition(filename);
    end
    
    [C_headerExpe2,DataExpe2] = lireDataExpe2(filename2);
    TargetNumberGlobale = load('TargetNumberGlobal','TargetNumberGlobal');
    TargetNumberGlobal = TargetNumberGlobale.TargetNumberGlobal;
   % loop that take each reaching task and find the index of the begining,
   % the target touching and ending of the reaching task
    Trajectoire = [];
    startingPos = [];
    ITB = 1;%index starting
    ITT =1;%index entering target area
    ITE = 1;%index ending task
    ITTT = 1; %index Touching target
    Indice = [];
    PointTarget = [];
    IndiceTarget = [];
    for i=1:1:239
        ITB = ITE;
        while(DataPosition(ITB,7)<DataExpe2(i,9))
            ITB = ITB +1;
        end
        startingPos = [startingPos;DataPosition(ITB,3),DataPosition(ITB,6)];
        ITT=ITB;
        while(DataPosition(ITT,7)<DataExpe2(i,10))
            ITT = ITT +1;
        end
        ITE = ITT;

        while(DataPosition(ITE,7)<DataExpe2(i,11))
            ITE = ITE + 1;
        end

%         startingPos = [startingPos;DataPosition(ITE,3),DataPosition(ITE,6)];
        Trajectoire = [Trajectoire;DataPosition(ITB:ITE,3),DataPosition(ITB:ITE,6)];
        indiceTarget = 1;
        epsi = 0.01;
        compteur =0;
        ITTR = ITT;
        for k=ITT:1:ITE
            distance = pdist([DataPosition(k,3),DataPosition(k,6);DataPosition(k-1,3),DataPosition(k-1,6)],'euclidean');
            if (distance<epsi)
                compteur = compteur + 1;
            else
                compteur = 0;
            end
            if compteur == 5
                ITTR = k;
                compteur = 0;
            end
        end

        PositionX = DataPosition(ITB:ITE,3);
        PositionY = DataPosition(ITB:ITE,6);
        temps = DataPosition(ITB:ITE,7);
        
        resol = 4;
        taille = ITE-ITB;
        tailleMillieu = ITT-ITB;

        [vitesse,acceleration] = plotVitesse(temps,PositionX,PositionY,resol);
        [psorP1,lsorP1] = findpeaks(vitesse(1:tailleMillieu),'SortStr','descend');
        [psorP2,lsorP2] = findpeaks(vitesse(tailleMillieu+1:taille),'SortStr','descend');
        [psor,lsor] = findpeaks(-vitesse,'SortStr','descend');
        
        maxVitesse1 = lsorP1(1);
        maxVitesse2 = tailleMillieu+lsorP2(1);
%         if lsorP(1)>lsorP(2)
%             maxVitesse1 = lsorP(2);
%             maxVitesse2 = lsorP(1);
%         else
%             maxVitesse1 = lsorP(1);
%             maxVitesse2 = lsorP(2);
%         end
        t=0;
        while(t<10&&lsor(1)<maxVitesse1||lsor(1)>maxVitesse2)
            lsor = [lsor(2:length(lsor));lsor(1)];
            t=t+1;
        end
        PointTarget = [PointTarget;DataPosition(ITB+lsor(1),3),DataPosition(ITB+lsor(1),6)];
        ITTT = ITB+lsor(1);
        Indice = [Indice;ITB,ITT,ITE,ITTT];
%         figure(2*i)
%         scatter(temps,acceleration);
% 
%         figure(2*i+1)
%         scatter(temps,vitesse);
%         hold on
%         scatter(temps(ITTT-ITB),vitesse(ITTT-ITB),'red')
%         
%         hold off
        
%         figure(i)
%         scatter(DataPosition(ITB:ITE,3),DataPosition(ITB:ITE,6));
%         hold on
%         scatter(DataPosition(ITB+lsor(1),3),DataPosition(ITB+lsor(1),6),'red');
%         hold off
    end
%     figure(l)
%     scatter(PointTarget(:,1),PointTarget(:,2))
    [minX,iminX] = min(PointTarget(:,1));
    [minY,iminY] = min(PointTarget(:,2));
    [maxX,immaxX] = max(PointTarget(:,1));
    [maxY,imaxY] = max(PointTarget(:,2));
    
    meanNuage = [PointTarget(iminX,1),PointTarget(iminX,2)];
    distmean = 1000000000;
    Compteur = zeros(length(PointTarget),1);
  
    for s=1:1:length(PointTarget)
        compteur =0;
        for p=1:1:length(PointTarget)
            if pdist([PointTarget(s,1),PointTarget(s,2);PointTarget(p,1),PointTarget(p,2)])<0.05
                compteur = compteur + 1;
            end
        end
        Compteur(s) = compteur;
        
    end
    PointTargetNew = [];
    for s=1:1:length(Compteur)
        if (mean(Compteur)-Compteur(s))<3*std(Compteur)
            PointTargetNew = [PointTargetNew;PointTarget(s,:)];
        end
    end    
%     figure(3)
%     scatter(PointTargetNew(:,1),PointTargetNew(:,2))
%% find the center of Target
    centreDesTargets = [];
    PointTargetNewNew = PointTargetNew;
    
    for h=1:1:4
        posH = [];
        [minX,iminX] = min(PointTargetNewNew(:,1));
        centreDesTargets(h,:) = [PointTargetNewNew(iminX,1) PointTargetNewNew(iminX,2)];
        posH = [posH;centreDesTargets(h,:)];
        trucAgarder = [];
        for s=1:1:length(PointTargetNewNew)
            if pdist([centreDesTargets(h,1),centreDesTargets(h,2);PointTargetNewNew(s,1),PointTargetNewNew(s,2)])<0.05
                posH = [posH;PointTargetNewNew(s,1),PointTargetNewNew(s,2)];
                centreDesTargets(h,:) = mean(posH);
            
            else
                trucAgarder = [trucAgarder;PointTargetNewNew(s,1),PointTargetNewNew(s,2)];
            end
        end
        PointTargetNewNew = trucAgarder;
        if h<4
%             figure(l+h)
%             scatter(trucAgarder(:,1),trucAgarder(:,2))
        else
            trucAgarder
        end
   
        
    end
%     figure(l)
%     scatter(PointTargetNew(:,1),PointTargetNew(:,2))
%     hold on 
%     scatter(centreDesTargets(:,1),centreDesTargets(:,2))
%     hold on 
%     scatter(startingPos(:,1),startingPos(:,2))
%     xlim([-1.1 -0.4])
%     ylim([-1.3 -0.6])
%     hold off
    
    %% find the mediatrice of center 2 and 3
    A = centreDesTargets(2,:);
    B = centreDesTargets(3,:);
    I = (A+B)/2;
    AB = B-A;
    StartingPos = mean(startingPos);
    [PosChangeX,PosChangeZ] = changementDeReperePosition(PointTargetNew(:,1),PointTargetNew(:,2),StartingPos(1),StartingPos(2),I(1),I(2));
    [PosStartX,PosStartZ] = changementDeReperePosition(startingPos(:,1),startingPos(:,2),StartingPos(1),StartingPos(2),I(1),I(2));
    [centreDesTargets(:,1),centreDesTargets(:,2)] = changementDeReperePosition(centreDesTargets(:,1),centreDesTargets(:,2),StartingPos(1),StartingPos(2),I(1),I(2));
%     figure(l+1)
%     scatter(PointTargetNew(:,1),PointTargetNew(:,2))
%     hold on 
%     scatter(centreDesTargets(:,1),centreDesTargets(:,2))
%     hold on 
%     scatter(startingPos(:,1),startingPos(:,2))
%     xlim([-1.1 -0.4])
%     ylim([-1.3 -0.6])
%     hold on
%     fplot(@(x) (I(1)-x)*(AB(1)/AB(2))+I(2),[-5 5])
%     hold on
% 
%     scatter(StartingPos(1),StartingPos(2))
%     hold off
    
%     figure(l+2)
%     scatter(PosChangeX,PosChangeZ);
%     hold on
%     scatter(PosStartX,PosStartZ);
%     hold off
    [Trajectoire(:,1),Trajectoire(:,2)] = changementDeReperePosition(Trajectoire(:,1),Trajectoire(:,2),StartingPos(1),StartingPos(2),I(1),I(2));
   %% on essaye de faire commencer la trajectoire exactement à la position de départ
    DecalageDepart = 0;
    DecalageFin = 0;
    
%     for i=1:1:239
% %         on cherche le point de la trajectoire le plus proche du point de
% %         départ et on prend l'indice de ce point comme l'indice du départ
%         DecalageDepart = dsearchn(Trajectoire(Indice(i,1):Indice(i,4),:),[0 0]);
%         Indice(i,1) = Indice(i,1)+DecalageDepart; 
%     end

% Indice(239,3)
%     for i = 1:1:239
%         NumTarget = TargetNumberGlobal(i+1,l);
%         DecalageFin = dsearchn(Trajectoire(Indice(i,4):Indice(i,3),:),[centreDesTargets(NumTarget+1,1) centreDesTargets(NumTarget+1,2)]);
%         Indice(i,4) = Indice(i,4)+DecalageFin;
%         
%     end
% 
% 
%    
%    
%     
%     TargetNumberGlobal(4,l)
    RedirectionAngle = DataExpe2(:,5);
end
    