
X_train = [normc(s_num_train) s_categ_train].';
y_d_train = dummyvar(y_train).';

X_val = [normc(s_num_val) s_categ_val].';
y_d_val = dummyvar(y_val).';

X_test = [normc(s_num_test) s_categ_test].';
y_d_test = dummyvar(y_test).';

%samples = 75000;
%X_train = X_train(:, 1:samples);
%y_d_train = y_d_train(:, 1:samples);
%X_train = X_train(:, 1:samples);
%y_d_train = y_d_train(:, 1:samples);
%X_test = X_test(:, 1:samples);
%y_d_test = y_d_test(:, 1:samples);

