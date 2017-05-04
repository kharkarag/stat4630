
% Train the committee

indices_boost = crossvalind('Kfold', 40000, 8);
committee = cell([8, 2]);

for i = 1:8
   batch = s_neural_cv(indices_boost == i, :);
   x_batch = batch(:, 1:(end-1));
   y_batch = dummyvar(batch(:, end));
   [committee{i, :}] = neural_net(x_batch, y_batch, 0, ideal_layers);
end
clear batch x_batch y_batch

% Evaluate the committee

accuracies = zeros(1, 8);
for i = 1:8
   x_holdout = s_neural_cv(indices_boost == i, 1:(end-1));
   y_holdout = s_neural_cv(indices_boost == i, end);
   aggregate = zeros(5, 5000);
   fprintf('Holdout #%d\n', i);
   for j = indices_boost(indices_boost ~= i)
       net = committee{j, 1};
       yhat = net(x_holdout.');
       [m, class] = max(yhat);
       aggregate = aggregate + dummyvar(class).';
   end
   [~, ind] = max(aggregate);
   accuracies(i) = evaluate(ind.', y_holdout); 
   
end
clear x_holdout y_holdout aggregate net yhat;

fprintf('Average accuracy of committee: %2.2f%%\n', mean(accuracies)*100);

% ------------

[n_train, ~] = size(s_train);

results = cell([5, 4]);

X_te = X_test(:, ensemble == int32(e));
y_te = y_d_test(:, ensemble == int32(e));

for i = 1:5
    X_tr = X_train(:, ensemble == i);
    y_tr = y_d_train(:, ensemble == i);
    y_target = y_test(ensemble == i,:);
    fprintf('Neural net #%d\n', i);
    [results{i, :}] = neural_net(X_tr, y_tr, X_te, y_target, [200 200 100 50]);
end