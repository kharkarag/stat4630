function [mdl] = rand_forest(X, Y, categorical_index, n_tree)
mdl = TreeBagger(n_tree, X, Y, 'Method', 'Classification', ...
    'CategoricalPredictors', categorical_index);

end 