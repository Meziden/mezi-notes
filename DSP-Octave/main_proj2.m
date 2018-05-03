function main()
    %% Parameters
    FREQ_SAMPLE  = 2048;
    TIME_SAMPLE  = 1;
    NUM_SAMPLE   = floor(FREQ_SAMPLE*TIME_SAMPLE)+1;
    LENGTH_DFT   = 2049;
    
    %% Signal Generating
    vec_t = linspace(0,TIME_SAMPLE,NUM_SAMPLE);
    vec_x = 10*sintable(2*pi*64*vec_t) + ...
            1*sintable(2*pi*250*vec_t) + ...
            20*sintable(2*pi*256*vec_t) + ...
            3*sintable(2*pi*260*vec_t) + ...
            10*sintable(2*pi*512*vec_t);    
    
    %% Windowing
    vec_x2 = vec_x .* hann(length(vec_t))';
    
    %% FFT Spectrum Analyze
    fft_x = fftshift(fft(vec_x,LENGTH_DFT)) ./ LENGTH_DFT;
    frange_x = linspace(-FREQ_SAMPLE/2,FREQ_SAMPLE/2,LENGTH_DFT);
    
    fft_x2 = fftshift(fft(vec_x2,LENGTH_DFT)) ./ LENGTH_DFT;
    frange_x2 = linspace(-FREQ_SAMPLE/2,FREQ_SAMPLE/2,LENGTH_DFT);
    
    stem(frange_x,abs(fft_x),"cr","LineWidth",2);
    hold on;
    %% 2*abs(...) is used to balance the energy loss in hann window.
    stem(frange_x2,2*abs(fft_x2),"cb","LineWidth",2);
    
    legend("Rectangle","Hamming");
end
