% Dominic Guri
% 06/11/2014
% Overall Test Simulation 


% close all; clear all; clc
tstart = 0;
tstop = 100;
tstep=0.01;
tspan = [tstart tstop];

ic = [0; 0; 0; 0; 0; 0];                      % Initial Conditions
%state 1 = WPI state 1
%state 2 = WPI state 2
%state 3 = Tufts state 1
%state 4 = Tufts state 2
%state 5 = Tufts state 3
%state 6 = Tufts state 4

%% Test: Overall simulation using tufts functions
% options= odeset('MaxStep',1);
% options= odeset('Reltol',0.001,'Stats','on');
[tsim, xsim] = ode45(@mastersim, tstart:tstep:tstop, ic, []);

% global Vout Tout

Y = [];
for i=1:length(tsim)
Y = [Y tufts_outputs(transpose(xsim(i,3:6)), ...
    wpi_outputs(transpose(xsim(i,1:2)),tsim(i)),tsim(i))];
end

figure
plot(tsim, Y(1,:), tsim, Y(2,:))


% figure
% n = find(Tout == 0, 1, 'last' ) + 1;
% plot(Tout(n:end), Vout(1,n:end), Tout(n:end), Vout(2,n:end))
%-------------------------------------------------------------------------
% n = find(tsim == 0, 1, 'last' ) + 1;
% 
% tsim = tsim(n:end);
% xsim = xsim(n:end,:);
% 
% 
% u = wpi_hv(tsim);
% % size(u)
% u = reshape(u,2,length(u)/2);
% 
% xsim = transpose(xsim);
% 
% Yout = zeros(2,length(tsim));
% 
% for i = 1:length(tsim)
%     Yout(:,i) = tuftsCMUToutput(xsim(:,i), u(:,i));
% end
% %Compute outputs from states
% % fprintf('done...')
% % size(Yout)
% % size(tsim)
% 
% figure
% plot(tsim,Yout(1,:), tsim, Yout(2,:))
% legend('Height(m)','Velocity (m/s)')
% xlabel('Time (s)')