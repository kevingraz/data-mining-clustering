%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% K-MEANS ALGORITHM (YEAST GENE DATA SET) %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Import yeast_gene data
yeast_gene = csvread('YeastGene.csv');
yeast_gene_initial_centroids = csvread('YeastGene_Initial_Centroids.csv');

% Assign the number of iterations
yeast_gene_iterations = 7;

% Assign the number of clusters
num_clusters = 6;

for i = 1 : yeast_gene_iterations;
    if i == 1,
        [new_centroids, ~] = k_means(yeast_gene, num_clusters, yeast_gene_initial_centroids);
    end
    if i > 1,
        [new_centroids, new_assignments] = k_means(yeast_gene, num_clusters, new_centroids);
    end
end

% Assign the final centroids and assignments computed by k means
final_centroids = new_centroids;
final_assignments = new_assignments;




% Perform PCA analysis on yeast_gene data
[coeff_yeast_gene, score_yeast_gene, latent_yeast_gene] = pca(yeast_gene);
yeast_gene_pca = score_yeast_gene(:, 1:2);

% Separate yeast_gene pca data into assigned clusters
cluster1 = [];
cluster2 = [];
cluster3 = [];
cluster4 = [];
cluster5 = [];
cluster6 = [];

c1 = 0;
c2 = 0;
c3 = 0;
c4 = 0;
c5 = 0;
c6 = 0;

for i = 1 : length(yeast_gene_pca(:,1));
    if final_assignments(i,:) == 1,
        c1 = c1 + 1;
        cluster1(c1,:) = yeast_gene_pca(i,:);
    end
    if final_assignments(i,:) == 2,
        c2 = c2 + 1;
        cluster2(c2,:) = yeast_gene_pca(i,:);
    end
    if final_assignments(i,:) == 3,
        c3 = c3 + 1;
        cluster3(c3,:) = yeast_gene_pca(i,:);
    end
    if final_assignments(i,:) == 4,
        c4 = c4 + 1;
        cluster4(c4,:) = yeast_gene_pca(i,:);
    end
    if final_assignments(i,:) == 5,
        c5 = c5 + 1;
        cluster5(c5,:) = yeast_gene_pca(i,:);
    end
    if final_assignments(i,:) == 6,
        c6 = c6 + 1;
        cluster6(c6,:) = yeast_gene_pca(i,:);
    end
end

% Perform PCA analysis on yeast_gene data
[coeff_centroids, score_centroids, latent_centroids] = pca(final_centroids);
yeast_gene_cent_pca = score_centroids(:, 1:2);


% Plot yeast_gene data clusters and centroids
plot(cluster1(:,1), cluster1(:,2),'.',cluster2(:,1), cluster2(:,2),'.',cluster3(:,1), cluster3(:,2),'.');
hold on
plot(cluster4(:,1), cluster4(:,2),'.',cluster5(:,1), cluster5(:,2),'.',cluster6(:,1), cluster6(:,2),'.');
plot(yeast_gene_cent_pca(:,1), yeast_gene_cent_pca(:,2),'x');
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6','Centroids');
hold off



