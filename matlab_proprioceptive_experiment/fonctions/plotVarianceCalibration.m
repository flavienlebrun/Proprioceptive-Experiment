function [] = plotVarianceCalibration(Possort)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
sizeP = size(Possort);
plotting_data = ones(4,sizeP(1));
for k=2:1:sizeP(1)
    [ecarttype,moyenne,max,min] = VarianceEval(Possort,k);
    plotting_data(1,k) = ecarttype;
    plotting_data(2,k) = moyenne;
    plotting_data(3,k) = max;
    plotting_data(4,k) = min;
    
end




subplot(3,1,1)
plot(2:1:sizeP(1),plotting_data(1,2:sizeP(1)));
title('evaluation of the number of trial per target on the resulting variance');
xlabel('number of trial')
ylabel('standard deviation of variances')


subplot(3,1,2)
plot(2:1:sizeP(1),plotting_data(2,2:sizeP(1)));
xlabel('number of trial')
ylabel('average standard deviation')

hold on 
for i=2:sizeP(1)
    plot([i;i],[plotting_data(3,i);plotting_data(4,i)])
end
hold off

subplot(3,1,3)
plot(2:1:sizeP(1),plotting_data(3,2:sizeP(1)));
hold on
plot(2:1:sizeP(1),plotting_data(4,2:sizeP(1)));
xlabel('number of trial')
ylabel('minimum/maximum of standard deviation')
xlim([0.1 0.65]);
ylim([-0.2 0.2]);


end

