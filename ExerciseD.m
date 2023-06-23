% Transmission line parameters
f = 50; % Hz
l = 600; % km
r = 0.016; % ohm/km
L = 0.97e-3; % H/km
C = 0.0115e-6; % F/km
Vs = 500e3; % V

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

% Calculating receiving end voltage and current
Is = 0;
Vr = (Vs - B * Is) / A;
Ir = (Is - C * Vs) / D;

% Calculating shunt reactor parameters
Xc = abs(Vr)^2 / abs(Vr - Vs);
Qc = sqrt(3) * abs(Vr)^2 / Xc;

% Displaying results
fprintf('Receiving end voltage: %.2f kV\n', abs(Vr) / 1000);
fprintf('Receiving end current: %.2f A\n', abs(Ir));
fprintf('Shunt reactor reactance: %.2f ohm\n', Xc);
fprintf('Shunt reactor MVAR: %.2f MVAr\n', Qc / 1e6);
