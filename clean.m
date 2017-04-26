% Selecting vars of certain type
categVars = varfun(@iscategorical,s,'output','uniform');
numVars = ~categVars;
s_num = s(:, numVars);
s_categ = s(:, categVars);

[n, c] = size(s_categ);

% Dummy variable generation
s_categ.user_location_region = [];
s_categ.user_location_city = [];
s_categ.hotel_market = [];
categ_dummy = [];

for i = 1:c
    disp(s_categ.Properties.VariableNames(i));
    categ_dummy = [categ_dummy dummyvar(s_categ.(i))];
end


