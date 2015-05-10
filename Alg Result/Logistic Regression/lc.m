clear all;
addpath('../../liblinear/matlab');

E = csvread('../../CVData/1/0-1Test1.csv');
[m, n] = size(E);

Y = E(:, n);
X = E(:, 1:n-1);

numIters = 10;

sampleSize = [1 2 4 10 20 50 100 200 400];

A = zeros(numIters, size(sampleSize,2));

for iters = 1:numIters
    for i = 1:size(sampleSize, 2)
        filename = strcat('../../CVData/1/sampled_',sprintf('%03d',sampleSize(i)),'_',sprintf('%02d',iters),'.csv');
        T = csvread(filename);
        y = T(:, end);
        x = T(:, 1:end-1);
        
        model = train(y, sparse(x),'-s 0');
        
        [predict_label, accuracy, prob_values] = predict(Y, sparse(X), model, '-b 1'); % test the training data
        
        a = size(find(predict_label==Y),1) / m;
        A(iters, i) = a;
    end
end

csvwrite('learningcurve.csv', A);

% clear all;
% addpath('../../liblinear/matlab');
% 
% fold = 1;
% 
% TData = csvread(strcat('../../CVData/',int2str(fold),'/0-1','Train',int2str(fold),'.csv'));
% 
% [m, n] = size(TData);
% 
% Y = TData(:, n);
% X = TData(:, 1:n-1);
% 
% EData = csvread('../../CVData/1/0-1Test1.csv');
% [m, n] = size(EData);
% 
% Y1 = EData(:, n);
% X1 = EData(:, 1:n-1);
% 
% A = [];
% step = 1;
% for i = 1:10
%     x = X(1 : step*i, :);
%     x = [x; X(801 : step*i+800, :)];
%     x = [x; X(1601 : step*i+1600, :)];
%     x = [x; X(2401 : step*i+2400, :)];
%     x = [x; X(3201 : step*i+3200, :)];
%     y = Y(1 : step*i);
%     y = [y; Y(801 : step*i+800)];
%     y = [y; Y(1601 : step*i+1600)];
%     y = [y; Y(2401 : step*i+2400)];
%     y = [y; Y(3201 : step*i+3200)];
%     
%     model = train(y, sparse(x),'-s 0');
%     
%     [predict_label, accuracy, prob_values] = predict(Y1, sparse(X1), model, '-b 1'); % test the training data
%     
%     a = size(find(predict_label==Y1),1) / m;
%     A = [A; a];
% end
% 
% 
% %%
% A = zeros(5, 10);
% step = 1;
% for iters = 1:5
%     for i = 1:10
%         ind = randperm(800);
%         x = X(ind(1:step*i), :);
%         y = Y(ind(1:step*i), :);
% 
%         ind = randperm(800);
%         x = [x;X(800+ind(1:step*i), :)];
%         y = [y;Y(800+ind(1:step*i), :)];
% 
%         ind = randperm(800);
%         x = [x;X(1600+ind(1:step*i), :)];
%         y = [y;Y(1600+ind(1:step*i), :)];
% 
%         ind = randperm(800);
%         x = [x;X(2400+ind(1:step*i), :)];
%         y = [y;Y(2400+ind(1:step*i), :)];
% 
%         ind = randperm(800);
%         x = [x;X(3200+ind(1:step*i), :)];
%         y = [y;Y(3200+ind(1:step*i), :)];
%         
%         model = svmtrain(y, sparse(x));
%         [predict_label, accuracy, prob_values] = svmpredict(Y1, sparse(X1), model); % test the training data
%         
%         a = size(find(predict_label==Y1),1) / m;
%         A(iters, i) = a;
%     end
% end