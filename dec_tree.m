function dec_tree(X, y)

Mdl = fitctree(X,Y)

% Depth control

fitctree(X,Y,'CrossVal','On',...
        'MinLeafSize',leafs(n));

% Pruning

tree = prune(tree,'Level',6);

end