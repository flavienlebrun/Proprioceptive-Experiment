clear all
%% experiment caracterisation
TargetNbr = 6;
TrialNbr = 12;

%% data recuperation 
filename = 'Flavien_18_10_complete.txt';
Data = lire_data(filename);
Data = [Data];
    
PosX = Data(:,1);
PosY = Data(:,2);
PosZ = Data(:,3);
Target = Data(:,4);
Condition = Data(:,5);

%% sorting data by target and condition

[length,l] = size(Condition);

% new vector with result sorted
AlreadyAimed = ones(3*TargetNbr,1);
PosXsort = ones(length,1);
PosYsort = ones(length,1);
PosZsort = ones(length,1);

for i = 1:1:length
     condition = Condition(i);
     target = Target(i);
     pos = TrialNbr*target + AlreadyAimed(1 + target + (condition-1)*TargetNbr) + (TrialNbr*TargetNbr)*(condition-1);
     arrayIndice1 = 1 + target + (condition-1)*TargetNbr;
     
     PosXsort(pos) = PosX(i);
     PosYsort(pos) = PosY(i);
     PosZsort(pos) = PosZ(i);
     
     AlreadyAimed(1 + target + (condition-1)*TargetNbr) = AlreadyAimed(1 + target + (condition-1)*TargetNbr) + 1;
     
end

%% Calculate the center
Xcenter = zeros(TargetNbr*3,1);
Zcenter = zeros(TargetNbr*3,1);
for i = 1:1:TargetNbr*3
    if i==1
       A = [ones(1,TrialNbr) zeros(1,(TargetNbr*3 - 1)*TrialNbr)];
    else
        A = [zeros(1,TrialNbr*(i-1)) ones(1,TrialNbr) zeros(1,(TargetNbr*3-i)*TrialNbr)];
    end
    Xcenter(i) = (A * PosXsort)/TrialNbr;
    Zcenter(i) = (A * PosZsort)/TrialNbr;
    
end

%% Calculate the unidimensionnal variance
sigmaX = zeros(TargetNbr*3,1);
sigmaZ = zeros(TargetNbr*3,1);
for i = 1:1:TargetNbr*3
    for k = 1:1:TrialNbr
        sigmaX(i) = sigmaX(i) + (PosXsort(k+(i-1)*TrialNbr) - Xcenter(i)) * (PosXsort(k+(i-1)*TrialNbr) - Xcenter(i));
        sigmaZ(i) = sigmaZ(i) + (PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)) * (PosZsort(k+(i-1)*TrialNbr) - Zcenter(i));
    end
    sigmaX(i) = sigmaX(i)/TrialNbr;
    sigmaZ(i) = sigmaZ(i)/TrialNbr;
end

%% Plot the unidimensionnal variance
for i = 1:1:TargetNbr*3
    x =Xcenter(i)-0.005:0.0001:Xcenter(i)+0.005;
    z = Zcenter(i)-0.005:0.0001:Zcenter(i)+0.005;
    figure(i)
    %plot(x,gaussmf(x,[sigmaX(i) Xcenter(i)]))
    figure(i+TargetNbr*3)
    %plot(z,gaussmf(z,[sigmaZ(i) Zcenter(i)]))
end

%% Calculate the correlation coefficient
rho = zeros(TargetNbr*3,1);
for i = 1:1:TargetNbr*3
    for k=1:1:TrialNbr
        rho(i) = rho(i) + ((PosXsort(k+(i-1)*TrialNbr) - Xcenter(i))*(PosZsort(k+(i-1)*TrialNbr) - Zcenter(i)));

    end
    rho(i) = rho(i)/(sqrt(sigmaX(i))*sqrt(sigmaZ(i))*TrialNbr);
end


%% probability density function of (x,y)
xbegin = 0;
xend = 1.5;
zbegin = 0;
pas = 0.005;
nbrpoint = (xend - xbegin)/pas;
zend = pas*nbrpoint + zbegin;
F = cell(5);


for i = 1:1:TargetNbr*3
    f = zeros(TargetNbr,TargetNbr);
    for z = 1:1:(nbrpoint+1)
        for x = 1:1:(nbrpoint+1)
            f(x,z) =BivarNormalDistr(sigmaX(i),sigmaZ(i),rho(i),xbegin+(x-1)*pas,zbegin+(z-1)*pas,Xcenter(i),Zcenter(i));

        end
    end
    F{i} = f;
