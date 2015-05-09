clear all;
addpath('../../libsvm/matlab');

fold = 5;

TData = csvread(strcat('../../CVData/',int2str(fold),'/0-1','Train',int2str(fold),'.csv'));

[m, n] = size(TData);

Y = TData(:, n);
X = TData(:, 1:n-1);

KNN = fitcknn(X,Y,'NumNeighbors',5);

EData = csvread(strcat('../../CVData/',int2str(fold),'/0-1','Test',int2str(fold),'.csv'));

[m, n] = size(EData);

Y1 = EData(:, n);
X1 = EData(:, 1:n-1);

label = predict(KNN, X1);

csvwrite(strcat('CV',int2str(fold),'.csv'), label);

accuracy = size(find(label==Y1), 1) / m;