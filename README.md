# wsdistributionfitting
Contains scripts used for modeling web service response time using probability distributions. Customized for WSDREAM dataset, but can be appropriately modified for other sets. The response time of each web service is stored in a separate csv file with naming convention {webservice_sequencenumber}.csv

1. IdentifyParametricCandidates.m : 
Assess the fit of a set of probability distributions to given data using NLogL, AIC and BIC. Generates a 2-d matrix in which row is the distribution and column is the ranking. Internally uses allfitdist, assign, ReadDataFromFile, WriteDataToFile methods. Works on each webservice of WSDREAM. Prior to using modify the directory in cd('') to point to location where the csv files reside.

2. assign.m : 
Used internally in IdentifyParametricCandidates.m

3. ReadDataFromFile.m:
Read data from a single column csv file containing numeric values. The first line of the csv is the header.

4. CalculateSkewnessNKurtosis.m:
Calculates the skewness and kurtosis value of given data. Internally uses ReadDataFromFile, WriteDataToFile methods. Works on each webservice of WSDREAM. Prior to using modify the directory in cd('') to point to location where the csv files reside.

5. WriteDataToFile.m:
Write the given line to the specified file.


