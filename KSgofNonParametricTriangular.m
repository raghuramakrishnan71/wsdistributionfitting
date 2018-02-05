%this function is for fitting and testing Triangular distribution
function [HVALUE, PVALUE, MSG] = KSgofNonParametricTriangular(X, DISTRIBUTION)

MSG = 'Success';
HVALUE = 1;
PVALUE = 0;
lastwarn('');
try
    a = min(X);
    %b = median(X);
    b = mean(X);
    c = max(X);
    pd = makedist(DISTRIBUTION, 'a', a, 'b', b, 'c', c);
    m = lastwarn();
    if (size(m) == 0)
        [HVALUE,PVALUE,ksstat,cv] = kstest(X, 'CDF', pd);
    else
        MSG = sprintf('Warning: %s', m);
    end
catch ME
    MSG = sprintf('Exception: %s', strtok(ME.message, '.'));
    %fprintf('exception %s, %s\n', strtok(ME.message, '.'), ME.identifier);
end

%fprintf('KSgof2 results (%s) is %d %f\n', DISTRIBUTION, HVALUE, PVALUE);

end