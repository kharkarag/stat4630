numvals = zeros(2, 608);
removal = [];

for i = 1:608
    numvals(1, i) = sum(categ_dummy(:, i) == 0);
    numvals(2, i) = sum(categ_dummy(:, i) == 1);
    if numvals(1, i) < 100 || numvals(2, i) < 100
       removal = [removal i];
    end
end

categ_dummy_clean = categ_dummy;
categ_dummy_clean(:, removal) = [];