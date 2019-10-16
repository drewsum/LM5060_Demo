clc;
clear;

% over voltage protection threshold, Volts
OVPTH = 2.0;

% under voltage lockout threshold, Volts
UVLOTH = 1.6;

% bias current entering UVLO pin in amps
UVLObias = 5.5e-6;

% max input voltage in volts
VINmax = 14.0;

% min input voltage in volts
VINmin = 10.0;

% assume top resistor in window divier is this value in ohms
R1 = 44200.0;


A = (UVLOTH * R1) / (VINmin - UVLOTH - UVLObias * R1) + R1;
B = VINmax/OVPTH - (UVLObias*R1)/OVPTH;
R3 = A/B;

R2 = (R3 * VINmax)/OVPTH - R3 - R1 - (UVLObias * R1 * R3)/OVPTH;

fprintf("R1 = %.3fkOhm, R2 = %.3fkOhm, R3 = %.3fkOhm\r\n", R1/1000.0, R2/1000.0, R3/1000.0)