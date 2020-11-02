function [Target,DataTouchTarget] = FindTargetTrial(filename,k,AvantApres)
    if AvantApres == 1
        [C_header,Data,String] = lireDataPosition(filename);
    end
    if AvantApres == 2
        [C_header,Data,String] = lireDataPosition2(filename);
    end
    Booleen = string(String);
    firstExperiment = true;
    i = 0;
    while firstExperiment
        i = i+1;
        if Booleen(i,1) == "False"
            firstExperiment = false;
        end
    end
     
    Data = Data(i:end,:);
    Booleen = Booleen(i:end,:);
    DataTouchTarget = [];   
    NotAlreadyHold = true;
    for i= 1:1:length(Data)
        if Booleen(i,3) == "True"
            if NotAlreadyHold
                DataTouchTarget = [DataTouchTarget;Data(i,:)];
                NotAlreadyHold = false;
            end
        end
        if NotAlreadyHold == false
            if Booleen(i,3) == "False"
                NotAlreadyHold = true;
            end
        end
    end
    Target = zeros(60,4);
    DataToSort = [DataTouchTarget(:,3),DataTouchTarget(:,6)]
    for p=1:1:4
        PremierPoint = 0;
        xmin = DataToSort(1,1);
        for i=2:1:length(DataToSort)
            if DataToSort(i,1)<xmin
                PremierPoint = i;
                xmin = DataToSort(i,1);
            end
        end
        Nuage = [DataToSort(PremierPoint,1),DataToSort(PremierPoint,2)];
        DataToSort(PremierPoint,1) = 10000000000000;
        DataToSort(PremierPoint,2) = 10000000000000;
        Target(1,p) = PremierPoint;
    % calcul des 60 points les plus proches des cibles  
        for m =2:1:60
            distmin = 10000000000000000;
            iMin = 0;
            for i=1:1:240
                if i~=PremierPoint
                moyenne = [mean(Nuage(:,1)),mean(Nuage(:,2))];
                distance = pdist([moyenne;DataToSort(i,1),DataToSort(i,2)],'euclidean');
                    if distance<distmin
                        distmin = distance;
                        iMin = i;
                    end
                end
            end
            Nuage = [Nuage;DataToSort(iMin,1),DataToSort(iMin,2)];
            DataToSort(iMin,1) = 10000000000000;
            DataToSort(iMin,2) = 10000000000000;
            Target(m,p) = iMin;
        end
        
    end
    figure(2*k)

    for m =1:1:60
        scatter(DataTouchTarget(Target(m,1),3),DataTouchTarget(Target(m,1),6),'red')
        hold on
    end       
    for m =1:1:60
        scatter(DataTouchTarget(Target(m,2),3),DataTouchTarget(Target(m,2),6),'green')
        hold on
    end
    for m =1:1:60
        scatter(DataTouchTarget(Target(m,3),3),DataTouchTarget(Target(m,3),6),'blue')
        hold on
    end 
    for m =1:1:60
        scatter(DataTouchTarget(Target(m,4),3),DataTouchTarget(Target(m,4),6),'black')
        hold on
    end  
    hold off