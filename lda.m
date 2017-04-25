function lda(T)

% https://www.mathworks.com/help/stats/discriminant-analysis.html?s_tid=gn_loc_drop

X = T(:, 1:end-1);
y = T(:, end);

lda_model = fitcdiscr(X,y);

end