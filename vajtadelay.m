function [NUM, DEN] = vajtadelay(T, N)
% Return the numerator and denominator of the N-th order polynomial
% approximation of the vajta [delay] continous-time approximation 
% Reference: SOME REMARKS ON PADÉ-APPROXIMATIONS <M.Vajta>

order = N;
switch order
    case 1
        num = 1;
        den = [T 1];
    case 2
        num = [-2*T 6];
        den = [T^2 4*T 6];
    case 3
        num = [3*T^2 -24*T 60];
        den = [T^3 9*T^2 36*T 60];
    case 4
        num = [-T^3 60*T^2 -360*T 840];
        den = [T^4 16*T^3 120*T^2 480*T 840];
    case 5
        num = [T^4 -120*T^3 1260*T^2 -6720*T 15120];
        den = [T^5 25*T^4 300*T^3 2100*T^2 8400*T 15120];
end

NUM = num;
DEN = den;
end