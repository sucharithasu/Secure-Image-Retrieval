function watermark = generateWatermark(encryptedimage, watermarkbits)

% Determine the size of the image
[rows, columns, ~] = size(image);

% Define the size of the submatrices
submatrixSize = [3, 3];

% Calculate the number of submatrices in each dimension
numRows = floor(rows / submatrixSize(1));
numColumns = floor(columns / submatrixSize(2));

% Initialize a cell array to store the submatrices
submatrices = cell(numRows, numColumns);

% Divide the image into submatrices
for i = 1:numRows
    for j = 1:numColumns
        % Define the indices for the current submatrix
        rowIndices = (i - 1) * submatrixSize(1) + 1 : i * submatrixSize(1);
        colIndices = (j - 1) * submatrixSize(2) + 1 : j * submatrixSize(2);
        
        % Extract the current submatrix
        submatrices{i, j} = image(rowIndices, colIndices, :);
    end
end
sub_matrix=size(submatrices);

% Display the first submatrix
imshow(submatrices{1, 1});
% Assign the watermark bit to each block
for i=1:N  %N is the no.of blocks
    Sub_Matrix(i)= watermarkbits(i);
end
% Flip the last three digits of each pixelof block which got watermark bit
% is 1.
end