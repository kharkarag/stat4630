s_original = readtable('Strain.csv');

d = readtable('destinations.csv');

%s_original = join(s_original, d, 'keys', 'srch_destination_id');

nrow = size(s_original,1);
sample_size = 30000;
sample = randperm(nrow, sample_size)';
s_sample = s_original(sample,:);

[s_sample,s_cat] = categorical_conversion(s_sample);
catogory_var_index = varfun(@iscategorical,s_cat,'output','uniform');
catogory_var_index = catogory_var_index(1:end-1);
s_sample = s_cat;

%get categories
cat = categories(s_cat.srch_destination_id);
clusters = categories(s_cat.hotel_cluster);

n_fold = 5;

rng(11)
cv_group = crossvalind('Kfold', sample_size, n_fold);
result = s_sample.hotel_cluster;

for i = 1:n_fold
    disp(i);
    cat_cluster_result = s_cat.hotel_cluster(1:size(cat,1));
    train_x = s_cat(cv_group~=i,1:end-1);
    train_y = s_cat(cv_group~=i,end);
    test_x = s_cat(cv_group==i,1:end-1);

    for j = 1:size(cat,1)
        count = countcats(train_y.hotel_cluster(train_x.srch_destination_id == cat{j}));
        maximum_index = find(count==max(count));
        if maximum_index > 1
            maximum_index = maximum_index(randperm(size(maximum_index,1),1));
        end 
        cat_cluster_result(j) = clusters{maximum_index};
    end
    
    row_num = find(cv_group==i);
    test_dest = test_x.srch_destination_id;
    for k = 1:size(test_dest,1)
        result(row_num(k)) = cat_cluster_result(cat == test_dest(k));
    end
        
end 

sum(result == s_sample(:,end)) / size(result,1)

full_x = s_sample(:,1:end-1);
full_y = s_sample(:,end);
mdl_tree = dec_tree(full_x, full_y, catogory_var_index, 1, 1);
% model_forest = rand_forest(train_x, train_y, 100);
% result_forest = predict(model_forest, test_x)
% sum(test_y.hotel_cluster == result_forest)/size(test_y,1)


s_sample(:,11)
