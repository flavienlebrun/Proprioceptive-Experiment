function[dmin] = dimenss(largeur)

for i = 0:100
    Sommet1 = [-40 40]; % coordonné du Sommet 1
    Sommet2 = [40 40]; % coordonné du Sommet 2
    y = -18.5; % position selon l'axe x du centre de l'organe effecteur
    d = largeur/2; % distancce CentreE CentreC
    r = largeur/2; % rayon du cercle
    d_trop_grand = 1;
    dmin = 0;
    epsilon = 0.01; % distance autorisé entre le cercle et le câble
    while d_trop_grand % On détermine la distance minimale au centre nécessaire pour qu'il n'y est pas de collision dans les configurations les plus négatives

        for x =-18.5:0.1:18.5 % évaluation des positions les plus défavorables pour le centre de l'organe effecteur
            CentreE = [x y]; % position x,y du centre de l'organe effecteur
            CentreC = [x y+d];% position x,y du centre du cercle
            VecteurES1 = Sommet1 - CentreE; 
            VecteurES2 = Sommet2 - CentreE;
            pasdecollision = 1;
            for k=0:0.01:1 % on parcourt tout les points de la droite avec un pas 0.001
                PointM1 = k*VecteurES1 + CentreE;
                PointM2 = k*VecteurES2 + CentreE;
                if (norme((k*VecteurES1))<d + r && norme((k*VecteurES2))< d + r) 
                    if distance(CentreC,PointM1)<r+epsilon %on vérifie pour chaque point qu'il n'ya pas eu de collision entre la droite et le cercle
                        pasdecollision = 0;
                        break;
                    end
                    if distance(CentreC,PointM2)<r+epsilon 
                        pasdecollision = 0;
                        break;
                    end
                end
            end
            if pasdecollision 
                d_trop_grand = 0;
                dmin = d;
            end   
        end
         d = d + 0.25; % augmentation progressive de la distance d
    end
end