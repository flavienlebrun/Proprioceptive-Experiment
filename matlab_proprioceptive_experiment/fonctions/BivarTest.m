for x = 1:1:601
    for z = 1:1:601
        f(x,z) =BivarNormalDistr(1,1,0,-3+(x-1)*0.01,-3+(z-1)*0.01,0,0);
    end
end