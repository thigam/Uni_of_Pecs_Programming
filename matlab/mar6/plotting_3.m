clear; close all; clc; % close all helps us avoid opening may figure windows from different rounds of running the code
format compact
x=linspace(0,10,200);
y=sin(5*x)
length(x)==length(y)
numel(x)==numel(y) %number of elements
size(x)==size(y) %comparing two vectors
isequal(size(x),size(y))

plot(x,y) %x to the horizontal, and y to the vertical
%axis([-1,11,-1.3,1.3]) %limits of x axis then of y axis
xlim([-1,11]) %same as axis() for the horizontal axis
ylim([-1.3,1.3])

axis square
axis equal %setting both axes to have the same range

%% logarithmic axes in one figure;
clear; close all; clc;
x=linspace(1,9,81)
y1=exp(x);
y2=log(x);
y3=20*x;
subplot(2,2,1);
semilogx(x,y2) %adjusts the horizontal axis to have a logarithmic scale
title("Semi-log axes, x is log'ed")
subplot(2,2,2);
semilogy(x,y1)
title("semi-log axes, y is log'ed")
subplot(2,2,[3,4]);
loglog(x,y3,'rx')
title("Doubly-log axes, both are log'ed")
%plot(x,y3,'rx','MarkerSize', 20)

%% logarithmic axes in one figure;
clear; close all; clc;
x=linspace(1,9,81)
y1=exp(x);
y2=log(x);
y3=20*x;
nexttile;
semilogx(x,y2) %adjusts the horizontal axis to have a logarithmic scale
title("Semi-log axes, x is log'ed")
nexttile;
semilogy(x,y1)
title("semi-log axes, y is log'ed")
nexttile;
loglog(x,y3,'rx')
title("Doubly-log axes, both are log'ed")
%plot(x,y3,'rx','MarkerSize', 20)

%% 3D line plots;
clear; close all; clc;
dphi=pi/100;
N=30;
phi=0:dphi:N*2*pi; % going from 0 qith a step size of dphi upto n*2*pi (one circle)
theta=phi/(2*N)-pi/2; % azimuthal angles (from the south pole)
r=ones(size(phi));

x=r.*cos(theta).*cos(phi); %element wise dot multiplication
y=r.*cos(theta).*sin(phi);
z=r.*sin(theta);

plot3(x,y,z);
axis equal

%% alternatively, using sph2cart:
clear; close all; clc;
dphi=pi/100;
N=30;
phi=0:dphi:N*2*pi; % going from 0 qith a step size of dphi upto n*2*pi (one circle)
theta=phi/(2*N)-pi/2; % azimuthal angles (from the south pole)
r=ones(size(phi));
[X,Y,Z]=sph2cart(phi,theta,r);
plot3(X,Y,Z)

%% line and marker parameters:
clear; close all; clc;
x=linspace(0,2*pi,50);
hold on
plot(x,sin(x), 'r-.*')
plot(x,sin(x),'LineStyle','-.', 'Color', 'red', 'LineWidth',3,...
    'Marker','o','MarkerEdgeColor',[0.2,0.7,0.5],'MarkerFaceColor','g',...
    'MarkerSize',8) % properties and their corresponding values
%another way of doing it
P=plot(x,cos(x));
P.LineWidth=2;
P.Marker='h';
P.MarkerEdgeColor='y';
P.MarkerFaceColor='Magenta';
P.MarkerSize=10;
P.LineStyle=':';
P.Color=[0.8,0.3,0.5];
hold off

%% magic
x=linspace(0,2*pi,50);
colours=['r','g','b'];
P=plot(x,cos(x));
P.LineWidth=3;
while true
    for k=1:3
        P.Color=colours(k);
        P.YData=cos(x+k);
        drawnow
        pause(1);
    end
end

%% 
clear; clc; close all;
a=1.5;
P=[pi/2,pi/3];
sigma=[1.5,2.5];
x=linspace(-2*pi,2*pi,50);
y=linspace(-2*pi,2*pi,50);
[X,Y]=meshgrid (x,y);
Z=a*exp(-(X-P(1)).^2/(2*sigma(1)^2)-(Y-P(2)).^2/(2*sigma(2)^2));
surf(X,Y,Z);
xlabel('X axis');
ylabel('Y axis');
zlabel('Z axis');
title("Two-variable Gaussian function");
S='$A\exp\left(-\frac{(X-X_0)^2)}{2\sigma_x^2}-\frac{(Y-Y_0)^2)}{2\sigma_x^2}\right)$'
legend(S,'Interpreter','latex');
text(4,-4,1.25,'Some text'); %relative to the coordinate system even if you rotate it
annotation('textbox',[0.05,0.9,0.5,0.1],'String','(a)','EdgeColor','none','FitBoxToText','on')

%% interesting plots;
clear; close all; clc;
r=linspace(0,2);
theta=linspace(0,10*pi); % default is a 100
z=r.*exp(1i*theta);
plot(z);

[X,Y]=pol2cart(theta,r);
plot(X,Y);

polar(theta,r) %not recommended in matlab
polarplot(theta,r) %homework, how to modify the numbers on the plot

hist(randi(10,1,7)) %numbers between one and ten
bar(randi(10,1,7))

%% Pie charts:
clear; clc; close all;
Parties=["greens","reds", "blues","whites","yellows"];
Ratio=randi(10000,size(Parties))
pie3(Ratio,Parties);
figure
pie(Ratio,Parties); %2d %another assignment, how to modify the colours
gtext("Majority"); %research on this

%%
clear; close all; clc;
n=figure('Pointer','hand'); %pointer of the figure window has been modified to hand
[x,y,t]=ginput(1) %t mouse button which was used, 1 is left click
plot(x,y,'bh');
xx=x;yy=y;
hold on
xlim([0,1]);
ylim([0,1]);
while t~=3 %right click
    [x,y,t]=ginput(1);
    plot(x,y,'bh');
    xx=[xx,x];
    yy=[yy,y];
end
clf %clear figure window
line(xx,yy);
waitforbuttonpress
delete(n) % n is the identifier of the figure