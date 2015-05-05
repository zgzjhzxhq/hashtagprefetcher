error = 0;

for i = 1:1000
    if (Y1(i) ~= YY(i))
        error = error + 1;
    end;
end;