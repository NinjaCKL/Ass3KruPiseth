% Transmission line parameters
f = 50; % Hz
l = 600; % km
r = 0.016; % ohm/km
L = 0.97e-3; % H/km
C = 0.0115e-6; % F/km
Vr = 500e3; % V
ZL = 2902; % ohm

% Calculating ABCD parameters
w = 2 * pi * f;
Z = r + 1j * w * L;
Y = 1j * w * C;
gamma = sqrt(Z * Y);
Zc = sqrt(Z / Y);
A = cosh(gamma * l);
D = cosh(gamma * l);
B = Zc * sinh(gamma * l);
C = (1 / Zc) * sinh(gamma * l);

% Calculating sending end voltage and current
Ir = Vr / ZL;
Vs = A * Vr + B * Ir;
Is = C * Vr + D * Ir;

% Calculating performance parameters
regulation = (abs(Vs) - abs(Vr)) / abs(Vr) * 100;
Pr = sqrt(3) * abs(Vr) * abs(Ir) * cos(angle(Vr) - angle(Ir));
Ps = sqrt(3) * abs(Vs) * abs(Is) * cos(angle(Vs) - angle(Is));
efficiency = Pr / Ps * 100;

% Displaying results
fprintf('Sending end voltage: %.2f kV\n', abs(Vs) / 1000);
fprintf('Sending end current: %.2f A\n', abs(Is));
fprintf('Voltage regulation: %.2f %%\n', regulation);
fprintf('Efficiency: %.2f %%\n', efficiency);
