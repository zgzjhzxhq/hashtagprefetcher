numIters = 10;
sampleSize = [1 2 4 10 20 50 100 200 400];

TData = csvread('0-1Train1.csv');

%%
for iters = 1:numIters
    for i = 1:length(sampleSize)
        ind = randperm(800);
        t = TData(ind(1:sampleSize(i)), :);
        
        ind = randperm(800);
        t = [t;TData(800+ind(1:sampleSize(i)), :)];

        ind = randperm(800);
        t = [t;TData(1600+ind(1:sampleSize(i)), :)];
        
        ind = randperm(800);
        t = [t;TData(2400+ind(1:sampleSize(i)), :)];

        ind = randperm(800);
        t = [t;TData(3200+ind(1:sampleSize(i)), :)];

        filename = strcat('sampled_',sprintf('%03d',sampleSize(i)),'_',sprintf('%02d',iters),'.csv');
        
        csvwrite(filename, t);
    end
end