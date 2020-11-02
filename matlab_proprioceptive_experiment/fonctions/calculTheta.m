function [theta] = calculTheta(x,z)
if x>0 && z>=0
    theta = atan(z/x);
end

if x>0 && z<0
    theta = atan(z/x) + 2*pi;
end    

if x<0
    theta = atan(z/x) + pi;
end

if x==0 && z>0
    theta = pi/2;
end

if x==0 && z<0
    theta = -pi/2;
end
if x==0 && z==0
    theta = 0;
end

end