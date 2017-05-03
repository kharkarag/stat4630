samples = 75000;

X_train = [normc(s_num_train) s_categ_train].';
%X_train = X_train(:, 1:samples);
y_d_train = dummyvar(y_train).';
%y_d_train = y_d_train(:, 1:samples);

X_val = [normc(s_num_val) s_categ_val].';
%X_train = X_train(:, 1:samples);
y_d_val = dummyvar(y_val).';
%y_d_train = y_d_train(:, 1:samples);

X_test = [normc(s_num_test) s_categ_test].';
%X_test = X_test(:, 1:samples);
y_d_test = dummyvar(y_test).';
%y_d_test = y_d_test(:, 1:samples);