function [net, tr] = neural_net(X_tr, y_tr, eval, layers, X_te, y_te)

%net = patternnet([125 125 100 100 75 50 10]);
%net = patternnet([125 100 75 50 10]);
net = patternnet(layers);
disp(layers);

%net = patternnet([500]);

net.trainFcn = 'traingdm'; % Momentum
net.trainParam.max_fail = 15;
net.performFCN = 'crossentropy';
[net, tr] = train(net, X_tr.', y_tr.', 'useGPU', 'yes');
%[net, tr] = train(net, X_tr, y_tr);

if eval == 1

    y_hat = net(X_te.');
    [~, ind] = max(y_hat);
    evaluate(ind.',  y_te);
end

% How to run:
% [net, tr, nn_pred] = neural_net(<x_train>, <y_train>, 1, ideal_layers, <x_test>, <y_test>);

end