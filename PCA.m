% Sample data matrix
data = [1, 2, 2, 4, 5; 2, 4, 5, 8, 10; 3, 6, 8, 12, 15];

% Mean centering the data
data_mean = mean(data, 2);
data_centered = data - data_mean;
data_centered=data_centered';
% Calculating the covariance matrix
cov_matrix = cov(data_centered);

% Performing singular value decomposition (SVD) on the covariance matrix
[U, S, V] = svd(cov_matrix);

% Extracting the principal components
pc = U * data_centered';

% Plotting the principal components
figure;
scatter(pc(1,:), pc(2,:));
title('PCA Plot');
xlabel('PC1');
ylabel('PC2');