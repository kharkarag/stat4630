function [lda_model, accuracy, y_hat, reg] = lda(X_train, y_train, X_test, y_test, discrim)

%[n, ~] = size(T_train);

% https://www.mathworks.com/help/stats/discriminant-analysis.html?s_tid=gn_loc_drop

%X_train = T_train(:, 1:end-1);
%y_train = T_train(:, end);
%X_test = T_test(:, 1:end-1);
%y_test = T_test(:, end);

lda_model = fitcdiscr(X_train,y_train, 'DiscrimType', discrim, 'SaveMemory','on','FillCoeffs','off');

y_hat = predict(lda_model, X_test);

accuracy = evaluate(y_hat, y_test);

% Improvements


% Regularization

%[err,gamma,delta,numpred] = cvshrink(lda_model,'NumGamma',24,'NumDelta',24,'Verbose',1);
%reg = [err,gamma,delta,numpred];
reg = 3;

end