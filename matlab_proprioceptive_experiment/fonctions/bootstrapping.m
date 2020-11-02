function [Means,Variances] = bootstrapping(Pos,numberOfPicking)
nbr = numberOfPicking;
[length, ~] = size(Pos);
Means = zeros(length-1,1);
Variances = zeros(length-1,1);

for l=2:1:length
    Echantillons = zeros(l,nbr);
    variance = zeros(nbr,1);
    mean = zeros(nbr,1);
    for i=1:1:nbr  
        for k=1:1:l
            ptNumber = randi([1 length]);
            Echantillons(k,i) = Pos(ptNumber);
            mean(i) = mean(i) + Pos(ptNumber);
            
        end
        
        mean(i) = mean(i)/l;
        variance(i) = (Echantillons(:,i) - mean(i)*ones(l,1))'*(Echantillons(:,i) - mean(i)*ones(l,1));
        variance(i) = variance(i)/l;
    end
    
    Variances(l-1) = sum(variance)/nbr;
    Means(l-1) = sum(mean)/nbr;
    ecartType = 
end
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

end


