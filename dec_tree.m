function [mdl] = dec_tree(X, Y, rule_n, pruning)

% Select Splitting rules
rules = {'gdi', 'twoing', 'deviance'};
selected_rule = rules{rule_n};

% Model construction
tree = fitctree(X,Y, 'SplitCriterion', selected_rule);

if pruning == 1
    % Optimize Pruning Level
    [~,~,~,bestlevel] = cvLoss(tree,...
    'SubTrees','All','TreeSize','min');
    
    % Pruning
    mdl = prune(tree,'Level',bestlevel);
end 

end