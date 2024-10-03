% Plotting the amplitude of X2 for mass m2 against angular frequency w
% between the ranges 125rad/s to 940rad/s with excitation force
% amplitude of 10N, with additional damping added
% Author: Stephen Xie / Code Wizard
clear;

m1 = 1;
m2 = 1;
k = 171080;
c = 3;
cw = 500;
F = 10;
X2vf = zeros(815,1);
w = zeros(815,1);

for freq = 125:1:940
    w(freq-124) = freq;
    delta = (k+1i*freq*c+1i*freq*cw-(freq^2)*m1)*(k+1i*freq*c+1i*freq*cw-(freq^2)*m2)-((-k-1i*freq*c+1i*freq*cw)^2);
    X2vf(freq-124) = abs((k+1i*freq*c-1i*freq*cw)/delta);
end

X2 = X2vf*F;

plot(w, X2vf)
title("Magnitude of X2 against frequency w (with additional damping)")
xlabel("w (rad/s, 125 to 940)")
ylabel("X2 (m)")