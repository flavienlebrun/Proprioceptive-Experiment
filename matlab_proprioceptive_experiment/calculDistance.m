function [distanceP,distanceV,CovaPV,CovaV,CovaP] = calculDistance(alpha,R,thetaRad,COVA,COVAamelio,part)
% distance,distanceAmelio
cova = COVA(part,:);
covaAmelio = COVAamelio(part,:);
varVx = 0;
varVy = 0;
varPx = 0;
varPy = 0;

testCommit = 0;

thetaVisu = thetaRad+alpha;
for r=0:0.1:1
    varVx = varVx + exp(cova(1)+exp(cova(2))*r+cova(3)*thetaVisu+cova(37)*r*thetaVisu);
    varVy = varVy + exp(cova(4)+exp(cova(5))*r+cova(6)*thetaVisu+cova(38)*r*thetaVisu);
    varPx = varPx + exp(cova(7)+exp(cova(8))*r+cova(9)*thetaRad+cova(39)*r*thetaRad);
    varPy = varPy + exp(cova(10)+exp(cova(11))*r+cova(12)*thetaRad+cova(40)*r*thetaRad);


end

varVx = varVx/11;
varVy = varVy/11;
varPx = varPx/11;
varPy = varPy/11;
% corrV = 0;
% corrP = 0;
corrV = atan(covaAmelio(1)+covaAmelio(2)*thetaRad)/(pi/2);
corrP = atan(covaAmelio(3)+covaAmelio(4)*thetaRad)/(pi/2); 
CovaV = [varVx,corrV*sqrt(varVx*varVy);corrV*sqrt(varVx*varVy),varVy];
CovaP = [varPx,corrP*sqrt(varPx*varPy);corrP*sqrt(varPx*varPy),varPy];
% figure(part)
% for r=0.3:0.1:0.6
%     cVp = [cova(19)+cova(25)*r+cova(26)*thetaVisu,cova(20)+cova(27)*r+cova(28)*thetaVisu]; 
%     cPp = [cova(21)+r*cova(29)+cova(30)*thetaRad,cova(22)+r*cova(31)+cova(32)*thetaRad];
%    [yIv,xIv] = pol2cart(thetaVisu,r);
%    centreV = [xIv+cVp(1) yIv+cVp(2)];
%    elpt4 = ellipsedata(CovaV,centreV,100,[3]);
%    plot(elpt4(:,1:2:end),elpt4(:,2:2:end),'color','red');
%    hold on
%    [yIp,xIp] = pol2cart(thetaRad,r);
%    centreP = [xIp+cPp(1) yIp+cPp(2)]
%    elpt4 = ellipsedata(CovaP,centreP,100,[3]);
%    plot(elpt4(:,1:2:end),elpt4(:,2:2:end),'color','green');
%    hold on
%    CovaPV = inv((inv(CovaV)+inv(CovaP)));
%    centrePV = CovaPV*(inv(CovaV)*centreV'+inv(CovaP)*centreP');
%  
%    elpt4 = ellipsedata(CovaPV,centrePV,100,[3]);
%    plot(elpt4(:,1:2:end),elpt4(:,2:2:end),'color','blue');
% 
% end
    cVp = [cova(19)+cova(25)*R+cova(26)*thetaVisu,cova(20)+cova(27)*R+cova(28)*thetaVisu]; 
    cPp = [cova(21)+R*cova(29)+cova(30)*thetaRad,cova(22)+R*cova(31)+cova(32)*thetaRad];
   [yIv,xIv] = pol2cart(thetaVisu,R);
   centreV = [xIv+cVp(1) yIv+cVp(2)];
%    centreV = [xIv yIv];
   [yIp,xIp] = pol2cart(thetaRad,R);
   centreP = [xIp+cPp(1) yIp+cPp(2)];
%     centreP = [xIp yIp];
   CovaPV = inv((inv(CovaV)+inv(CovaP)));
   centrePV = CovaPV*(inv(CovaV)*centreV'+inv(CovaP)*centreP');
   distanceP = pdist([centreP';centrePV],'euclidean');
   distanceV = pdist([centreV';centrePV],'euclidean');
%    ylim([0 0.7])
%    xlim([-0.15 0.4])
%    hold off
end