function [accuracy] = evaluate(y_hat, y_test)

accuracy = sum(y_hat == y_test)/n;
format long g;
fprintf('Accuracy: %2.2f%%\n', accuracy*100);

end