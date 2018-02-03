function [M] = assign(M, D, R)

switch D 
    case 'beta'
        M(1, R) = M(1, R) + 1;
    case 'birnbaumsaunders'
        M(2, R) = M(2, R) + 1;
    case 'burr'
        M(3, R) = M(3, R) + 1;
    case 'exponential'
        M(4, R) = M(4, R) + 1;
    case 'extreme value'
        M(5, R) = M(5, R) + 1;
    case 'gamma'
        M(6, R) = M(6, R) + 1;
    case 'generalized extreme value'
        M(7, R) = M(7, R) + 1;
    case 'generalized pareto'
        M(8, R) = M(8, R) + 1;
    case 'inverse gaussian'
        M(9, R) = M(9, R) + 1;
    case 'logistic'
        M(10, R) = M(10, R) + 1;
    case 'loglogistic'
        M(11, R) = M(11, R) + 1;
    case 'lognormal'
        M(12, R) = M(12, R) + 1;
    case 'nakagami'
        M(13, R) = M(13, R) + 1;
    case 'normal'
        M(14, R) = M(14, R) + 1;
    case 'rayleigh'
        M(15, R) = M(15, R) + 1;
    case 'rician'
        M(16, R) = M(16, R) + 1;
    case 'tlocationscale'
        M(17, R) = M(17, R) + 1;
    case 'weibull'
        M(18, R) = M(18, R) + 1;
    otherwise
        M(19, R) = M(19, R) + 1;
end

end