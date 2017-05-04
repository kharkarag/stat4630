% Selecting vars of certain type

categVars = varfun(@iscategorical,s,'output','uniform');
numVars = varfun(@isnumeric,s,'output','uniform');
s_num = s(:, numVars);
s_categ = s(:, categVars);

s_num = table2array(s_num);

% Dummy variable generation
s_categ.srch_destination_id = [];
s_categ.user_location_region = [];
s_categ.user_location_city = [];
s_categ.hotel_market = [];
s_categ.hotel_cluster = [];
    
[n, c] = size(s_categ);
s_dummy = [];


% Create dummy variables for all categorical variables
for i = 1:c
    disp(s_categ.Properties.VariableNames(i));
    s_dummy = [s_dummy dummyvar(s_categ.(i))];
end

[~, c] = size(s_dummy);

numvals = zeros(2, c);
removal = [];

% Some dummy variables have too few instances of a value (0 or 1). Remove
% those variables.
for i = 1:c
    numvals(1, i) = sum(s_dummy(:, i) == 0);
    numvals(2, i) = sum(s_dummy(:, i) == 1);
    if numvals(1, i) < 100 || numvals(2, i) < 100
       removal = [removal i];
    end
end

s_dummy(:, removal) = [];

clear removal

