s_original = readtable('Strain.csv');

% d = readtable('destinations.csv');

[~,s] = categorical_conversion(s_original);


a = table2array(s);
[nrow, ncol] = size(s);

sample = randperm(nrow,10000)';
nrow = size(sample, 1);

train_x = s(sample(1:fix(nrow*3/4)), 1:end-1);
train_y = s(sample(1:fix(nrow*3/4)), end);
test_x = s(sample(fix(nrow*3/4)+1:end), 1:end-1);
test_y =  s(sample(fix(nrow*3/4)+1:end), end);

mdl_tree = dec_tree(train_x, train_y, 1, 1);
result_tree = predict(mdl_tree, test_x);
sum(test_y.hotel_cluster == result_tree)/size(test_y,1)

model_forest = rand_forest(train_x, train_y, 100);
result_forest = predict(model_forest, test_x)
sum(test_y.hotel_cluster == result_forest)/size(test_y,1)
