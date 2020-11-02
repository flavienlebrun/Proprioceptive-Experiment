function [densityPoint] = BivarNormalDistr(sigmax,sigmaz,Rho,x,z,xcenter,zcenter)
w = ((x-xcenter)*(x-xcenter)/sigmax)-((2*Rho*(x - xcenter)*(z - zcenter))/(sqrt(sigmax)*sqrt(sigmaz)))+((z - zcenter)*(z - zcenter)/sigmaz);
densityPoint = (1/(2*pi*sqrt(sigmax)*sqrt(sigmaz)*sqrt(1-(Rho*Rho))))*exp(-w/(2*(1-(Rho*Rho))));
