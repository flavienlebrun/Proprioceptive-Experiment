function [] = VisuFinal2D(k,pas,min,max,PosTargetXsortF,PosTargetZsortF,varASommeX,varASommeZ,covaASomme,TrialNbr)
AIRE = [];
indicex = 0;
k = 5.991;
pas = 0.02;
min = 0;
max = 0.4

%% calcul et plot pour chaque position choisie sur la grille des surfaces et des direction principales
%% des ellipses au niveau de confiance choisie par k 
figure
subplot(1,2,1)
for x=min:pas:max
    indicex = indicex+1;
    indicey = 0;
    for y=min:pas:max
        indicey = indicey + 1;
        [Theta,covaInt] = VarianceInterpolationAllSurface(PosTargetXsortF,PosTargetZsortF,varASommeX,varASommeZ,covaASomme,x,y,'spline',TrialNbr);
        if det(covaInt)>=0 & covaInt(1,1)>0 & covaInt(2,2)>0
            [Aire,Orientation,vect_prop,val_prop] = CalculAireOrientation95(covaInt);
            if val_prop(1,1)>=val_prop(2,2)
                quiver(x,y,sqrt(k*val_prop(1,1))*vect_prop(1,1),sqrt(k*val_prop(1,1))*vect_prop(1,2));
                hold on
            else
                quiver(x,y,sqrt(k*val_prop(2,2))*vect_prop(2,1),sqrt(k*val_prop(2,2))*vect_prop(2,2));
                hold on
            end
        else 
            if indicex==1
                Aire = 0;
            else
                Aire = AIRE(indicex-1,indicey);
            end
        end
        AIRE(indicex,indicey) = Aire;
    end
    
end
xlabel('x position in (m)')
ylabel('y position in (m)')
hold off
title('size and direction','FontSize',12)


subplot(1,2,2)
x = min:pas:max;
y = min:pas:max;
surf(x,y,AIRE)
c = colorbar('southoutside');
c.Label.String = 'Surface in (m²)';
view(0, 90)
xlabel('x position in (m)')
ylabel('y position in (m)')
title('surface','FontSize',12);
