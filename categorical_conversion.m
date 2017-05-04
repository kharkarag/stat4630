function [num_array, categorical_array] = categorical_conversion(s)
    s.srch_ci = datetime(s.srch_ci,'InputFormat','yyyy-MM-dd');
    s.srch_co = datetime(s.srch_co,'InputFormat','yyyy-MM-dd');
    s.length_of_stay = datenum(s.srch_co) - datenum(s.srch_ci);
    s.check_in_month = str2num(datestr(s.srch_ci, 'MM'));
    
    s.date_time = [];
    s.user_location_region = [];
    s.user_location_city = [];
    s.user_id = [];
    s.srch_ci = [];
    s.srch_co = [];
    s.hotel_market = [];
    hc = s.hotel_cluster; 
    s.hotel_cluster = [];
    s.hotel_cluster = hc;
    num_array = table2array(s);
    
    s.check_in_month = categorical(s.check_in_month);
    s.site_name = categorical(s.site_name);
    s.posa_continent = categorical(s.posa_continent);
    s.user_location_country = categorical(s.user_location_country);   
    s.channel = categorical(s.channel);
    s.srch_destination_id = categorical(s.srch_destination_id);
    s.srch_destination_type_id = categorical(s.srch_destination_type_id);
    s.hotel_continent = categorical(s.hotel_continent);
    s.hotel_country = categorical(s.hotel_country);
    s.hotel_cluster = categorical(s.hotel_cluster);
    categorical_array = s;
end