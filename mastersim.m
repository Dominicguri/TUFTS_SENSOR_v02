function state_der = mastersim(t, states)
% Place-holder function for the overall simulation to be called by ODE$%
% generates a simulated input using wpi_hv(), computes tuftsCMUT states
% derivatives using tuftsCMUTstates(), and tuftsCMUT output using
% tuftsCMUToutput()

n=2; %Number of WPI states

%%
wpi_x=states(1:n); %Extract wpi states from state vector
tufts_x=states(n+1:length(states)); %Extract tufts states from state vector

%% Compute WPI outputs
wpi_y = wpi_outputs(wpi_x,t);
%wpi_y(1) = distance to ground (m)
%wpi_y(2) = vertical velocity (m/s)
%wpi_u(1) = nothing yet

%% Compute Tufts outputs
tufts_u = [wpi_y(1); wpi_y(2)];
%tufts_u(1) = distance to ground (m)
%tufts_u(2) = vertical velocity (m/s)

tufts_y = tufts_outputs(tufts_x,tufts_u,t);
%tufts_y(1) = estimated distance to ground (m)
%tufts_y(2) = estimated vertical velocity (m/s)

%%WPI control law
wpi_u=wpi_control_law(tufts_y,wpi_x,t);

%% Compute State Derivatives
wpi_state_der = wpi_state_derivs(wpi_x,wpi_u,t);
tufts_state_der = tufts_state_derivs(tufts_x, tufts_u,t);

state_der=[wpi_state_der;tufts_state_der];

% global Vout Tout
% [Vout] = [Vout tuftsCMUToutput(states, u)]; 
% Tout = [Tout t];

end