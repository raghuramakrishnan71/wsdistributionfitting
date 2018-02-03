%find out the best fit
%30 Jan 2018

cd('C:\Datasets\WS-DREAM\WSDream-QoSDataset2-5825-csv');

maxobservations = 339;
distributions   = 19;
startbatch      = 0;
totbatches      = 5824;
criticalmass    = round(maxobservations * 0.95);
datasets        = 0;

NLLMatrix = zeros(19, 19);
AICMatrix = zeros(19, 19);
BICMatrix = zeros(19, 19);

fprintf('criticalmass %d\n', criticalmass);
%looping over all the files
for batches = startbatch:1:totbatches

    basefile = sprintf('%d.csv', batches);

    resultsfileNLL = 'candidates-0-NLL.txt';
    resultsfileAIC = 'candidates-0-AIC.txt';
    resultsfileBIC = 'candidates-0-BIC.txt';
    resultsfileOut = 'candidates-0-NON.txt';
    
    X1 = ReadDataFromFile(basefile);
    if (~isempty(X1)) 

        X2 = X1(X1 ~= -1);
        X = sort(X2);
        tot = length(X);

        %is there sufficient data remaining after removing -1
        if (tot < criticalmass)

            outline = sprintf('%d|%d|%d|%0.3f|%s|%0.4f|%0.4f|%0.4f\n', batches, 0, tot, 0, 'Insufficient Data', 0, 0, 0);
            fprintf('%s', outline);
            WriteDataToFile(resultsfileOut, outline, 'a');

        else
            tic
            datasets = datasets + 1;
            [D, PD] = allfitdist(X, 'NLogL');
            elapsedtime1 = toc;

            %write output
            tot2 = length(PD);

            for i = 1:1:tot2

                outline = sprintf('%d|%d|%d|%0.3f|%s|%0.4f|%0.4f|%0.4f\n',  batches, i, tot, elapsedtime1, D(i).DistName, D(i).NLogL, D(i).BIC, D(i).AIC);
                %fprintf('%s', outline);
                WriteDataToFile(resultsfileNLL, outline, 'a');
                NLLMatrix = assign(NLLMatrix, D(i).DistName, i);
            end

            tic
            [D, PD] = allfitdist(X, 'AIC');
            elapsedtime1 = toc;

            %write output
            tot2 = length(PD);

            for i = 1:1:tot2

                outline = sprintf('%d|%d|%d|%0.3f|%s|%0.4f|%0.4f|%0.4f\n',  batches, i, tot, elapsedtime1, D(i).DistName, D(i).NLogL, D(i).BIC, D(i).AIC);
                %fprintf('%s', outline);
                WriteDataToFile(resultsfileAIC, outline, 'a');
                AICMatrix = assign(AICMatrix, D(i).DistName, i);

            end

            tic
            [D, PD] = allfitdist(X, 'BIC');
            elapsedtime1 = toc;

            %write output
            tot2 = length(PD);

            for i = 1:1:tot2

                outline = sprintf('%d|%d|%d|%0.3f|%s|%0.4f|%0.4f|%0.4f\n',  batches, i, tot, elapsedtime1, D(i).DistName, D(i).NLogL, D(i).BIC, D(i).AIC);
                %fprintf('%s', outline);
                WriteDataToFile(resultsfileBIC, outline, 'a');
                BICMatrix = assign(BICMatrix, D(i).DistName, i);

            end

            fprintf('Dataset %d processed\n', batches);
            
        end
    end
%the end of outer for loop
end

fprintf('Qualified datasets %d\n', datasets);
