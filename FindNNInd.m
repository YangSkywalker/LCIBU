function [Indx, Indy, Ind_Ux, Ind_Uy] = FindNNInd(G, k)

% function: choose all sample points which are adjacent to each other in two class
% 
% Usage:
%     S = FindNNInd(G)
%     
% Input:
%     G - the distance matrix of two vector sets
%     k - the number of nearest neighbors
%     
% Output:
%     Indx - the index set of row (the index of one class)
%     Indy - the index set of column (the index of the other class )
%     
% author: Yang Xiangfei;  Date: 2022/04/28

if k > min(size(G))
    error('k cannot exceed the min(size(G))', min(size(G)));
end

[m, n] = size(G);
[~,G_NN_indxy] = sort(G, 2); [~,G_NN_indyx] = sort(G, 1);
S = ones(size(G));
Indxy_tmp = (G_NN_indxy(:, (k + 1) : n) - 1) * m + (1 : m)' * ones(1, n - k); 
Indxy = reshape(Indxy_tmp, 1, prod(size(Indxy_tmp)));
Indyx_tmp = (ones(m - k, 1) * (1 : n) - 1) * m + G_NN_indyx((k + 1): m, :);
Indyx = reshape(Indyx_tmp, 1, prod(size(Indyx_tmp)));
S(Indxy) = 0; S(Indyx) = 0; 
[Indx, Indy] = find(S==1);
Ind_Ux = find(any(S, 2) == 1); Ind_Uy = find(any(S, 1) == 1); 

end

