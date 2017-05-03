[n_train, ~] = size(s_train);

e = floor(n_train/15000);
ensemble = crossvalind('Kfold', n_train, e);

results = cell([int32(e), 4]);

X_te = X_test(:, ensemble == int32(e));
y_te = y_d_test(:, ensemble == int32(e));

for i = 1:(e-1)
    X_tr = X_train(:, ensemble == i);
    y_tr = y_d_train(:, ensemble == i);
    y_target = y_test(ensemble == i,:);
    fprintf('Neural net #%d\n', i);
    [results{i, :}] = neural_net(X_tr, y_tr, X_te, y_te, y_target);
end