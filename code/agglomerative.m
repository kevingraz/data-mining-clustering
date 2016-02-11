function final_merging_matrix = agglomerative( matrix, iterations )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% AGGLOMERATIVE ALGORITHM  %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = length(matrix(:,1));
% Obtain distance matrix by computing Euclidean distance between each pair
% of objects
dist_mat = compute_dist_mat(matrix);

% Initialize cluster index
cluster_index = (1:m)';

current_index = m + 1;

% Matrix with indexes included
indexed_matrix = [cluster_index matrix];
n = length(indexed_matrix(1,:));

merging_matrix = [];

for i = 1 : iterations;
    m = length(matrix(:,1));
    if i == 1,
        [ min_dist, index_i, index_j ] = minimum_distance( indexed_matrix(:,1), dist_mat, m );
        merging_matrix = [merging_matrix; indexed_matrix(index_j,1) indexed_matrix(index_i,1) current_index];
        new_cluster = [current_index indexed_matrix(index_i,2:n); current_index indexed_matrix(index_j,2:n)];
        indexed_matrix(index_i,:) = [];
        indexed_matrix(index_j,:) = [];
        indexed_matrix = [indexed_matrix; new_cluster];
        dist_mat = compute_dist_mat(indexed_matrix(:, 2:n));
        
    end
    if i > 1,
        [ min_dist, index_i, index_j ] = minimum_distance( indexed_matrix(:,1), dist_mat, m );
        merging_matrix = [merging_matrix; indexed_matrix(index_j,1) indexed_matrix(index_i,1) current_index];
        new_cluster = [current_index indexed_matrix(index_i,2:n); current_index indexed_matrix(index_j,2:n)];
        [scanned_clusters, indexes] = scan_index(indexed_matrix, index_i);
        updated_indexes = [];
        indexed_matrix(index_i,:) = [];
        indexed_matrix(index_j,:) = [];
        if ~isempty(scanned_clusters),
            for j = 1 : length(scanned_clusters(:,1));
                updated_indexes = [updated_indexes; current_index scanned_clusters(j, 2:n)];
                indexed_matrix(indexes(j,:),:) = [];
            end
        end
        indexed_matrix = [indexed_matrix; new_cluster; updated_indexes];
        dist_mat = compute_dist_mat(indexed_matrix(:, 2:n));      
    end  
    current_index = current_index + 1;    
end           
final_merging_matrix = merging_matrix;            
end

