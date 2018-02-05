%this function is for fitting and testing PiecewiseLinear distribution
function [HVALUE, PVALUE, MSG] = KSgofNonParametricPiecewiseLinear(X)

MSG = 'Success';
HVALUE = 1;
PVALUE = 0;
lastwarn('');

try
    [f, x] = ecdf(X);
    %groupsize = 2;
    %groupsize = 5;
    groupsize = 10;
    FNew = f(1:groupsize:end); %less dense grid of points
    XNew = x(1:groupsize:end);
    LenOfNew = length(FNew);
    FNew(LenOfNew) = f(end);
    XNew(LenOfNew) = x(end);   
    pd = makedist('PiecewiseLinear','x',XNew,'Fx',FNew);
    m = lastwarn();
    if (size(m) == 0)
        [HVALUE,PVALUE,ksstat,~] = kstest(X, 'CDF', pd);
    else
        MSG = sprintf('Warning: %s', m);
    end
catch ME
    MSG = sprintf('Exception: %s', strtok(ME.message, '.'));
    %fprintf('exception %s, %s\n', strtok(ME.message, '.'), ME.identifier);
end

%fprintf('KSgof2 results (%s) is %d %f\n', DISTRIBUTION, HVALUE, PVALUE);

end