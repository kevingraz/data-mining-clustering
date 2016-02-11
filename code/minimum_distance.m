function [ min_dist, new_index_i, new_index_j ] = minimum_distance( cluster_index, dist_mat, m )
%MIN_DIST Summary of this function goes here
%   Detailed explanation goes here

min = 0;

for i = 1 : m;
    for j = 1 : m;
        x = dist_mat(i,j);
        y = cluster_index(i,1);
        z = cluster_index(j,1);
        if x ~= 0 && min == 0;
           min = x;
           index_i = i;
           index_j = j;
        end
        if (x ~= 0) && (min ~= 0) && (y~=z),
           
           if x < min,
               min = x;
               index_i = i;
               index_j = j;
               
           end
        end
    end
end

min_dist = min;

if index_i < index_j,
    temp = index_i;
    index_i = index_j;
    index_j = temp;
end

new_index_i = index_i;
new_index_j = index_j;



end

