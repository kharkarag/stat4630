category_var_index = categVars;
category_var_index = category_var_index(1:end-1);

n_fold = 5;

rng(11)
cv_group = crossvalind('Kfold', size(x_tree,1), n_fold);

result = zeros(size(x_tree,1), 3);
for i = 1:n_fold
    disp(i);
    train_x = x_tree(cv_group~=i,1:end);
    train_y = y_tree(cv_group~=i,end);
    test_x = x_tree(cv_group==i,1:end);
   
    mdl_tree = dec_tree(train_x, train_y, category_var_index, 1, 0);
    mdl_tree_pruned = dec_tree(train_x, train_y, category_var_index, 1, 1);
    mdl_forest = rand_forest(train_x, train_y, category_var_index, 100);
    
    result(cv_group==i,1) = predict(mdl_tree, test_x);
    result(cv_group==i,2) = predict(mdl_tree_pruned, test_x);   
    result(cv_group==i,3) = predict(mdl_forest, test_x);   
end 

sum(result(:,1) == y_tree(:,end)) / size(y_tree,1)
