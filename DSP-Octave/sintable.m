%% sine function with 256-element table and linear interpolation
%% max error < 0.0001

function vec_sin = sintable(vec_input)
    TABLE_SIZE = 256;
    %% generate a table containing 256 elements
    vec_time256 = linspace(0,2*pi*(TABLE_SIZE-1/TABLE_SIZE),TABLE_SIZE);
    vec_sintable = sin(vec_time256);
    
    %% getting position and interpolation
    vec_input           = mod(vec_input,2*pi) / (2*pi/TABLE_SIZE);
    vec_input_int       = floor(vec_input) .+ 1;
    vec_input_exceed    = vec_input - vec_input_int;
    
    %% initialize an array
    vec_sin = zeros(1,length(vec_input_int));
    
    for i = 1:1:length(vec_input_int);
        pos_table   = vec_input_int(i);
        tmp_exceed  = vec_input_exceed(i) * ((vec_sintable(mod(pos_table+1,TABLE_SIZE)+1)) - vec_sintable(pos_table));
        vec_sin(i)  = vec_sintable(pos_table);
    end
end
