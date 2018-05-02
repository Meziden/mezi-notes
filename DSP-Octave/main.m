function main()
    %% 4000Hz for highest frequency components
    SOURCE_FREQ = 4000;
    SOURCE_TIME = 0.4;
    
    phonenum    = input("START RECEIVING NUMBERS.\r\n");
    size_num = floor(log10(phonenum));
    
    vec_freq1   = zeros(1,size_num);
    vec_freq2   = zeros(1,size_num);
    
    for i = 1:1:size_num + 1;
        tmp_number = floor(phonenum / (10 ^ (size_num + 1 - i)));
        phonenum = phonenum - tmp_number * (10 ^ (size_num + 1 - i));
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
                vec_freq1(i) = 1336; vec_freq2(i) = 770;
        end
    end
    
    %% time sequence generating
    vec_t = linspace(0,SOURCE_TIME,SOURCE_TIME*SOURCE_FREQ);
    
    %% signal generating using table and linear interpolation
    %% using table containing 256 float numbers
    %% precision is 10^-5
    for i = 1:1:size_num+1
        vec_x = 0.5*costable(2*pi*vec_freq1(i)*vec_t) + 0.5*costable(2*pi*vec_freq2(i)*vec_t);
        %% play the sound
        sound(vec_x,SOURCE_FREQ);
    end
    
    fft_x       = fftshift(fft(vec_x)) ./ (SOURCE_TIME*SOURCE_FREQ);
    frange_x    = linspace(-SOURCE_FREQ/2,SOURCE_FREQ/2,SOURCE_TIME*SOURCE_FREQ);
    
    %% result plotting
    plot(frange_x,abs(fft_x),'cr',"LineWidth",2);
    grid on;
    hold on;
    title("Spectrum");
    xlabel("Frequency / Hz");
    ylabel("Amplitude");
end
