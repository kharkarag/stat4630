s_original = readtable('Strain.csv');

d = readtable('destinations.csv');

s = s_original;
s.site_name = categorical(s.site_name);
s.posa_continent = categorical(s.posa_continent);
s.user_location_country = categorical(s.user_location_country);
s.user_location_region = categorical(s.user_location_region);
s.user_location_city = categorical(s.user_location_city);
s.user_id = [];
s.is_mobile = categorical(s.is_mobile);
s.is_package = categorical(s.is_package);
s.channel = categorical(s.channel);
s.srch_destination_id = [];
s.srch_destination_type_id = categorical(s.srch_destination_type_id);
s.is_booking = categorical(s.is_booking);
s.hotel_continent = categorical(s.hotel_continent);
s.hotel_country = categorical(s.hotel_country);
s.hotel_market = categorical(s.hotel_market);
s.hotel_cluster = categorical(s.hotel_cluster);

for i = 1:size(s,2)
    if iscategorical(table2array(s(:,i)))
        disp(s.Properties.VariableNames{i});
        disp(size(categories(table2array(s(:,i))),1));
    end
end



