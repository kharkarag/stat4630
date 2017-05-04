samples = 5000;
X_tr = x_neural_struct_train(:, 1:samples);
y_tr = y_neural_struct_train(:, 1:samples);

X_v = x_neural_struct_holdout(:, 1:samples);
y_v = y_neural_struct_holdout(1:samples, :);


results = cell([5, 3]);
for i = 1:5
    [results{i, :}] = neural_net(X_tr, y_tr, 1, [i*25], X_v, y_target);
end