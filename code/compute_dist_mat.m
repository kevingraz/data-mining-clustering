function [ dist_mat ] = compute_dist_mat( matrix )
%DISTANCE_MATRIX Summary of this function goes here
%   Detailed explanation goes here
m = length(matrix(:,1));
dist_mat =  zeros(m, m);

for i = 1 : m;
    for j = 1 : m;
        dist_mat(i,j) = sqrt(sum((matrix(i,:) - matrix(j, :)).^2));
    end
end

end

