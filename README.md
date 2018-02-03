# wsdistributionfitting
Contains scripts used for modeling web service response time using probability distributions

1. IdentifyParametricCandidates.m : 
Assess the fit of a set of probability distributions to given data using NLogL, AIC and BIC. Generates a 2-d matrix in which row is the distribution and column is the ranking. Internally uses allfitdist, assign,  ReadDataFromFile methods.

2. assign.m : 
Used internally in IdentifyParametricCandidates.m

3. ReadDataFromFile.m:
Read data from a single column csv file containing numeric values. The first line of the csv is the header.


