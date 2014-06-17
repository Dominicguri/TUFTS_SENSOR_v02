function u = wpi_hv(t)
%% sinusoidal varying v
T = 5;             % Period = 0.5 [s]
A = .4;           % Amplitude = 0.5 [m]
f = 1/T;			% frequency [Hz]
w = 2*pi*f;			% angular frequency 
Offset = 1;			% Height offset [m]

h = Offset + A * sin(w*t);      
v = w * A * cos(w*t);
u = [h; v];
end

