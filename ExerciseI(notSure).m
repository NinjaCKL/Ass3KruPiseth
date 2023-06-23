% Transmission Line Parameters
f = 50; % Hz
z = 0.016 + 1i*2*pi*f*0.97e-3; % ohm/km
y = 1i*2*pi*f*0.0115e-6; % S/km
l = 600; % km

% ABCD Parameters
A = cosh(sqrt(z*y)*l);
B = sqrt(z/y)*sinh(sqrt(z*y)*l);
C = sqrt(y/z)*sinh(sqrt(z*y)*l);
D = A;

% Line Loadability Curve
V_s = 220e3; % V
P_max = abs(V_s)^2/abs(B);
P_r = linspace(0, P_max, 100);
Q_r = sqrt((abs(V_s)^2./abs(B)).^2 - P_r.^2);

% Plot Line Loadability Curve
figure;
plot(P_r/1e6, Q_r/1e6);
xlabel('P_r (MW)');
ylabel('Q_r (Mvar)');
title('Line Loadability Curve');
