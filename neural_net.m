function [net, y_hat, performance] = neural_net(X_train, y_train, X_test, y_test)

net = patternnet(100);

net = train(net, X_train, y_train, 'useGPU', 'yes');

y_hat = net(X_test);

performance = perform(net, y_train, y_test);
fprintf('Accuracy: %2.2f%%\n', performance*100);


%[net, nn_pred, nn_perf] = neural_net([s_num_train s_categ_train].', y_train.', [s_num_test s_categ_test].', y_test.');

end