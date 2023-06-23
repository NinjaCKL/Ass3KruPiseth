% Transmission line parameters
f = 50; % Hz
l = 600; % km
r = 0.016; % ohm/km
L = 0.97e-3; % H/km
C = 0.0115e-6; % F/km

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

% Calculating sending end and receiving end currents for short circuit
Vr = 0;
Ir = Vr / ZL;
Vs = A * Vr + B * Ir;
Is = C * Vr + D * Ir;

% Displaying results
fprintf('Sending end current: %.2f A\n', abs(Is));
fprintf('Receiving end current: %.2f A\n', abs(Ir));
