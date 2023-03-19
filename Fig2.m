%% =====================pairwise neighbors (black points) k = 5==============================
clear all; clc

rand('state',5);
randn('state',5);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-4;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 3;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 


%%%
k=5; ratio = 1;
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
U = Uni;

%%%
figure(1)
clf
hold on

set(gca,'FontName','Helvetica')
set(gca,'FontSize',12)
axis([-6.5 8 -10 10])
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6);
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6);
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12);
h=plot(X(1,ind{1,1}(Indx_NN)),X(2,ind{1,1}(Indx_NN)),'ko','MarkerSize',6);
h=plot(X(1,ind{1,2}(Indy_NN)),X(2,ind{1,2}(Indy_NN)),'kx','MarkerSize',6);
legend('class 1', 'class -1','Universum', 'Pairwise neighbors in class 1','Pairwise neighbors in class -1','Location','best','Orientation','horizontal','NumColumns',1)
% legend('class 1', 'class -1', 'Neighbors in class 1','Neighbors in class -1','Location','northoutside','Orientation','horizontal')
% legend('class 1', 'class -1', 'Universum', 'Neighbors in class 1','Neighbors in class -1','Location','best')
set(gca,'looseInset',[0 0 0 0])
box on

%% =====================pairwise neighbors (black points) k = 9==============================
clear all; clc

rand('state',5);
randn('state',5);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-4;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 3;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 


%%%
k=9; ratio = 1;
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
U = Uni;

%%%
figure(2)
clf
hold on

set(gca,'FontName','Helvetica')
set(gca,'FontSize',12)
axis([-6.5 8 -10 10])
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6);
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6);
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12);
h=plot(X(1,ind{1,1}(Indx_NN)),X(2,ind{1,1}(Indx_NN)),'ko','MarkerSize',6);
h=plot(X(1,ind{1,2}(Indy_NN)),X(2,ind{1,2}(Indy_NN)),'kx','MarkerSize',6);
legend('class 1', 'class -1','Universum', 'Pairwise neighbors in class 1','Pairwise neighbors in class -1','Location','best','Orientation','horizontal','NumColumns',1)
% legend('class 1', 'class -1', 'Neighbors in class 1','Neighbors in class -1','Location','northoutside','Orientation','horizontal')
% legend('class 1', 'class -1', 'Universum', 'Neighbors in class 1','Neighbors in class -1','Location','best')
set(gca,'looseInset',[0 0 0 0])
box on

%% =====================pairwise neighbors (black points) k = 20==============================
clear all; clc

rand('state',5);
randn('state',5);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-4;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 3;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 


%%%
k=13; ratio = 1;
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
U = Uni;

%%%
figure(3)
clf
hold on

set(gca,'FontName','Helvetica')
set(gca,'FontSize',12)
axis([-6.5 8 -10 10])
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6);
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6);
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12);
h=plot(X(1,ind{1,1}(Indx_NN)),X(2,ind{1,1}(Indx_NN)),'ko','MarkerSize',6);
h=plot(X(1,ind{1,2}(Indy_NN)),X(2,ind{1,2}(Indy_NN)),'kx','MarkerSize',6);
legend('class 1', 'class -1','Universum', 'Pairwise neighbors in class 1','Pairwise neighbors in class -1','Location','best','Orientation','horizontal','NumColumns',1)
%legend('class 1', 'class -1', 'Universum', 'Neighbors in class 1','Neighbors in class -1','Location','best')
set(gca,'looseInset',[0 0 0 0])
box on


