function [lda_model, y_hat, accuracy] = lda(X_train, y_train, X_test, y_test, discrim)

lda_model = fitcdiscr(X_train, y_train, 'DiscrimType', discrim, 'SaveMemory','on','FillCoeffs','off');

y_hat = predict(lda_model, X_test);

accuracy = evaluate(y_hat, y_test);

end