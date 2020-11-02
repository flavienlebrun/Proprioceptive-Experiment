function [dmin] = distancemin(largeur)
% Fonction permettant de calculer une distance maximal du centre de la
% plaque au point d'intersection des câbles

for d = 0:0.1:20
    pas_de_collision = 1;
    for y = -18.5:1:18.5
        posE = [18.5 y 0];
        if collisionvol(posE,d,largeur) == 1 % recherche de collision avec la distance d
            pas_de_collision = 0;
            break
        end
    end
    if pas_de_collision % si aucune collision n'a été trouvé on fixe la distance d comme distance minimal
        dmin = d;
        break
    end
end

