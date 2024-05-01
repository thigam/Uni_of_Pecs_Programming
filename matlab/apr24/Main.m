clear; close all; clc;
global w0 %global variable
w0=1;
tstart=0;
u0=[0.1;0];
tfinal=200;
[t,u]=ode45(@(t,u) RightHandSide(t,u),[tstart,tfinal],u0);
%ode45(@(t,u) RightHandSide(t,u),[tstart,tfinal],u0)

x=u(:,1);
v=u(:,2);

te=linspace(tstart,tfinal,200);
xe=interp1(t,x,te,"spline");
ve=interp1(t,v,te,"spline"); %since t is not an evenly
%spaced list

tdiff=diff(t); %in an array, calculates the difference between neighbo
%uring elements
plot(tdiff)
plot(te,xe);

%% Event finding
clear; close all; clc;
global w0 %global variable
w0=1;
tstart=0;
u0=[0;0.1];
tfinal=20;
options=odeset('Events',@Events,'RelTol',1E-8);
[t,u,te,ue,ie]=ode45(@(t,u) RightHandSide(t,u),[tstart,tfinal],u0,options);
%ode45(@(t,u) RightHandSide(t,u),[tstart,tfinal],u0)

t1=te(ie==1);%time instances
x1=ue(ie==1,1);
v1=ue(ie==1,2);

t2=te(ie==2);%time instances
x2=ue(ie==2,1);
v2=ue(ie==2,2);

plot(t,u(:,1),'g-',t1,x1,'rx',t2,x2,'bx')

%%
clear; close all; clc;
global A B 
A=1;
B=0.1343;
options=odeset("Events",@DropletEvent);
[x,y]=ode45(@ODEDroplet,[1E-5,10],[0;0],options);
plot(x,y(:,1),'b',-x,y(:,1),'b')
axis equal %to have the same unit lenght on each axis
hold on
fplot(@(t) x(end)*cos(t),@(t) x(end)*sin(t)+y(end,1),[pi,2*pi])
hold off %the shape of the droplet is not the shape of a circle

%%
clear; close all; clc;
syms y(x)
eq=diff(y,x)+2*x*y==0; %y(prime)+2xy
ysol(x)=dsolve(eq)
ic=y(23)==pi;
ysol(x)=dsolve(eq,ic)

%%
syms y(x)
eq=y==diff(y,x)*x+2*(diff(y,x)^2);
ysol(x)=dsolve(eq)

%%
clear; close all; clc;
f=@(x) cos(x);
a=0;
b=5;
N=100;
x=linspace(a,b,N);

trapz(f(x)) %length of the intervals will be 1
trapz(x,f(x)) %uses the trapezoidal method to get the area 
%under the curve
integral(f,a,b)
integral2(@(x,y) sin(x).*cos(y),-pi,pi,-pi,pi)
integral3(@(x,y,z) sin(x).*cos(y)./log(z),-pi,pi,-pi,pi,1.1,2)

%%
clear; close all; clc;
syms x
F(x)=cos(x);
SymIntF=int(F,x) %int to integrate a symbolic function
double(SymIntF(1)) %without double haikuwa inawork out
subs(SymIntF,1) %same as above without double
%since sin(1) is most accurate
NumIntF=matlabFunction(SymIntF)
NumIntF(3)

%%
clear; close all; clc;
syms x
F(x)=sin(x)*cos(x);
int(F,x,0,1)

%%
clear; close all; clc;
syms x y
F(x,y)=2*x*y;
int(F,y,x^2,sqrt(x))
int(int(F,y,x^2,sqrt(x)),x,0,1)
%finding the volume of the integration of the area 
%between the curves y=x^2 and y=x^(1/2)