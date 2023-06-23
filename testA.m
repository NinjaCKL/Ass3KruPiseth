% Line Parameters
r = 0.016; % ohm/km
L = 0.97*10^-3; % H/km
C = 0.0115*10^-6; % F/km
len = 600; % km

% Load Parameters
S_rx = 800*10^6; % VA
pf_rx = 0.8; % lagging
V_rx = 200*10^3; % V (line-to-line)

% Calculation
w = 2*pi*50; % angular frequency
Z = r + 1i*w*L; % impedance per km
Y = 1i*w*C; % admittance per km
Z_total = Z*len; % total impedance
Y_total = Y*len; % total admittance
V_rx_ll = V_rx/sqrt(3); % receiving end line-to-line voltage
I_rx = S_rx/(V_rx_ll*pf_rx); % receiving end current
V_drop = I_rx*Z_total; % voltage drop
V_rx_ll_dr = V_rx_ll + V_drop; % receiving end line-to-line voltage with voltage drop
S_rx_app = V_rx_ll_dr*conj(I_rx); % receiving end apparent power
P_rx = real(S_rx_app); % receiving end real power
Q_rx = imag(S_rx_app); % receiving end reactive power
pf_rx_new = P_rx/abs(S_rx_app); % receiving end power factor

% Output
disp(['Receiving end line-to-line voltage with voltage drop: ',num2str(V_rx_ll_dr/10^3),' kV'])
disp(['Receiving end power factor: ',num2str(pf_rx_new)])
disp(['Receiving end real power: ',num2str(P_rx/10^6),' MW'])
disp(['Receiving end reactive power: ',num2str(Q_rx/10^6),' MVAr'])