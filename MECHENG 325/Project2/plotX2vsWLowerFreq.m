% Plotting the amplitude of X2 for mass m2 against angular frequency w
% between the ranges 15rad/s to 190rad/s with excitation force
% amplitude of 10N
% Author: Stephen Xie / Code Wizard
clear;

m1 = 1;
m2 = 1;
k = 171080;
c = 3;
F = 10;
X2vf = zeros(175,1);
w = zeros(175,1);

for freq = 15:1:190
    w(freq-14) = freq;
    delta = (k+1i*freq*c-(freq^2)*m1)*(k+1i*freq*c-(freq^2)*m2)-((-k-1i*freq*c)^2);
    X2vf(freq-14) = abs((k+1i*freq*c)/delta);
end

X2 = X2vf*F;

plot(w, X2vf)
title("Magnitude of X2 against frequency w (amp of F = 10N)")
xlabel("w (rad/s, 15 to 190)")
ylabel("X2 (m)")