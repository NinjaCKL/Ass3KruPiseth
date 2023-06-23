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

% Line Voltage Profile
V_s = 220e3; % V

% No Load
I_r = 0;
V_r = A*V_s + B*I_r;
fprintf('No Load: Receiving end voltage = %.2f kV\n', abs(V_r)/1e3);

% Rated Load
P_r = 300e6; % W
pf_r = 0.8;
I_r = conj(P_r/(3*V_s*pf_r));
V_r = A*V_s + B*I_r;
fprintf('Rated Load: Receiving end voltage = %.2f kV\n', abs(V_r)/1e3);

% Line Terminated in SIL
P_r = abs(V_s)^2/abs(B);
I_r = conj(P_r/(3*V_s));
V_r = A*V_s + B*I_r;
fprintf('Line Terminated in SIL: Receiving end voltage = %.2f kV\n', abs(V_r)/1e3);

% Short Circuited Line
I_r = inf;
V_r = A*V_s + B*I_r;
fprintf('Short Circuited Line: Receiving end voltage = %.2f kV\n', abs(V_r)/1e3);
