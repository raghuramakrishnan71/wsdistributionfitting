%find out the best fit
%30 Jan 2018

cd('C:\Datasets\WS-DREAM\WSDream-QoSDataset2-5825-csv');

maxobservations = 339;
startbatch      = 0;
totbatches      = 5824;
criticalmass    = round(maxobservations * 0.95);
datasets        = 0;
wscount         = 0;

%SkewMatrix = zeros(5393, 1);
%KurtMatrix = zeros(5393, 1);

i = 1;
for batches = startbatch:1:totbatches

    basefile       = sprintf('%d.csv', batches);
    resultsfileSK  = 'candidates-0-SKEW-KURT.txt';
    
    X1 = ReadDataFromFile(basefile);
    if (~isempty(X1)) 
        X = X1(X1 ~= -1);
        tot = length(X);

        %is there sufficient data remaining after removing -1
        if (tot < criticalmass)
            outline = sprintf('%d|%d|%0.3f|%0.3f\n',  batches, tot, 0, 0);
            fprintf('%s', outline);
            %WriteDataToFile(resultsfileSK, outline, 'a');
        else
            kurt = kurtosis(X);
            skew = skewness(X);
            %SkewMatrix(i, 1) = skew;
            %KurtMatrix(i, 1) = kurt;
            i = i + 1;
            wscount = wscount + tot;
            outline = sprintf('%d|%d|%0.3f|%0.3f\n',  batches, tot, skew, kurt);
            fprintf('%s', outline);
            WriteDataToFile(resultsfileSK, outline, 'a');
        end
    end
end
fprintf('Total web services %d, %d\n', wscount, i);
    