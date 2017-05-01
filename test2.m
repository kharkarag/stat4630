Xs_original = readtable('Strain.csv');

d = readtable('destinations.csv');

s = categorical_conversion(s_original);

[nrow, ncol] = size(s);

sample = randsample(nrow, nrow);

train_x = s(sample(1:fix(nrow*3/4)), 1:end-1);
train_y = s(sample(1:fix(nrow*3/4)), end);
test_x = s(sample(fix(nrow*3/4)+1:end), 1:end-1);
test_y =  s(sample(fix(nrow*3/4)+1:end), end);

mdl_tree = dec_tree(train_x, train_y, 1);

