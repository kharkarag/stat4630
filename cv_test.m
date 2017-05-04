category_var_index = categVars;
category_var_index = category_var_index(1:end-1);

n_fold = 5;

rng(11)
cv_group = crossvalind('Kfold', size(x_tree,1), n_fold);

result = y_tree.hotel_cluster;
for i = 1:n_fold
    disp(i);
     % create cross-validation training and testing test
    train_x = x_tree(cv_group~=i,1:end);
    train_y = y_tree(cv_group~=i,end);
    test_x = x_tree(cv_group==i,1:end);
    
     % decision tree without pruning 
    mdl_tree = dec_tree(train_x, train_y, category_var_index, 1, 0);
    result(cv_group==i,1) = predict(mdl_tree, test_x);
end 
sum(result == y_tree.hotel_cluster)/size(y_tree,1)

for i = 1:n_fold
    disp(i);
     % create cross-validation training and testing test
    train_x = x_tree(cv_group~=i,1:end);
    train_y = y_tree(cv_group~=i,end);
    test_x = x_tree(cv_group==i,1:end);  
    % decision tree with pruning
    mdl_tree_pruned = dec_tree(train_x, train_y, category_var_index, 1, 1);
    result(cv_group==i,1) = predict(mdl_tree_pruned, test_x);
end 
sum(result == y_tree.hotel_cluster)/size(y_tree,1)

for i = 1:n_fold
    disp(i);
    % create cross-validation training and testing test
    train_x = x_tree(cv_group~=i,1:end);
    train_y = y_tree(cv_group~=i,end);
    test_x = x_tree(cv_group==i,1:end);  
    % random forest
    mdl_forest = rand_forest(train_x, train_y, category_var_index, 100);
    result(cv_group==i,1) = predict(mdl_forest, test_x);
end 
sum(result == y_tree.hotel_cluster)/size(y_tree,1)

for i = 1:n_fold
    disp(i);
     % create cross-validation training and testing test
    train_x = x_tree(cv_group~=i,1:end);
    train_y = y_tree(cv_group~=i,end);
    test_x = x_tree(cv_group==i,1:end);
    
    % most popular local cluster
    destination_cat = categories(x_tree.srch_destination_id); 
    clusters = categories(y_tree.hotel_cluster);
    cat_cluster_pair = zeros(size(destination_cat,1),1); %save the most popular cluster for each destination
    % get the most popular destination for each destination
    for j = 1:size(destination_cat,1)
        count = countcats(y_tree.hotel_cluster(x_tree.srch_destination_id == cat{j}));
        maximum_index = find(count==max(count));
        if maximum_index > 1
            maximum_index = maximum_index(randperm(size(maximum_index,1),1));
        end 
        cat_cluster_pair(j) = maximum_index;
    end
    
    %apply the most popular destination to the testing set 
    row_num = find(cv_group==i);
    test_dest = test_x.srch_destination_id;
    for k = 1:size(test_dest,1)
        result(row_num(k),1) = clusters(cat_cluster_pair(destination_cat == test_dest(k)));
    end  
end 
sum(result == y_tree.hotel_cluster)/size(y_tree,1)
