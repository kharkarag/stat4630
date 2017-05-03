rng(5);

[n, ~] = size(s);

indices = crossvalind('Kfold', n, 3);
<<<<<<< Updated upstream
s_categ_train = categ_dummy_clean(indices == 1, :);
s_categ_val = categ_dummy_clean(indices == 2, :);
s_categ_test = categ_dummy_clean(indices == 3, :);

s_num_train = s_num(indices == 1, :);
s_num_val = s_num(indices == 2, :);
s_num_test = s_num(indices == 3, :);
=======
s_train = s(indices == 1, :);
s_val = s(indices == 2, :);
s_test = s(indices == 3, :);
>>>>>>> Stashed changes

y_train = double(s.hotel_cluster(indices == 1, :));
y_val = double(s.hotel_cluster(indices == 2, :));
y_test = double(s.hotel_cluster(indices == 3, :));

s_train = [s_categ_train s_num_train y_train];
s_val = [s_categ_val s_num_val y_val];
s_test = [s_categ_test s_num_test y_test];