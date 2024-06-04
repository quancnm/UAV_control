%% parameters of pelican
L=0.17; %armlength
Ix = 0.0073; Iy = 0.0073; Iz = 0.0117;
I = diag([Ix,Iy,Iz]); %kg.m^2
m = 0.616; %total mass(kg)
g = 9.81; %gravity constant (m/s^2)

%% AeroDynamics
% convert Rad/s = RPM*2*pi/60
b = 5.9347e-06;
d = 1.2181e-07;


%% Initial Condition
omegaInit = [0;0;0];
attitudeInit = [0;0;0];
velInit = [0;0;0];
posInit = [0;0;0];
MotorSpeedInit = [0;0;0];

%% Motor Dynamics
ks=735;
tau=1/200;

%% Controllers 
w0 = sqrt(m*g/(4*b));
u0=0.49;
lambda = w0^2/u0
Kth=b*lambda
Kd=d*lambda

%for height
wh_n=2
kxih=0.7
kp_h=wh_n^2*m/(4*Kth)
kd_h=2*kxih*wh_n*m/(4*Kth)

%for position
w_n = 8
zeta=0.7
U1=m*g