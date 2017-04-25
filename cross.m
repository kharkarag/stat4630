rng(11);

[n, ~] = size(s);

indices = crossvalind('Kfold', n, 3);
s_train = s(indices == 10, :);
s_val = s(indices == 2, :);
s_test = s(indices == 3, :);

