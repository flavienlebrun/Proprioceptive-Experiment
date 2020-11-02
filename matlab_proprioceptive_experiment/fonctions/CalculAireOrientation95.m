function [Aire,Orientation,vect_prop,val_prop] = CalculAireOrientation95(cova)
[vect_prop,val_prop] = eig(cova);
if (val_prop(1,1)*val_prop(2,2))>0
    Aire = (pi)*4*5.991*sqrt(val_prop(1,1)*val_prop(2,2));
else
    Aire = 0;
end
if val_prop(1,1)>=val_prop(2,2)
    Orientation = atan(vect_prop(2,1)/vect_prop(1,1));
else
    Orientation = atan(vect_prop(2,2)/vect_prop(1,2));
end
end