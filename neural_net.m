function [net, y_hat, tr, performance] = neural_net(X_tr, y_tr, X_te, y_te, y_eval, layers)

%net = patternnet([500, 500, 400, 400, 400, 300, 300, 300, 200, 200]);
%net = patternnet([500, 400, 300, 200]);
net = patternnet([500, 400, 300, 200, 100, 50, 10]);
%net = patternnet(layers);
disp(layers);

%net = patternnet([500]);

net.trainFcn = 'traingdm'; % Momentum
net.trainParam.max_fail = 10;
net.performFCN = 'crossentropy';
[net, tr] = train(net, X_tr, y_tr);

y_hat = net(X_te);

performance = perform(net, y_tr, y_te);
fprintf('Performance: %2.2f%%\n', performance*100);

[~, ind] = max(y_hat);
evaluate(ind.',  y_eval);


%[net, nn_pred, nn_perf] = neural_net([s_num_train s_categ_train].', y_train.', [s_num_test s_categ_test].', y_test.');

end