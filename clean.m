% Selecting vars of certain type
categVars = varfun(@iscategorical,s,'output','uniform');
numVars = ~categVars;
s_num = s(:, numVars);




% Dummy variable generation

D = dummyvar(group)

