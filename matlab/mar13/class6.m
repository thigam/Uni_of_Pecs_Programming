%%
clear; close all; clc;
x=-1:0.1:1
y=0:0.1:1.5
[X,Y]=meshgrid(x,y)
[X,Y]=ndgrid(x,y)
Z=(2-cos(pi*X)).*exp(Y)

surf(X,Y,Z,'EdgeColor','none', ...
    'FaceAlpha',0.7, ...
    'FaceColour', 'interp')

view([30,60])

%%
clear; close all; clc;
x=-1:0.1:1
y=0:0.1:1.5
N=400
[X,Y]=meshgrid(x,y)
[X,Y]=ndgrid(x,y)
Z=(2-cos(pi*X)).*exp(Y)
contour(X,Y,Z,N)
%figure
%contoruf(X,Y,Z,N, 'edgecolour', 'none')
V=2.*(0:4) %[1,2,4,8,16]
contour(X,Y,Z,V)

V=linspace(min(Z(:)),max(Z,[],"all"),30)
contour(X,Y,Z,V)

cs=contour(X,Y,Z,V)
clabel(cs,V(1:3:end))


figure
hold on %for same set of axes
vdown=linspace(min(Z(:)),5,10); %between smallest in Z and 1, 10 elements
vup=linspace(5, max(Z(:)),10);
c1=contour(X,Y,Z, vdown, '-')
c2=contour(X,Y,Z,vup,'--')
hold off

c=[c1,c2];
clabel(c,'manual') %You get to manually select which contours you would like labelled

%%
clear; close all; clc;
[x,y]=meshgrid(-pi/4:0.1:pi/4,-pi/2:0.2:pi/2)
z=abs(sin(x).*cos(y));
contour(x,y,z)
[dx,dy]=gradient(z)
hold on
quiver(x,y,dx,dy)
hold off

%%
clear; close all; clc;
x=linspace(-2,2,30)
[X,Y]=meshgrid(x)
Z=atan2(X,Y).*sin(X)
s=surf(X,Y,Z) %surface plot
t = 0;
%{
while true
    s
    view([t, 0])
    t = mod((t + 30),360);
    pause(0.1)
    drawnow
end
%}

while true
    [az,el]=view; %saves the viewing angles from view
    view([az+0.1,el]);
    drawnow;
end
%%
clear; close all; clc;
[X,Y,Z]=meshgrid(linspace(-pi,pi,50));
V=sin(X.^2).*cos(Y.^2).*sin(Z.^2);
slice(X,Y,Z,V,[-pi/4,pi/4],[-pi/3,pi/3],[0])

%% Functions:
% @(var1,...) Def()
clear; close all; clc;
@(x,y) sinx.*cos(y) %anonymous functions => it has no name
%but we can assign it to a function handle
f=@(x,y) sin(x).*cos(y)
x=-8:0.1:8;
subplot(2,2,1);
plot(x,f(x,2));
subplot(2,2,2);
fplot(@(x) f(x,2)) %plots functions, this is a real anonymous function
%xplot by default between -5 and 5
subplot(2,2,3);

[X,Y]=ndgrid(x);
surf(X,Y,f(X,Y));
subplot(2,2,4);
fsurf(f)