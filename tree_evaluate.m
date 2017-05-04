function tree_evaluate(tree_pred, y_eval)
tree_pred(tree_pred == 91) = 5;
tree_pred(tree_pred == 64) = 3;
tree_pred(tree_pred == 65) = 4;
tree_pred(tree_pred == 48) = 2;
tree_pred(tree_pred == 41) = 1;

%[~, pred] = max(dummyvar(tree_pred));

evaluate(tree_pred, y_eval);

end