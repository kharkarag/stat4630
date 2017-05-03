function [mdl] = dec_tree(X, Y, rule_n)

% Select Splitting rules
rules = {'gdi', 'twoing', 'deviance'};
selected_rule = rules{rule_n};

% Model construction
tree = fitctree(X,Y, 'SplitCriterion', selected_rule);

% Optimize Pruning Level
[~,~,~,bestlevel] = cvLoss(tree,...
    'SubTrees','All','TreeSize','min');
    
% Pruning
mdl = prune(tree,'Level',bestlevel);
end