function  DistMat = DistMatrix(A, B)

% function: compute the distance matrix of two vector sets 
% 
% Usage: 
%     DistMat = DistMatrix(A, B)
%     
% Input:
%     A, B - vector set (all vectors have the same dimension)
%     
% author: Yang Xiangfei (yxf9011@163.com);  Date: 2022/04/27

if size(A, 1) ~= size(B, 1)
    error('The dimension of vector set A and B must be the same! Please check!')
end

[d, m] = size(A); [~, n] = size(B);
DistMat = sum(A.^2, 1)' * ones(1, n) + ones(m, 1) * sum(B.^2, 1) - 2 * A' * B;
end

