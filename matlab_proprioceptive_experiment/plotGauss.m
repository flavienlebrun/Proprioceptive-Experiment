close all
figure(1)
plot(0:0.01:30,gaussmf(0:0.01:30,[2 5])/2*sqrt(2*pi))
hold on 
plot(0:0.01:30,gaussmf(0:0.01:30,[3 15])/5*sqrt(2*pi))
hold on
plot(0:0.01:30,gaussmf(0:0.01:30,[1 8])/1*sqrt(2*pi))
set(gca,'Visible','off');