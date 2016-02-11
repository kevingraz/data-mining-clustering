function [ scanned_clusters, final_indexes ] = scan_index( indexed_matrix, index_i )
%SCAN_INDEX Summary of this function goes here
%   Detailed explanation goes here

m = length(indexed_matrix(:,1));
cluster_indexes = indexed_matrix(:,1);
cluster_matrix = [];
indexes = [];
for i = 1 : m;
    if cluster_indexes(i,1) == index_i;
        cluster_matrix = [cluster_matrix; indexed_matrix(i,:)];
        indexes = [indexes; i];
    end
end

scanned_clusters = cluster_matrix;

final_indexes = sort(indexes, 'descend');

end

