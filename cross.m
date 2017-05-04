rng(5);

% Create master dataset
master = [normc(s_num) s_dummy double(s.hotel_cluster)];
[n, p] = size(master);

% Define a subset that we will work with
sample = randsample(n, 310000);
working_set = master(sample, :);
indices = crossvalind('Kfold', 310000, 31);

% Testing holdout of 10K - for final analysis
s_test = working_set(indices == 1, :);
x_test = s_test(:, 1:(end-1));
y_test = s_test(:, end);

% Main training subset of 300K
% Used directly by main(LDA) set
s_lda = working_set(indices > 1, :);
x_lda = s_lda(:, 1:(end-1));
y_lda = s_lda(:, end);

clear working_set

% Decision tree training set - 100K
% Subset of the main (LDA) set

sample_50 = randsample(100000, 50000);

master_tree = s(sample, :);
working_tree = master_tree(indices > 1, :);
s_tree = working_tree(sample_50, :);
x_tree = s_tree(:, 1:(end-1));
y_tree = s_tree(:, end);

s_tree_test = master_tree(indices == 1, :);
x_tree_test = s_tree_test(:, 1:(end-1));
y_tree_test = s_tree_test(:, end);
clear working_tree master_tree;

% Neural network subset - 50K
% Not all used at once
s_neural = s_lda(sample_50, :);

indices_neural = crossvalind('Kfold', 50000, 10);
s_neural_struct_train = s_neural(indices_neural == 1, :);
x_neural_struct_train = s_neural_struct_train(:, 1:(end-1));
y_neural_struct_train = dummyvar(s_neural_struct_train(:, end));

s_neural_struct_holdout = s_neural(indices_neural == 2, :);
x_neural_struct_holdout = s_neural_struct_holdout(:, 1:(end-1));
y_neural_struct_holdout = s_neural_struct_holdout(:, end);

s_neural_cv = s_neural(indices_neural > 2, :);


% -------------------------------------------------

% indices = crossvalind('Kfold', n, 3);
% 
% s_categ_train = categ_dummy(indices == 1, :);
% s_categ_val = categ_dummy(indices == 2, :);
% s_categ_test = categ_dummyn(indices == 3, :);
% 
% s_num_train = s_num(indices == 1, :);
% s_num_val = s_num(indices == 2, :);
% s_num_test = s_num(indices == 3, :);
% 
% y_train = double(s.hotel_cluster(indices == 1, :));
% y_val = double(s.hotel_cluster(indices == 2, :));
% y_test = double(s.hotel_cluster(indices == 3, :));
% 
% s_train = [s_categ_train s_num_train y_train];
% s_val = [s_categ_val s_num_val y_val];
% s_test = [s_categ_test s_num_test y_test];