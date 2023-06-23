% Transmission line parameters
f = 50; % Hz
l = 600; % km
r = 0.016; % ohm/km
L = 0.97e-3; % H/km
C = 0.0115e-6; % F/km
Vs = 210e3; % V
Ps = 600e6; % W
Qs = 400e6; % VAr

% Calculating ABCD parameters
w = 2 * pi * f;
Z = r + 1j * w * L;
Y = 1j * w * C;
gamma = sqrt(Z * Y);
Zc = sqrt(Z / Y);
A = cosh(gamma * l);
D = cosh(gamma * 1);
B = Zc * sinh(gamma * l);
C = (1 / Zc) * sinh(gamma * l);

% Calculating receiving end voltage and current
Is = (Ps + 1j * Qs) / (sqrt(3) * Vs);
Vr = (Vs - B * Is) / A;
Ir = (Is - C * Vs) / D;

% Calculating performance parameters
regulation = (abs(Vs) - abs(Vr)) / abs(Vr) * 100;
Pr = sqrt(3) * abs(Vr) * abs(Ir) * cos(angle(Vr) - angle(Ir));
efficiency = Pr / Ps * 100;

% Displaying results
fprintf('Receiving end voltage: %.2f kV\n', abs(Vr) / 1000);
fprintf('Receiving end current: %.2f A\n', abs(Ir));
fprintf('Voltage regulation: %.2f %%\n', regulation);
fprintf('Efficiency: %.2f %%\n', efficiency);
