s_original = readtable('Strain.csv');

d = readtable('destinations.csv');

s = s_original;
s.site_name = categorical(s.site_name);
s.posa_continent = categorical(s.posa_continent);
s.user_location_country = categorical(s.user_location_country);
s.is_mobile = categorical(s.is_mobile);
s.is_package = categorical(s.is_package);
s.channel = categorical(s.channel);
s.srch_destination_id = categorical(s.srch_destination_id);
s.srch_destination_type_id = categorical(s.srch_destination_type_id);
s.is_booking = categorical(s.is_booking);
s.hotel_continent = categorical(s.hotel_continent);
s.hotel_country = categorical(s.hotel_country);

s.srch_ci = datetime(s.srch_ci,'InputFormat','yyyy-MM-dd');
s.srch_co = datetime(s.srch_co,'InputFormat','yyyy-MM-dd');
s.length_of_stay = datenum(s.srch_co) - datenum(s.srch_ci);

s.user_id = [];
s.srch_ci = [];
s.srch_co = [];
s.date_time = [];
s.user_location_region = [];
s.user_location_city = [];
s.hotel_market = [];

hc = categorical(s.hotel_cluster);
s.hotel_cluster = [];
s.hotel_cluster = hc;
clear hc;


for i = 1:size(s,2)
    if iscategorical(table2array(s(:,i)))
        disp(s.Properties.VariableNames{i});
        disp(size(categories(table2array(s(:,i))),1));
    end
end



