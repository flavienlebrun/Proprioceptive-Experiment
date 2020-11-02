clear all
TargetNumberGlobal = [];
CandidatPosition = [10,11,12,13,14,15,16,17,18,19,20,21];
for l=1:1:12
    k = CandidatPosition(l);
    m = k-9;
    iStr = int2str(k);
    filename = strcat('Data/positionExpe2Part0',iStr);
    filename = strcat(filename,'.txt');
    if k == 16 | k == 17
        AvantApres = 2;
    else
        AvantApres = 1;
    end
    [Target,DataTouchTarget] = FindTargetTrial(filename,k,AvantApres);
    
    for j=1:1:240
        for p=1:1:4
            for r=1:1:60
                if Target(r,p) ==j
                    TargetNumberGlobal(j,m)=p-1;
                end
            end
        end
    end
end
save('TargetNumberGlobal.mat','TargetNumberGlobal');