function [M] = assign2(M, V)

if (V == 1)
    M(1, 1) = M(1, 1) + 1;
elseif (V < 1 && V >= 0.9)
    M(2, 1) = M(2, 1) + 1;
elseif (V < 0.9 && V >= 0.8)
    M(3, 1) = M(3, 1) + 1;
elseif (V < 0.8 && V >= 0.7)
    M(4, 1) = M(4, 1) + 1;
elseif (V < 0.7 && V >= 0.6)
    M(5, 1) = M(5, 1) + 1;
elseif (V < 0.6 && V >= 0.5)
    M(6, 1) = M(6, 1) + 1;    
else
    M(7, 1) = M(7, 1) + 1;
end

end