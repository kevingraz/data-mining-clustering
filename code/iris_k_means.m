%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% K-MEANS ALGORITHM (IRIS DATA SET) %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Import iris data
iris = csvread('iris.csv');
iris_initial_centroids = csvread('Iris_Initial_Centroids.csv');

% Assign the number of iterations
iris_iterations = 12;

% Assign the number of clusters
num_clusters = 3;

for i = 1 : iris_iterations;
    if i == 1,
        [new_centroids, ~] = k_means(iris, num_clusters, iris_initial_centroids);
    end
    if i > 1,
        [new_centroids, new_assignments] = k_means(iris, num_clusters, new_centroids);
    end
end

% Assign the final centroids and assignments computed by k means
final_centroids = new_centroids;
final_assignments = new_assignments;


% Perform PCA analysis on iris data
[coeff_iris, score_iris, latent_iris] = pca(iris);
iris_pca = score_iris(:, 1:2);

% Separate iris pca data into assigned clusters
cluster1 = [];
cluster2 = [];
cluster3 = [];

c1 = 0;
c2 = 0;
c3 = 0;

for i = 1 : length(iris_pca(:,1));
    if new_assignments(i,:) == 1,
        c1 = c1 + 1;
        cluster1(c1,:) = iris_pca(i,:);
    end
    if new_assignments(i,:) == 2,
        c2 = c2 + 1;
        cluster2(c2,:) = iris_pca(i,:);
    end
    if new_assignments(i,:) == 3,
        c3 = c3 + 1;
        cluster3(c3,:) = iris_pca(i,:);
    end
end

% Perform PCA analysis on iris data
[coeff_centroids, score_centroids, latent_centroids] = pca(final_centroids);
iris_cent_pca = score_centroids(:, 1:2);


% Plot iris data clusters and centroids
plot(cluster1(:,1), cluster1(:,2),'.',cluster2(:,1), cluster2(:,2),'.',cluster3(:,1), cluster3(:,2),'.');
hold on
plot(iris_cent_pca(:,1), iris_cent_pca(:,2),'x');
legend('Cluster 1','Cluster 2','Cluster 3','Centroids');
hold off


