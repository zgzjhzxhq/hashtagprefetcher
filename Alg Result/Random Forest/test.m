clear all;
TData = csvread('0-1Train5.csv');

[m, n] = size(TData);

Y = TData(:, n);
X = TData(:, 1:n-1);

model = classRF_train(X, Y);

EData = csvread('0-1Test5.csv');

[m, n] = size(EData);

Y1 = EData(:, n);
X1 = EData(:, 1:n-1);

Y_hat = classRF_predict(X1, model);