t1=[0:1:20]
[tSol YSol]=ode45(@odefun,t1,[0;0;0]);
subplot(2,1,1);
plot(tSol,YSol(:,1));
ylabel('ode-ouput1 : x1');
hold on;
subplot(2,1,2);
plot(tSol,2.8*YSol(:,3));
ylabel('ode-ouput2 : y3');