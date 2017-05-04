
for i = 1:8
   aggregate = zeros(5, 10000);
   net = committee{i, 1};
   yhat = net(x_test.');
   [m, class] = max(yhat);
   aggregate = aggregate + dummyvar(class).';
   [~, nn_pred] = max(aggregate);
end

lda_pred = predict(lda_model, x_test);

tree_model = rand_forest(x_tree, y_tree, category_var_index, 1);
tree_pred = str2double(predict(tree_model, x_tree_test));

tree_pred(tree_pred == 91) = 5;
tree_pred(tree_pred == 64) = 3;
tree_pred(tree_pred == 65) = 4;
tree_pred(tree_pred == 48) = 2;
tree_pred(tree_pred == 41) = 1;

ensemble_aggregate = zeros(5, 10000);
ensemble_aggregate = ensemble_aggregate + dummyvar(nn_pred).';
ensemble_aggregate = ensemble_aggregate + dummyvar(lda_pred).';
ensemble_aggregate = ensemble_aggregate + dummyvar(tree_pred).';
[~, ensemble_pred] = max(ensemble_aggregate);

disp('Ensemble prediction accuracy');
evaluate(ensemble_pred.', y_test);