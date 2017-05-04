

for i = 1:8
   aggregate = zeros(5, 5000);
   net = committee{i, 1};
   yhat = net(x_test.');
   [m, class] = max(yhat);
   aggregate = aggregate + dummyvar(class).';
   [~, nn_pred] = max(aggregate);
end

lda_pred = predict(lda_model, x_test);

tree_pred = 

ensemble_aggregate = zeros(5, 10000);
ensemble_aggregate = ensemble_aggregate + dummyvar(nn_pred).';
ensemble_aggregate = ensemble_aggregate + dummyvar(lda_pred).';
ensemble_aggregate = ensemble_aggregate + dummyvar(tree_pred).';
[~, ensemble_pred] = max(ensemble_aggregate);

disp('Ensemble prediction accuracy');
evaluate(ensemble_pred.', y_test);