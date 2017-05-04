function [mdl] = rand_forest(X, Y, n_tree)
categVars = varfun(@iscategorical, X,'output','uniform');
mdl = TreeBagger(n_tree, X, Y, 'Method', 'Classification', ...
    'CategoricalPredictors', categVars);

end 