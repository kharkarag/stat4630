samples = 5000;
X_tr = X_train(:, 1:samples);
y_tr = y_d_train(:, 1:samples);

X_v = X_val(:, 1:samples);
y_v = y_d_val(:, 1:samples);

y_target = y_val(1:samples, :);

results = cell([5, 4]);

for i = 4:4
    [results{i, :}] = neural_net(X_tr, y_tr, X_v, y_v, y_target, [500 400 400 i*100]);
end