function [vitesse,acceleration] = plotVitesse(temps,PositionX,PositionY,resol)
vitesse = zeros(length(PositionX),1);
acceleration = zeros(length(PositionX),1);
for i =1:1:resol
    vitesse(i) = pdist([PositionX(i+resol),PositionY(i+resol);PositionX(i),PositionY(i)],'euclidean')/(temps(i+resol)-temps(i));    
end
for i=1:1:resol
    acceleration(i) = (vitesse(i+resol)-vitesse(i+resol))/(temps(i+resol)-temps(i)); 
end
for i = resol+1:1:length(PositionX)-resol 
    vitesse(i) = pdist([PositionX(i+resol),PositionY(i+resol);PositionX(i-resol),PositionY(i-resol)],'euclidean')/(temps(i+resol)-temps(i-resol));
end
for i = resol+1:1:length(PositionX)-resol 
    acceleration(i) = (vitesse(i+resol)-vitesse(i-resol))/(temps(i+resol)-temps(i-resol));
end
for i = length(PositionX)-resol:1:length(PositionX)
    vitesse(i) = pdist([PositionX(i),PositionY(i);PositionX(i-resol),PositionY(i-resol)],'euclidean')/(temps(i)-temps(i-resol));
end
for i = length(PositionX)-resol:1:length(PositionX)
    acceleration(i) = (vitesse(i)-vitesse(i-resol))/(temps(i)-temps(i-resol));
end


end