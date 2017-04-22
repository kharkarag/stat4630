function svm(X, y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SVM w/linear kernel
disp('Linear kernel:');
lin_models = cell(1, length(C));

lin_best_accuracy = 0; lin_best_index = 0;
for i = length(C)
    model = fitcsvm(X_train, y_train, 'KernelFunction', 'linear', 'BoxConstraint',C(i));
    lin_models{i} = model;
    % Validation
    prediction = predict(model, X_val);
    accuracy = sum(1-abs(y_val-prediction)/2)/cv_size;
    if accuracy > lin_best_accuracy
       lin_best_accuracy = accuracy;
       lin_best_index = i;
    end
end

fprintf('Best C: %f\n', C(lin_best_index));
fprintf('Val Accuracy of Best C: %f\n', lin_best_accuracy);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end