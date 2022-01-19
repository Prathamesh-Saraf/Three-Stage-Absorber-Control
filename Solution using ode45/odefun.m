function dYdt=odefun(t,Y)
a=2.8;
b=0;
k=1/3;
tau=2;
d=a*k;
xf=0.001;
yf=0.3;
x1=Y(1);
x2=Y(2);
x3=Y(3);
dx1dt=(1/tau)*(k*(yf-b) - (1 + d)*x1 + x2);
dx2dt= (1/tau)*(d*x1 - (1 + d)*x2 + x3);
dx3dt= (1/tau)*(d*x2 - (1 + d)*x3 + xf);
dYdt=[dx1dt;dx2dt;dx3dt]
end