end

x = xbegin:pas:xend;
z = zbegin:pas:zend;
%figure(1)
for i = 1:1:TargetNbr
    %mesh(x,z,F{i});
   % hold on
end
%figure(2)
for i = TargetNbr+1:1:TargetNbr*2
    %mesh(x,z,F{i});
    %hold on
end
%figure(3)
for i = TargetNbr*2+1:1:TargetNbr*3
    %mesh(x,z,F{i});
    %hold on
end

%% calcul of real sigma for each modality

sigmaXProD = (1/2)*(sigmaX((TargetNbr*2)+1:TargetNbr*3)+sigmaX(1:TargetNbr)-sigmaX(TargetNbr+1:TargetNbr*2));
sigmaXProL = (1/2)*(sigmaX((TargetNbr*2)+1:TargetNbr*3)+sigmaX(TargetNbr+1:TargetNbr*2)-sigmaX(1:TargetNbr));
sigmaXVisu = (1/2)*(sigmaX(TargetNbr+1:TargetNbr*2)+sigmaX(1:TargetNbr)-sigmaX((TargetNbr*2)+1:TargetNbr*3));

sigmaZProD = (1/2)*(sigmaZ((TargetNbr*2)+1:TargetNbr*3)+sigmaZ(1:TargetNbr)-sigmaZ(TargetNbr+1:TargetNbr*2));
sigmaZProL = (1/2)*(sigmaZ((TargetNbr*2)+1:TargetNbr*3)+sigmaZ(TargetNbr+1:TargetNbr*2)-sigmaZ(1:TargetNbr));
sigmaZVisu = (1/2)*(sigmaZ(TargetNbr+1:TargetNbr*2)+sigmaZ(1:TargetNbr)-sigmaZ((TargetNbr*2)+1:TargetNbr*3));

rhoProD = (sigmaX((TargetNbr*2)+1:TargetNbr*3).*sigmaZ((TargetNbr*2)+1:TargetNbr*3).*rho((TargetNbr*2)+1:TargetNbr*3)...
            +sigmaX(1:TargetNbr).*sigmaZ(1:TargetNbr).*rho(1:TargetNbr)...
            -sigmaX(TargetNbr+1:TargetNbr*2).*sigmaZ(TargetNbr+1:TargetNbr*2).*rho(TargetNbr+1:TargetNbr*2))...
            /(sqrt(sigmaXProD).*sqrt(sigmaZProD));
rhoProL = (sigmaX((TargetNbr*2)+1:TargetNbr*3).*sigmaZ((TargetNbr*2)+1:TargetNbr*3).*rho((TargetNbr*2)+1:TargetNbr*3)...
            -sigmaX(1:TargetNbr).*sigmaZ(1:TargetNbr).*rho(1:TargetNbr)...
            +sigmaX(TargetNbr+1:TargetNbr*2).*sigmaZ(TargetNbr+1:TargetNbr*2).*rho(TargetNbr+1:TargetNbr*2))...
            /(sqrt(sigmaXProL).*sqrt(sigmaZProL));
rhoProV = (-sigmaX((TargetNbr*2)+1:TargetNbr*3).*sigmaZ((TargetNbr*2)+1:TargetNbr*3).*rho((TargetNbr*2)+1:TargetNbr*3)...
            +sigmaX(1:TargetNbr).*sigmaZ(1:TargetNbr).*rho(1:TargetNbr)...
            +sigmaX(TargetNbr+1:TargetNbr*2).*sigmaZ(TargetNbr+1:TargetNbr*2).*rho(TargetNbr+1:TargetNbr*2))...
            /(sqrt(sigmaXVisu).*sqrt(sigmaZVisu));
        
%% plot of sigma on a surface
figure(1)
[xq,yq] = meshgrid(-8:.4:8, -2:.4:14);
x = [0;3.333;-3.333;-6.666;0;6.666];
y = [0;5.833336;5.833336;11.666666;11.666666;11.666666];
vq = griddata(x,y,sigmaZProD,xq,yq,'cubic');


mesh(xq,yq,vq);
hold on
plot3(x,y,sigmaZProD,'o');
title('distrubution of the variance along x direction');
xlabel('x coordinate of target')
ylabel('y coordinate of target')
zlabel('variance value')

xlim([-8 8]);
ylim([-2 14]);
