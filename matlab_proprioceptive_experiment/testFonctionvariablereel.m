%% we create three bivariate gaussian defined by their covariance matrix

B = [0.001,0.0005;0.0005,0.002];
A = [0.002,0.0009;0.0009,0.001];
C = [0.006,0.0014;0.0014,0.001];
Br = mvnrnd([0 0],B,1050);
theta = calculTheta(0.5,0.5);
matRot = [cos(theta) -sin(theta);sin(theta) cos(theta)]
BrRot = Br*matRot;

%% we create ellipsoide according to those gaussian
elpt = ellipsedata(A,[0 0],100,[1,2,3]);
elpt2 = ellipsedata(B,[0 0],100,[1,2,3]);
elpt3 = ellipsedata(C,[0 0],100,[1,2,3]);

%% we create three combinations ie three probability fonction that are the sum of gaussian of those gaussians
AB = [B(1,1)+A(1,1),B(1,2) + A(1,2);B(1,2) + A(1,2),B(2,2)+A(2,2)];
AC = [C(1,1)+A(1,1),C(1,2) + A(1,2);C(1,2) + A(1,2),C(2,2)+A(2,2)];
BC = [B(1,1)+C(1,1),B(1,2) + C(1,2);B(1,2) + C(1,2),B(2,2)+C(2,2)];

%% we create distribution from those probability fonction
ABr = mvnrnd([0 0],AB,20);
ACr = mvnrnd([0 0],AC,20);
BCr = mvnrnd([0 0],BC,20);
elpt4 = ellipsedata(AB,[0 0],100,[1,2,3]);

%% calcul of variance and correlation coefficient for each distribution

% [sigmaX,sigmaZ,Xcenter,Zcenter,rho,cova,varReelX,varReelZ,rhoReel] = varianceCorrRhoTheta([ABr(:,1);ACr(:,1);BCr(:,1)],[ABr(:,2);ACr(:,2);BCr(:,2)],1,200);

varX1 =  abs(mean(bootstrp(10000,@var,ABr(:,1))));
varX2 =  abs(mean(bootstrp(10000,@var,ACr(:,1))));
varX3 =  abs(mean(bootstrp(10000,@var,BCr(:,1))));
varReelX = (1/2)*(varX2 + varX1 - varX3);

varZ1 =  abs(mean(bootstrp(10000,@var,ABr(:,2))));
varZ2 =  abs(mean(bootstrp(10000,@var,ACr(:,2))));
varZ3 =  abs(mean(bootstrp(10000,@var,BCr(:,2))));
varReelZ = (1/2)*(varZ2 + varZ1 - varZ3);    

cova1 = mean(bootstrp(10000,@cov,ABr));
cova1 = cova1(2);

cova2 = mean(bootstrp(10000,@cov,ACr));
cova2 = cova2(2);

cova3 = mean(bootstrp(10000,@cov,BCr));
cova3 = cova3(2);




calculrhoAB = cova1;
calculrhoAC = cova2;
calculrhoBC = cova3;

rhoReel = (1/2)* (calculrhoAB+calculrhoAC-calculrhoBC);
Anew = [varReelX,rhoReel;rhoReel,varReelZ];
elpt5 = ellipsedata(Anew,[0 0],100,[1,2,3]);


figure(1)
elpt2 = ellipsedata(inv(matRot)*B*matRot,[0 0],100,[1,2,3]);
plot(elpt2(:,1:2:end),elpt2(:,2:2:end));
hold on
scatter(BrRot(:,1),BrRot(:,2));
axis([-.5 0.5 -0.5 0.5])

ABnew = [varX1,cova1;cova1,varZ1];
elptNew = ellipsedata([ABnew(1) ABnew(2);ABnew(3) ABnew(4)],[0 0],100,[1,2,3]);
figure(1)
scatter(ABr(:,1),ABr(:,2));
hold on
plot(elpt4(:,1:2:end),elpt4(:,2:2:end));
hold on
plot(elptNew(:,1:2:end),elptNew(:,2:2:end));
export_fig testAlgo.pdf

hold off

figure(2)
plot(elpt5(:,1:2:end),elpt5(:,2:2:end));
hold on
plot(elpt(:,1:2:end),elpt(:,2:2:end));
export_fig testAlgo2.pdf
append_pdfs testAlgo.pdf testAlgo2.pdf
hold off


figure(1)

% plot(elpt(:,1:2:end),elpt(:,2:2:end));
% hold on
% plot(elpt2(:,1:2:end),elpt2(:,2:2:end));
% hold on
% plot(elpt3(:,1:2:end),elpt2(:,2:2:end));

plot(elpt4(:,1:2:end),elpt4(:,2:2:end));
hold on
scatter(ABr(:,1),ABr(:,2));


Anew = [varReelX,rhoReel;rhoReel,varReelZ];

elpt5 = ellipsedata(Anew,[0 0],100,[1,2,3]);
figure(2)
plot(elpt5(:,1:2:end),elpt2(:,2:2:end));
B = [25,0.5*(5*6);0.5*(5*6),36];
Br = mvnrnd([0 0],B,200);
elpt = ellipsedata(B,[0 0],100,[1,2,3]);
bootstat = bootstrp(10000,@cov,Br);
Bnew = mean(bootstat);
elptNew = ellipsedata([Bnew(1) Bnew(2);Bnew(3) Bnew(4)],[0 0],100,[1,2,3]);

figure(1)
scatter(Br(:,1),Br(:,2));
hold on
plot(elpt(:,1:2:end),elpt(:,2:2:end));
hold on
plot(elptNew(:,1:2:end),elptNew(:,2:2:end));


