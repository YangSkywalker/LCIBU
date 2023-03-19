function Uni = CIBU(X, Y, ratio, k)

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
% author: Yang Xiangfei;  Date: 2022/4/26

%%% set default value of parameters 
if nargin < 2 | nargin > 4
    error('The number of input parameters are wrong.');
end

if nargin == 2
    Threshold = 5; k = 5;
end

if nargin == 3
    k = 5;
end
%%% create universum
L = unique(Y); c = numel(L);
ind = cell(1, c); ind{1, 1} = find(Y==1); ind{1,2} = find(Y==-1);
[eIdx_xy, eD_xy] = knnsearch(X(:, ind{1,1})', X(:, ind{1,2})', 'K', k);
[eIdx_yx, eD_yx] = knnsearch(X(:, ind{1,2})', X(:, ind{1,1})', 'K', k);
A = zeros(numel(ind{1,1}), numel(ind{1,2}));      % Affinity matrix(only 1 and -1)
G = zeros(numel(ind{1,1}), numel(ind{1,2}));      % Affinity matrix(Eulidean distance)
% compute A and S
for i = 1:numel(ind{1,1})
    for j = 1:k
        A(i, eIdx_yx(1, j)) = 1;
        G(i, eIdx_yx(1, j)) = eD_yx(i, j);
    end 
end
for i = 1:numel(ind{1,2})
    for j = 1:k
        A(eIdx_xy(1, j), i) = 1;
        G(eIdx_xy(1, j), i) = eD_xy(i, j);
    end 
end
% generate universum
Uni_mean = [];
[indx_uni, indy_uni] = find(sparse(A));
count = 1;
for i = 1:numel(indx_uni)
    uni_temp =  (X(:, ind{1,1}(indx_uni(i))) + X(:, ind{1,2}(indy_uni(i))))/2;
    Uni_mean(:, count) = uni_temp;
    count = count + 1;
end
%%% select in-between universum
% G = G.^2; G(find(A == 0)) = inf;
% b_u = zeros(1, size(Uni_mean,2));
% for u = 1:size(Uni_mean, 2)
%     for i = 1:numel(ind{1,1})
%         for j = 1:numel(ind{1,2})
%             if  norm(Uni_mean(:, u) - X(:, ind{1,1}(indx_uni(i))))^2 + norm(Uni_mean(:, u) - ...
%                     X(:, ind{1,2}(indy_uni(i))))^2 < G(i, j)
%                 b_u(u) = b_u(u) + 1;
%             end
%             G(i, j) = min(G(i, j),  norm(Uni_mean(:, u) - X(:, ind{1,1}(indx_uni(i))))^2 + norm(Uni_mean(:, u) - ...
%                     X(:, ind{1,2}(indy_uni(i))))^2);
%         end
%     end 
% end
% choose apropriate amount of universum
Uni = Uni_mean;
if size(Uni, 2) > min(numel(ind{1,1}), numel(ind{1,2}))
    Uni = Uni_mean(:, randperm(size(Uni_mean, 2) ,ceil(ratio * min(numel(ind{1, 1}), numel(ind{1, 2})))));
end

end






