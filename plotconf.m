C = zeros(5, 5);

for fold = 1:5

    Y = csvread(strcat('../../CVData/',int2str(fold),'/0-1','Test',int2str(fold),'.csv'));
    [m, n] = size(Y);
    Y = Y(:, n);

    predict = csvread(strcat('CV', int2str(fold), '.csv'));

    C1 = confusionmat(Y, predict);
        
    C = C + C1;
end

C = C / 5;

C = C ./ repmat(sum(C, 2), 1, 5);

C = C * 100;
% imagesc(C)
% colormap(gray) 
% colorbar

