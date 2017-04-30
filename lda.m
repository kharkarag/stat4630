function [lda_model, accuracy, y_hat] = lda(T_train, T_test)

[n, ~] = size(T_train);

% https://www.mathworks.com/help/stats/discriminant-analysis.html?s_tid=gn_loc_drop

X_train = T_train(:, 1:end-1);
y_train = T_train(:, end);
X_test = T_test(:, 1:end-1);
y_test = T_test(:, end);

lda_model = fitcdiscr(X_train,y_train);

y_hat = predict(lda_model, X_test);
accuracy = sum(y_hat == y_test)/n;
fprintf('Accuracy: %d', accuracy);

end