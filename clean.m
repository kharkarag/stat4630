% Selecting vars of certain type

categVars = varfun(@iscategorical,s,'output','uniform');
numVars = varfun(@isnumeric,s,'output','uniform');
s_num = s(:, numVars);
s_categ = s(:, categVars);

s_num.orig_destination_distance = [];

s_num = table2array(s_num);

% Dummy variable generation
s_categ.user_location_region = [];
s_categ.user_location_city = [];
s_categ.hotel_market = [];
s_categ.hotel_cluster = [];
    
[n, c] = size(s_categ);
categ_dummy = [];

for i = 1:c
    disp(s_categ.Properties.VariableNames(i));
    categ_dummy = [categ_dummy dummyvar(s_categ.(i))];
end


numvals = zeros(2, c);
removal = [];

for i = 1:c
    numvals(1, i) = sum(categ_dummy(:, i) == 0);
    numvals(2, i) = sum(categ_dummy(:, i) == 1);
    if numvals(1, i) < 100 || numvals(2, i) < 100
       removal = [removal i];
    end
end

categ_dummy_clean = categ_dummy;
categ_dummy_clean(:, removal) = [];
