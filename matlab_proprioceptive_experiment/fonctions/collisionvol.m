function[bool] = collisionvol(posE,d,largeur)
% fonction permettant de tester, avec une position fixé de centre E des
% câbles et une largeur de plaque (que l'on suppose carré) ainsi qu'une
% distance de la plaque au centre E, si il y a contact avec les câbles


bool = 0; % si il y a collision ce booléen passera à True
r = sqrt(2)*largeur/2; % rayon de la sphère
epsilon = 0.01;

for theta = 0:0.01:pi/2 % on fait tourner la sphère sur un demi arc de cercle 
    CentreS = posE + [cos(theta)*d, 0, sin(theta)*d]; % centre de la sphère
    VecteurES1 = [-40-posE(1) -40-posE(2) 20]; % vecteur entre le centre des câbles et le sommet 1
    VecteurES2 = [-40-posE(1) 40-posE(2) 20]; % vecteur entre le centre des câbles et le sommet 2
    VecteurES3 = [40-posE(1) -40-posE(2) 20]; % vecteur entre le centre des câbles et le sommet 3
    VecteurES4 = [40-posE(1) 40-posE(2) 20]; % vecteur entre le centre des câbles et le sommet 4
    for k = 0:0.01:1 % on va parcourir les deux droites pour vérifier la présence de collision
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


