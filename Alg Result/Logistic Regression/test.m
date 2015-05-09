clear all;
addpath('../../liblinear/matlab');

fold = 5;

TData = csvread(strcat('../../CVData/',int2str(fold),'/0-1','Train',int2str(fold),'.csv'));

[m, n] = size(TData);

Y = TData(:, n);
X = TData(:, 1:n-1);

model = train(Y, sparse(X),'-s 0');


EData = csvread(strcat('../../CVData/',int2str(fold),'/0-1','Test',int2str(fold),'.csv'));

[m, n] = size(EData);

Y1 = EData(:, n);
X1 = EData(:, 1:n-1);

[predict_label, accuracy, dec_values] = predict(Y1, sparse(X1), model); % test the training data

csvwrite(strcat('CV',int2str(fold),'.csv'), predict_label);