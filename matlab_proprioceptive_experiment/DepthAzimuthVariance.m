function [VarDepth,VarAzimuth,CovaDP] = DepthAzimuthVariance(PosTargetx,PosTargetz,Cov)
theta = calculTheta(PosTargetx,PosTargetz+0.1);
R = [cos(theta) sin(theta);-sin(theta) cos(theta)];
CovaPrime = R*Cov*R.';
VarDepth = CovaPrime(1,1);
VarAzimuth = CovaPrime(2,2);
CovaDP = CovaPrime(1,2);
end