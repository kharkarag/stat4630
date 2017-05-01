function [mdl] = rand_forest(X, Y, n_tree)
categVars = varfun(@iscategorical,s,'output','uniform');

mdl = TreeBagger(100, X, Y, 'Method', 'Classification', ...
    'CategoricalPredictors', categVars);

end 