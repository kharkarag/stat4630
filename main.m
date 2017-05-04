% STAT 4630
% Anant Kharkar & Haotian Li

% Setup and data importing
% Note that this will take a solid few minutes
test;
clean;
cross;

% --- Discriminant Analysis ---

% LDA
[lda_model, lda_hat, lda_acc] = lda(x_lda, y_lda, x_test, y_test, 'pseudolinear');

% QDA
[qda_model, qda_hat, qda_acc] = lda(x_lda, y_lda, x_test, y_test, 'pseudoquadratic');

% --- Decision Trees ---

%For a full demo:
cv_test;

% Random Tree

% Performs pruning
tree_model = dec_tree(x_tree, y_tree, category_var_index, 1, 0);
tree_pred = double(predict(tree_model, x_tree_test));
tree_evaluate(tree_pred, double(table2array(y_tree_test)));

% Random Forest
forest_model = rand_forest(x_tree, y_tree, category_var_index, 1);
forest_pred = str2double(predict(forest_model, x_tree_test));
tree_evaluate(forest_pred, double(table2array(y_tree_test)));

% --- Neural Network ---

% Hidden layer structure
% WARNING: USE GPU
% Please run at your own risk - may take hours to run on a CPU depending on
% hidden layer setup - commented out intentionally because we used it for
% experimentation - running this won't really give you anything useful as
% far as a demo

% neural_val;

% Take our word for it - this was the best hidden-layer structure we could
% find
ideal_layers = [125 100 75 50 10];

% Run ANN

% Note: requires the Neural Network Toolbox - available as a trial if
% needed
neural_net(x_neural_struct_train, y_neural_struct_train, 1, ideal_layers, x_test, y_test);

% Boosting
% Again, this may take some time (but is reasonable to run on a CPU - might
% take a solid few minutes
neural_boosting;

% --- Ensemble ---
% Note that the ensemble uses the neural network committee + LDA + Random
% Forest
ensemble;




