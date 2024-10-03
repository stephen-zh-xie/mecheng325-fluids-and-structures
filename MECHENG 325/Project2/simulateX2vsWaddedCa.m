% Simulating the behaviour of the double-leaf wall system, then plotting
% the maximum magnitude of m2 (x2) against frequency
% Author: Stephen Xie / Code Wizard
clear;

m1 = 1;
m2 = 1;
ma = 0.1;
k = 171080;
c = 3;
cw = 500;
ka = 34222.5;
caList = [0 2.34 5.85 11.7 23.4 58.5];
w = 125:5:940;
F = 10;

X2list = zeros(164, 6);

for simNum = 1:length(caList)
    ca = caList(simNum);
    data = sim("DoubleLeafWall.slx", 60);
    [rowSize, colSize] = size(data.x2);
    for col = 1:colSize
        freqData = data.x2(:,col);
        X2list(col, simNum) = max(freqData(find(data.tout > 50)));
    end
end

plot(w, X2list(:,1), "r-", w, X2list(:,2), "g-", w, X2list(:,3), "b-", w, X2list(:,4), "r-.", w, X2list(:,5), "g-.", w, X2list(:,6), "b-.")

title("Magnitude of X2 against frequency w (with vibration absorber)")
xlabel("w (rad/s, 125 to 940)")
ylabel("X2 (m)")
legend("ca = 0", "ca = 2.34", "ca = 5.85", "ca = 11.7", "ca = 23.4", "ca = 58.5")