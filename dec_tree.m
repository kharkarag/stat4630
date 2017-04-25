function dec_tree(X, y)

Mdl = fitctree(X,Y);
Ynew = predict(Mdl,X);
% Depth control

fitctree(X,Y,'CrossVal','On','MinLeafSize',leafs(n));
[~,~,~,bestlevel] = cvLoss(tree,'SubTrees','All')
    
% Pruning

tree = prune(tree,'Level',6);

end