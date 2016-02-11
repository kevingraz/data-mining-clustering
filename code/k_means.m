function [new_centroids, assignments] = k_means( data, clusters, initial_centroids )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% K-MEANS ALGORITHM  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This Function performs three tasks:
% 1) Calculates the euclidean distance between x(i) and each of the K centroids
% 2) Assigns x(i) to the cluster whose centroid is closest to x(i)
% 3) Calculates the centroid as the mean of all objects in assigned cluster

% Initialize assignments vector to store assigned centroids
assignments = zeros(length(data(:,1)),1);

% Initialize centroids matrix to store new centroid data
centroids = zeros(size(initial_centroids));

% Loop through data to assign each x(i) to the closest centroid cluster
for i = 1 : length(data(:,1));
    count = 0;
    for k = 1 : clusters;
        if k == 1,
            x = sqrt(sum((data(i,:) - initial_centroids(k, :)).^2));       
            count = 1; 
        end
        if k > 1,
            y = sqrt(sum((data(i,:) - initial_centroids(k, :)).^2));
            if y < x,
                x = y;
                count = k;             
            end
        end        
    end    
    assignments(i,:) = count;    
end       

% Using the newly assigned clusters, loop through to seperate each x(i) 
% into clusters, then calculate the mean of each cluster, before finally
% adding mean values to the new centroids matrix.

for k = 1 : clusters;
    cluster_k = [];
    for i = 1 : length(data(:,1));
        if assignments(i,:) == k && ~isempty(cluster_k),
            cluster_k = [cluster_k; data(i,:)];
        end
        if assignments(i,:) == k && isempty(cluster_k),
            cluster_k = data(i,:);
        end
    end
    centroids(k,:) = mean(cluster_k);
end
new_centroids = centroids;
end

