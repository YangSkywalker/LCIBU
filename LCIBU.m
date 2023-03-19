function Uni = LCIBU(X, Y, ratio, k)

% function: create in-between universum set between two classes of samples
%
% Useage: 
%        Uni = CIBU(X, Y, Threshold, k)
% Input: 
%        X -  two class sample points
%        Y - (only include class label 1 and -1)
%        Threshold - the threshold of choosing in-between universum
%        k - the number of nearest neighbors 
% References:
%        [1] Dongdong Li, Yujin Zhu, Zhe Wang£¬ Chuanyu Chong, Daqi Gao,
%        "Regularized matrix-pattern-oritented classification machine with
%        universum", Neural Processing Letters, 2017(45):1077-1098,
%        https://doi.org/10.1007/s11063-016-9567-1.
%        [2] Shuo Chen, Changshui Zhang, "Selecting information universum
%        sample for semi-supervised learning", IJCAI, 2009:1016-1021.
%
% author: Yang Xiangfei;  Date: 2022/4/29

%%% set default value of parameters 
if nargin < 2 | nargin > 4
    error('The number of input parameters are wrong.')
end

if nargin == 2
    ratio = 0.25; k = 7;
end

if nargin == 3
    k = 7;
end

if k > min(numel(find(Y==1)), numel(find(Y==-1)))
    error('k cannot exceed the minimum number of two classes %d.', min(numel(find(Y==1)), numel(find(Y==-1))));
end

%%% create universum
L = unique(Y); c = numel(L);
ind = cell(1, c); ind{1, 1} = find(Y==1); ind{1,2} = find(Y==-1);   
G = DistMatrix(X(:, ind{1,1}), X(:, ind{1,2}));    % Affinity matrix(Eulidean distance)
[Indx_NN, Indy_NN, Indx_u, Indy_u] = FindNNInd(G, k);
% generate universum
Uni_mean = [];
count = 1;
for i = 1:numel(Indx_u)
    for j = 1:numel(Indy_u)
        Uni_mean(:, count) =  (X(:, ind{1,1}(Indx_u(i))) + X(:, ind{1,2}(Indy_u(j)))) / 2;
        count = count + 1;
    end
end
%%% select in-between universum
% choose all sample points which are adjacent to each other in two class
G_Up = DistMatrix(X(:, ind{1,1}), Uni_mean);
G_Un = DistMatrix(Uni_mean, X(:, ind{1,2}));
b_u = zeros(1, size(Uni_mean,2));   % store the threshold corresponding to Universum
for u = 1:size(Uni_mean, 2)
    for i = 1:numel(Indx_NN)
        if G_Up(Indx_NN(i), u) + G_Un(u, Indy_NN(i)) < G(Indx_NN(i), Indy_NN(i))
            b_u(u) = b_u(u) + 1;
            G(Indx_NN(i), Indy_NN(i)) = G_Up(Indx_NN(i), u) + G_Un(u, Indy_NN(i));
        end
    end
end
%%% choose the appropriate number of Universum
b_u = b_u(find(b_u > 0));
[~, b_u_ind] = sort(b_u, 'descend');
Uni_temp = Uni_mean(:, b_u_ind);
Uni = Uni_temp(:, 1:ceil(ratio * min(numel(ind{1, 1}), numel(ind{1, 2}))));

end



