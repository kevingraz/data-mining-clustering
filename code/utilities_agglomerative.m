% Import example data
utilities = csvread('Utilities.csv');

% Perform agglomerative algorithm
merger_martix = agglomerative(utilities,21)