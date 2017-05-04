function [mdl] = dec_tree(X, Y, categorical_index, rule_n, pruning)

% categVars = varfun(@iscategorical,X,'output','uniform');
% Select Splitting rules
rules = {'gdi', 'twoing', 'deviance'};
selected_rule = rules{rule_n};

% Model construction
tree = fitctree(X,Y, 'SplitCriterion', selected_rule,  'CategoricalPredictors', categorical_index);

if pruning == 1
    % Optimize Pruning Level
    [~,~,~,bestlevel] = cvLoss(tree,'SubTrees','All','TreeSize','min');
    
    % Pruning
    tree = prune(tree,'Level',bestlevel);
end 

mdl = tree;
end