function Y = tufts_outputs(states, U, t)
% Computes the measured distance and velocity from the state space vectors
% C_(4x2), D_(2x2), states_(4x1) and input_(2x1)
% U = [height, velocity]

h = U(1);
%% Compute delay variables [C, D]
% [C, D] = getC_D(h)
% dOrder = 2;                   % Vajta Delay order 
c = 343;                        % speed of sound [m/s]
t = 2 * h/ c;                   % time delay [dominated by time of travel]

[n,m] = vajtadelay(t,2);
[~,~,c,d] = tf2ss(n,m);
zc = [0,0];
zd = [0];
 
C = [c,zc;zc,c];
D = [d,zd;zd,d];

%% Compute the measured distance and velocity
% size(C)
% size(states)
% size(D)
% size(U)
Y = C * states + D * U;

%% Check for Range
h_max = 1.5;                    % maximum distance [m] 
% if distance is greater than h_max, Y = [0; 0]
if h > h_max
    Y = zeros(2,1);
end


%% Add sensor error
v_std = 0.06;                   % velocity standard deviation [m/s] 
h_std = 0.001;                  % distance standard deviation [m]

% Add height error
h_error = h_std * randn(1);
% track excessive error
% if .3 > h_error
%     global N_error
%     N_error = [N_error 1];
% end

Y(1) = Y(1) + h_error;
% Add velocity error
Y(2) = Y(2) + v_std * randn(1);

end

