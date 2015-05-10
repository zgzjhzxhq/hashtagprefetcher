clear all;
addpath('../../libsvm/matlab');

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
        
        model = svmtrain(y, sparse(x));
        
        [predict_label, accuracy, prob_values] = svmpredict(Y, sparse(X), model); % test the training data
        
        a = size(find(predict_label==Y),1) / m;
        A(iters, i) = a;
    end
end

csvwrite('learningcurve.csv', A);
