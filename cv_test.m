s_original = readtable('Strain.csv');

d = readtable('destinations.csv');

%s_original = join(s_original, d, 'keys', 'srch_destination_id');

nrow = size(s_original,1);
sample_size = 10000;
sample = randperm(nrow, sample_size)';
s_sample = s_original(sample,:);

[s_sample,s_cat] = categorical_conversion(s_sample);
catogory_var_index = varfun(@iscategorical,s_cat,'output','uniform');
catogory_var_index = catogory_var_index(1:end-1);

n_fold = 5;

rng(11)
cv_group = crossvalind('Kfold', sample_size, n_fold);
result = zeros(sample_size, 1);

for i = 1:n_fold
    disp(i);
    train_x = s_sample(cv_group~=i,1:end-1);
    train_y = s_sample(cv_group~=i,end);
    test_x = s_sample(cv_group==i,1:end-1);
   
    mdl_tree = dec_tree(train_x, train_y, catogory_var_index, 1, 1);
    result(cv_group==i,1) = predict(mdl_tree, test_x);   
end 

sum(result == s_sample(:,end)) / size(result,1)

full_x = s_sample(:,1:end-1);
full_y = s_sample(:,end);
mdl_tree = dec_tree(full_x, full_y, catogory_var_index, 1, 1);
% model_forest = rand_forest(train_x, train_y, 100);
% result_forest = predict(model_forest, test_x)
% sum(test_y.hotel_cluster == result_forest)/size(test_y,1)


s_sample(:,11)
