error = 0;
for i = 1:1000
    if (Y1(i) ~= Y_hat(i))
        error = error + 1;
        display(i);
    end;
end;