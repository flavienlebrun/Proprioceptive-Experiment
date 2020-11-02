function[bool] = collisionvol(posE,d,largeur)
% fonction permettant de tester, avec une position fix� de centre E des
% c�bles et une largeur de plaque (que l'on suppose carr�) ainsi qu'une
% distance de la plaque au centre E, si il y a contact avec les c�bles


bool = 0; % si il y a collision ce bool�en passera � True
r = sqrt(2)*largeur/2; % rayon de la sph�re
epsilon = 0.01;

for theta = 0:0.01:pi/2 % on fait tourner la sph�re sur un demi arc de cercle 
    CentreS = posE + [cos(theta)*d, 0, sin(theta)*d]; % centre de la sph�re
    VecteurES1 = [-40-posE(1) -40-posE(2) 20]; % vecteur entre le centre des c�bles et le sommet 1
    VecteurES2 = [-40-posE(1) 40-posE(2) 20]; % vecteur entre le centre des c�bles et le sommet 2
    VecteurES3 = [40-posE(1) -40-posE(2) 20]; % vecteur entre le centre des c�bles et le sommet 3
    VecteurES4 = [40-posE(1) 40-posE(2) 20]; % vecteur entre le centre des c�bles et le sommet 4
    for k = 0:0.01:1 % on va parcourir les deux droites pour v�rifier la pr�sence de collision
       PointM1 = k*VecteurES1 + posE; 
       PointM2 = k*VecteurES2 + posE;
       PointM3 = k*VecteurES3 + posE;
       PointM4 = k*VecteurES4 + posE;
       if (PointM1(1)< -18.5 || PointM1(2)< -18.5 || PointM1(3)>20) && (PointM2(1)< -18.5 || PointM2(2)> 18.5 || PointM2(3)>20)
           break
       end
       if distance3D(PointM1,CentreS) < r + epsilon % test de distance entre le centre du cercle et le point de la droite
           bool = 1;
           break
       end
       if distance3D(PointM2,CentreS) < r + epsilon
           bool = 1;
           break
       end
       if distance3D(PointM3,CentreS) < r + epsilon
           bool = 1;
           break
       end
       if distance3D(PointM4,CentreS) < r + epsilon
           bool = 1;
           break
       end
    end
    if bool == 1
        break
    end
end


