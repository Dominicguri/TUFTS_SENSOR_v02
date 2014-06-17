function state_der = tufts_state_derivs(states, U, t)

% for 2-inputs 2-outputs system: The system is created from 4 transfer
% functions. if Y = [Y1; Y2], and U = [U1; U2] then the transfer function
% for the system transfer function 
% G(s) = [tf(Y1/U1) tf(Y1/U2); tf(Y2/U1) tf(Y2/U2)]

% Y1 = h'   Y2 = v'   U1 = h   U2 = v

%[A, B, C, D] = ssDelay(h, dOrder);
h = U(1);

%% Compute delay variables [A, B]
% [A, B] = getA_B(h)
% dOrder = 2;               % Vajta Delay order 
c = 343;                    % speed of sound [m/s]
t = 2 * h/ c;               % time delay [dominated by time of travel]

[n,m] = vajtadelay(t,2);
[a,b,~,~] = tf2ss(n,m);
za = [0,0;0,0];
zb = [0;0];
 
A = [a,za;za,a];
B = [b,zb;zb,b];

%% State Derivatives
state_der = A * states + B * U;
end

