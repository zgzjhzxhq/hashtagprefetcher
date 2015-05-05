clear all;
TData = csvread('0-1Train5.csv');
EData = csvread('0-1Test5.csv');
tic;
[m, n] = size(TData);

Y = zeros(5, m);

for i = 1:m
    Y(TData(i, n), i) = 1;
end;

X = TData(:, 1:n-1)';

setdemorandstream(491218382);

hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

[net,tr] = train(net, X, Y);


[m, n] = size(EData);

X1 = EData(:, 1:n-1)';

Y_hat = net(X1);
YY = zeros(m, 1);
Y1 = EData(:, n);

for i = 1:m
    if (Y_hat(1, i) > Y_hat(2, i))
        if (Y_hat(1, i) > Y_hat(3, i))
            if (Y_hat(1, i) > Y_hat(4, i))
                if (Y_hat(1, i) > Y_hat(5, i))
                    YY(i) = 1;
                else
                    YY(i) = 5;
                end;
            else
                if (Y_hat(4, i) > Y_hat(5, i))
                    YY(i) = 4;
                else
                    YY(i) = 5;
                end;
            end;
        else
            if (Y_hat(3, i) > Y_hat(4, i))
                if (Y_hat(3, i) > Y_hat(5, i))
                    YY(i) = 3;
                else
                    YY(i) = 5;
                end;
            else
                if (Y_hat(4, i) > Y_hat(5, i))
                    YY(i) = 4;
                else
                    YY(i) = 5;
                end;
            end;
        end;
    else
        if (Y_hat(2, i) > Y_hat(3, i))
            if (Y_hat(2, i) > Y_hat(4, i))
                if (Y_hat(2, i) > Y_hat(5, i))
                    YY(i) = 2;
                else
                    YY(i) = 5;
                end;
            else
                if (Y_hat(4, i) > Y_hat(5, i))
                    YY(i) = 4;
                else
                    YY(i) = 5;
                end;
            end;
        else
            if (Y_hat(3, i) > Y_hat(4, i))
                if (Y_hat(3, i) > Y_hat(5, i))
                    YY(i) = 3;
                else
                    YY(i) = 5;
                end;
            else
                if (Y_hat(4, i) > Y_hat(5, i))
                    YY(i) = 4;
                else
                    YY(i) = 5;
                end;
            end;
        end;
    end;
end;
toc;