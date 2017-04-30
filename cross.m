rng(5);

[n, ~] = size(s);

indices = crossvalind('Kfold', n, 3);
s_categ_train = categ_dummy_clean(indices == 1, :);
s_categ_val = categ_dummy_clean(indices == 2, :);
s_categ_test = categ_dummy_clean(indices == 3, :);

s_num_train = s_num(indices == 1, :);
s_num_val = s_num(indices == 2, :);
s_num_test = s_num(indices == 3, :);

