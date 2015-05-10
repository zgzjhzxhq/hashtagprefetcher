
lambda = 1;
load ./1/0-1Test1.csv;
load ./1/0-1Train1.csv;
M_train = X0_1Train1(:, 1:end - 1);
b_train = X0_1Train1(:, end);
M_test = X0_1Test1(:, 1:end-1);
b_test = X0_1Test1(:, end);
b_subtrain = zeros(length(b_train), 5);
b_subtest = zeros(length(b_test), 5);
for i = 1:5
    b_subtrain(b_train == i, i) = 1;
    b_subtest(b_test == i, i) = 1;
    svmstruct = svmtrain(M_train, b_subtrain(:, i), 'kernel_function', 'rbf', 'rbf_sigma', lambda);
    group(:, i)= svmclassify(svmstruct, M_test) * i;
end
output = sum(group, 2);
csvwrite('CV1_1', output);
% 
% load ./2/0-1Test2.csv;
% load ./2/0-1Train2.csv;
% M_train = X0_1Train2(:, 1:end - 1);
% b_train = X0_1Train2(:, end);
% M_test = X0_1Test2(:, 1:end-1);
% b_test = X0_1Test2(:, end);
% b_subtrain = zeros(length(b_train), 5);
% b_subtest = zeros(length(b_test), 5);
% for i = 1:5
%     b_subtrain(b_train == i, i) = 1;
%     b_subtest(b_test == i, i) = 1;
%     svmstruct = svmtrain(M_train, b_subtrain(:, i), 'kernel_function', 'rbf', 'rbf_sigma', lambda);
%     group = svmclassify(svmstruct, M_test);
%     accuracy(i,3) = 1-sum(group ~= b_subtest(:, i))/length(b_subtest(:, i));
% end
% 
% load ./3/0-1Test3.csv;
% load ./3/0-1Train3.csv;
% M_train = X0_1Train3(:, 1:end - 1);
% b_train = X0_1Train3(:, end);
% M_test = X0_1Test3(:, 1:end-1);
% b_test = X0_1Test3(:, end);
% b_subtrain = zeros(length(b_train), 5);
% b_subtest = zeros(length(b_test), 5);
% for i = 1:5
%     b_subtrain(b_train == i, i) = 1;
%     b_subtest(b_test == i, i) = 1;
%     svmstruct = svmtrain(M_train, b_subtrain(:, i), 'kernel_function', 'rbf', 'rbf_sigma', lambda);
%     group = svmclassify(svmstruct, M_test);
%     accuracy(i,5) = 1-sum(group ~= b_subtest(:, i))/length(b_subtest(:, i));
% end
%     
% 
% load ./4/0-1Test4.csv;
% load ./4/0-1Train4.csv;
% M_train = X0_1Train1(:, 1:end - 1);
% b_train = X0_1Train1(:, end);
% M_test = X0_1Test1(:, 1:end-1);
% b_test = X0_1Test1(:, end);
% b_subtrain = zeros(length(b_train), 5);
% b_subtest = zeros(length(b_test), 5);
% for i = 1:5
%     b_subtrain(b_train == i, i) = 1;
%     b_subtest(b_test == i, i) = 1;
%     svmstruct = svmtrain(M_train, b_subtrain(:, i), 'kernel_function', 'rbf', 'rbf_sigma', lambda);
%     group = svmclassify(svmstruct, M_test);
%     accuracy(i,7) = 1-sum(group ~= b_subtest(:, i))/length(b_subtest(:, i));
% end
% 
% load ./5/0-1Test5.csv;
% load ./5/0-1Train5.csv;
% M_train = X0_1Train5(:, 1:end - 1);
% b_train = X0_1Train5(:, end);
% M_test = X0_1Test5(:, 1:end-1);
% b_test = X0_1Test5(:, end);
% b_subtrain = zeros(length(b_train), 5);
% b_subtest = zeros(length(b_test), 5);
% for i = 1:5
%     b_subtrain(b_train == i, i) = 1;
%     b_subtest(b_test == i, i) = 1;
%     svmstruct = svmtrain(M_train, b_subtrain(:, i), 'kernel_function', 'rbf', 'rbf_sigma', lambda);
%     group = svmclassify(svmstruct, M_test);
%     accuracy(i,9) = 1-sum(group ~= b_subtest(:, i))/length(b_subtest(:, i));
% end
%    
% 
% 
