clear; close all; clc;
x=0:0.2:1;
y=[1.1 1.2 1.52 1.84 2.2 2.7];
FitFunc=@(a,x) a(1)*exp(a(2)*x);
LeastSquare=@(a,x,y) sum((y-FitFunc(a,x)).^2);
a0=[0.5,0.5];
figure
plot(x,y,'rx');
hold on
plot(x,FitFunc(a0,x),'b-');

aopt=fminsearch(@(a) LeastSquare(a,x,y),a0);
plot(x,FitFunc(aopt,x),'g-');
hold off
% how to plot fitfunc with this fit function in every iteration

%% Function "fit"
clear; close all; clc;
x=linspace(0,10,1000)';
y=x.^2+10*(rand(size(x))-0.5); % the extra terms are noise

[f,gof]=fit(x,y,'poly2') %f for the fit and gof for the goodness of fitting

plot(f,x,y);

%%
clear; close all; clc;
[X,Y]=ndgrid(linspace(0,10,20));
Z=X.^2+Y.^2+50*(rand(size(X))-0.5);
scatter3(X,Y,Z);

f=fit([X(:),Y(:)],Z(:),'poly23');

plot(f,[X(:),Y(:)],Z(:))

%%
clear; clc; close all;

x=(0:0.01:2)';
p=randi(10,4,1)
y=MyFit(x,p(1),p(2),p(3),p(4));
y=y+max(abs(y))/50*(rand(size(x))-0.5);
plot(x,y,'rx');
ft=fittype(@(a,b,c,d,x) MyFit(x,a,b,c,d));
[f,gof]=fit(x,y,ft,'StartPoint',p+0.1*(rand(size(p))-0.5)) %[1,2,3,4]
plot(f,x,y)

%%
%{
1,1
3,2
4,5
Create towo array variables x,y and sotre the correspondin
values in them
plot thesse points
Try to fit a straight line to these ponts by using 
polyfit, fit or whatever value we can think of
%}
x=[1 3 4]'
y=[1 2 5]'
plot(x,y,'bx')
f=fit(x,y,'poly1')
plot(f,x,y,'b.')

%%
clear; clc; close all;
x=[1,3,4];
y=[1,2,5];
polyfit(x,y,1)

%%
clear; close all; clc;
fplot(@(x) sin(tan(x)));
func=@(x) sin(tan(x));
x1=1.8;
x2=1.9;
chk=min(abs(func(x1)),abs(func(x2)))
while abs(chk)>1E-10
    f1=func(x1);
    f2=func(x2);
    xnew=x1-f1*(x2-x1)/(f2-f1);
    chk=func(xnew);
    if sign(chk)==sign(f1)
        x1=xnew;
    elseif sign(chk)==sign(f2)
        x2=xnew;
    elseif chk==0
        disp([xnew,chk]);
        break;
    end
end
disp([xnew,chk])
hold on
plot(xnew,chk,'rx')
hold off

%%
clear; close all; clc;
f=@(x) sin(tan(x));
df=@(x) sec(x)^2*cos(tan(x));
x0=1.9;
xe=x0-f(x0)/df(x0);
while abs(x0-xe)>1E-10
    x0=xe;
    xe=x0-f(x0)/df(x0);
end
disp([xe,f(xe)])

%%
clear; close all; clc;
syms f(x) %because by default matlab works with numbers
f=@(x) sin(tan(x))
df=diff(f,x)

syms f x
f=symfun(sin(tan(x)),[x]) %another way of creating a
%symbolic function
df=diff(f,x)

%%
clear; close all; clc;
f=@(x) sin(tan(x));
fzero(f,1.9) %the solution here strongly depends on 
%the starting value

%%
clear; close all; clc;
x0=[1;2;3];
opts=optimset('Display','iter','TolFun',1E-13);%optimization settings
%set display to iter
[x,fval]=fsolve(@ToBeSolved,x0,opts)

%%
clear; close all; clc;
syms x y a
[solx,soly]=solve(x^2*y^2==0,x-y/2==a) %you need two equals signs
%[solx,soly]=solve([x^2*y^2==0,x-y/2==a],[x,a])

%%
syms u v a
s=solve(u^2-v^2==a^2,u+v==1,a^2-2*a==3)
s.a
s.a(1)