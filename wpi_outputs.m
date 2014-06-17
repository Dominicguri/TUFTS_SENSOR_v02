function wpi_y = wpi_outputs(wpi_x,t)
%wpi_y(1) = distance to ground (m)
%wpi_y(2) = vertical velocity (m/s)

%% sinusoidal varying v
T = 5;             % Period = 0.5 [s]
A = .4;           % Amplitude = 0.5 [m]
f = 1/T;			% frequency [Hz]
w = 2*pi*f;			% angular frequency 
Offset = 1;			% Height offset [m]

h = Offset + A * sin(w*t);      
v = w * A * cos(w*t);
wpi_y = [h; v];
end

