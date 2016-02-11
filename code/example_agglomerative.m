% Import example data
example = csvread('example.csv');

% Perform agglomerative algorithm
agglomerative(example,5)