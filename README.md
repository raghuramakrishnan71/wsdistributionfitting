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

6. KSgofParametric.m:
Fits the given data to specified parametric distribution (using fitdist) and does kstest for goodness of fit (using kstest). Called from fitNTestRecursiveBodyRegion.

7. fitNTestRecursiveBodyRegion.m:
Discovers the longest subset in the given dataset X which can be successfully modeled using the specified distribution. Internally uses KSgofParametric (for parametric distributions), KSgofNonParametricKernel (for kernel distribution), KSgofPiecewiseLinear (for piecewise) and KSgofTriangular (for triangular). Required KSgof method can be uncommented for use. KSgofParametric is uncommented by default. The discard threshold (what percentage of values can be discarded?) and decrement step can be assigned by the caller.

8. assign2.m:
Used internally by FitNTestADistribution.m

9. KSgofNonParametricKernel.m:
Fits the given data to specified kernel distribution (using fitdist) and does kstest for goodness of fit (using kstest). The smoothing function can be set as required. Four smoothing functions are supported - epanechnikov, normal, box and triangle. Called from fitNTestRecursiveBodyRegion.

10. KSgofNonParametricPiecewiseLinear.m
Fits the given data to specified piecewise distribution (using makedist). The group size is configurable. The default group size is 10. Called from fitNTestRecursiveBodyRegion.

11. KSgofNonParametricTriangular.m
Fits the given data to specified triangular distribution (using makedist). The peak is configurable. The default peak size is mean. Called from fitNTestRecursiveBodyRegion.


