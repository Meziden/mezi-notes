function main()
    %% 4000Hz for highest frequency components
    SOURCE_FREQ = 4000;
    SOURCE_TIME = 2;
    
    BUTTON_FREQ1 = 558;
    BUTTON_FREQ2 = 550;
    
    %% time sequence generating
    vec_t = linspace(0,SOURCE_TIME,SOURCE_TIME*SOURCE_FREQ);
    
    %% signal generating using table and linear interpolation
    %% using table containing 256 float numbers
    %% precision is 10^-5
    vec_x = 0.5*costable(2*pi*BUTTON_FREQ1*vec_t) + 0.5*costable(2*pi*BUTTON_FREQ2*vec_t);
    
    %% play the sound
    sound(vec_x,SOURCE_FREQ);
    
    fft_x = fftshift(fft(vec_x)) ./ (SOURCE_TIME*SOURCE_FREQ);
    frange_x = linspace(-SOURCE_FREQ/2,SOURCE_FREQ/2,SOURCE_TIME*SOURCE_FREQ);
    
    %% result plotting
    plot(frange_x,abs(fft_x),'cr',"LineWidth",2);
    grid on;
    hold on;
    title("Spectrum");
    xlabel("Frequency / Hz");
    ylabel("Amplitude");
end
