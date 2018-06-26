function main()
    %% 4000Hz for highest frequency components
    SOURCE_FREQ = 4000;
    SOURCE_TIME = 0.4;
    
    str_phone   = input("START RECEIVING NUMBERS.\r\n");
    size_num = length(str_phone);
    
    vec_freq1   = zeros(1,size_num);
    vec_freq2   = zeros(1,size_num);
    
    for i = 1:1:size_num;
        tmp_number = str2num(str_phone(i));
        switch tmp_number
            case 1
                vec_freq1(i) = 1209; vec_freq2(i) = 697;
            case 2
                vec_freq1(i) = 1336; vec_freq2(i) = 697;
            case 3
                vec_freq1(i) = 1477; vec_freq2(i) = 697;
            case 4
                vec_freq1(i) = 1209; vec_freq2(i) = 770;
            case 5
                vec_freq1(i) = 1336; vec_freq2(i) = 770;
            case 6
                vec_freq1(i) = 1477; vec_freq2(i) = 770;
            case 7
                vec_freq1(i) = 1209; vec_freq2(i) = 852;
            case 8
                vec_freq1(i) = 1336; vec_freq2(i) = 852;
            case 9
                vec_freq1(i) = 1477; vec_freq2(i) = 852;
            case 0
                vec_freq1(i) = 1336; vec_freq2(i) = 941;
        end
    end
    
    printf("PRINTING RECEIVED SIGNAL:\n");
    
    %% time sequence generating
    vec_t = linspace(0,SOURCE_TIME,floor(SOURCE_TIME*SOURCE_FREQ));
    
    %% signal generating using table and linear interpolation
    %% using table containing 256 float numbers
    %% precision is 10^-5
    for i = 1:1:size_num
        vec_x = 0.5*costable(2*pi*vec_freq1(i)*vec_t) + 0.5*costable(2*pi*vec_freq2(i)*vec_t);
        
        %% play the sound
        sound(vec_x,SOURCE_FREQ);
        
        fft_x = abs(fft(vec_x)) ./ floor(SOURCE_TIME*SOURCE_FREQ);
        
        amp_697  = fft_x(floor(697 * SOURCE_TIME + 1));
        amp_770  = fft_x(floor(770 * SOURCE_TIME + 1));
        amp_852  = fft_x(floor(852 * SOURCE_TIME + 1));
        amp_941  = fft_x(floor(941 * SOURCE_TIME + 1));
        
        amp_1209 = fft_x(floor(1209 * SOURCE_TIME + 1));
        amp_1336 = fft_x(floor(1336 * SOURCE_TIME + 1));
        amp_1477 = fft_x(floor(1477 * SOURCE_TIME + 1));
        
        ampmax_l = max([amp_697,amp_770,amp_852,amp_941]);
        ampmax_h = max([amp_1209,amp_1336,amp_1477]);
        
        if(ampmax_l == amp_697)
            if(ampmax_h == amp_1209)
                result_num = 1;
            elseif(ampmax_h == amp_1336)
                result_num = 2;
            else
                result_num = 3;
            end
        end
        
        if(ampmax_l == amp_770)
            if(ampmax_h == amp_1209)
                result_num = 4;
            elseif(ampmax_h == amp_1336)
                result_num = 5;
            else
                result_num = 6;
            end
        end
        
        if(ampmax_l == amp_852)
            if(ampmax_h == amp_1209)
                result_num = 7;
            elseif(ampmax_h == amp_1336)
                result_num = 8;
            else
                result_num = 9;
            end
        end
        
        if(ampmax_l == amp_941)
            result_num = 0;
        end
        
        printf("%d ",result_num);
    end
    printf("\r\n");
end
