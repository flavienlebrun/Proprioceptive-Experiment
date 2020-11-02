function [NewCova,NewCenter] = CalculEllipseCombine(Xvisu,Yvisu,Xproprio,Yproprio,CovaReelVisu,CovaReelProprio)

NewCova = inv(inv(CovaReelVisu)+inv(CovaReelProprio));
NewCenter = NewCova*(inv(CovaReelVisu)*[Xvisu;Yvisu] + inv(CovaReelProprio)*[Xproprio;Yproprio]);

end