%This is a state-space approach towards solving the coupled equations for a
%3stage absorber.x variable is for the number of moles of a gas and y
%variable is for the number of moles of the liquid. The values over which
%the system is modelled are taken from a problem statement found online.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tau=2;  %liquid residence time
k=1/3;  %ratio of gas to liquid flowrate= G/L
a=2.8;  %slope of the linear relation between x and y i.e: y = ax + b
d=a*k;  %stripping factor= a*(G/L)

% State matrices for state space representation A,B,C,D and state variables
% [x1,x2,x3] and output [x1,y3]
A=(1/tau)*[-(1+d) 1 0;d -(1+d) 1;0 d -(1+d)]; 
B=(1/tau)*[0 k -k;0 0 0;1 0 0];
C=[1 0 0;0 0 a];
D=[0 0 0;0 0 1];

% u is the input matrix with variavles [xf,yf,b] 
u=[0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0;0.001 0.3 0];
t=[0:1:20]; %time duration for simulation
sys = ss(A,B,C,D); % modeling the system in state space format
[y,t]=lsim(sys,u,t); %solving the state space equations over the mentioned time duration and given initial conditions

%plot the output responses x1 and y3 over the time duration
subplot(2,1,1);
plot(t,y(:,1));
ylabel('ouput1 : x1');
hold on;
subplot(2,1,2);
plot(t,y(:,2));
ylabel('ouput2 : y3');

