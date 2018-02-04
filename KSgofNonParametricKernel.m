%this function is for fitting and testing Kernel
function [HVALUE, PVALUE, MSG] = KSgofNonParametricKernel(X, DISTRIBUTION)

MSG = 'Success';
HVALUE = 1;
PVALUE = 0;
lastwarn('');
try
    pd = fitdist(X, DISTRIBUTION, 'Kernel', 'normal');
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

%fprintf('KSgof2 results (%s) is %d %f kstat(%f) cv(%f)\n', DISTRIBUTION, HVALUE, PVALUE, ksstat, cv);

end