%% k = 3
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,3);
%%%
figure(1)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
% legend('class 1', 'class -1', 'Universum','Location','northoutside','Orientation','horizontal')
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])

%% k = 5
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,5);
%%%
figure(2)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])

%% k = 7
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,7);
%%%
figure(3)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])
%% k = 9
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,9);
%%%
figure(4)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])

%% k = 20
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,20);
%%%
figure(5)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])

%% k = 30
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,30);
%%%
figure(6)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])

%% k = 40
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,40);
%%%
figure(7)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])

%% k = 50
clear all; clc

rand('state',3);
randn('state',3);

n1 = 50;
n2 = 500;
X1=[randn(2,n1).*repmat([1;2],[1 n1])+repmat([-6;0],[1 n1])];
X2= [randn(2,n2 ).*repmat([2;4],[1 n2 ])+repmat([ 2;0],[1 n2 ])];
X=[X1 X2];
Y=[ones(n1,1);-1*ones(n2,1)]; 

U = LCIBU(X, Y,0.6,50);
%%%
figure(8)
h=plot(X(1,Y==1),X(2,Y==1),'bo','MarkerSize',6); hold on
h=plot(X(1,Y==-1),X(2,Y==-1),'rx','MarkerSize',6); hold on
h=plot(U(1, 1:size(U,2)), U(2, 1:size(U,2)), 'm.','MarkerSize',12); hold on
axis equal
axis([-10 10 -10 10])
legend('class 1', 'class -1', 'Universum','Location','southeast')
set(gca,'FontName','Helvetica','FontSize',12);
set(gca,'looseInset',[0 0 0 0])
