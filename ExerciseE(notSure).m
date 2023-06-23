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

% Calculating receiving end voltage and current for uncompensated line
Is = 0;
Vr_uncompensated = (Vs - B * Is) / A;
Ir_uncompensated = (Is - C * Vs) / D;

% Calculating shunt reactor parameters
Xc = abs(Vr_uncompensated)^2 / abs(Vr_uncompensated - Vs);
Qc = sqrt(3) * abs(Vr_uncompensated)^2 / Xc;

% Calculating receiving end voltage and current for compensated line
ZL_compensated = -1j * Xc;
Ir_compensated = Vr_uncompensated / ZL_compensated;
Vs_compensated = A * Vr_uncompensated + B * Ir_compensated;
Is_compensated = C * Vr_uncompensated + D * Ir_compensated;

% Plotting voltage profile
x = [0 l];
y1 = [abs(Vs) abs(Vr_uncompensated)] / 1000;
y2 = [abs(Vs_compensated) abs(Vr_uncompensated)] / 1000;
plot(x, y1, 'b', x, y2, 'r');
xlabel('Distance (km)');
ylabel('Voltage (kV)');
legend('Uncompensated', 'Compensated');
