%% Circles: a function to calculate radii or two tangenital circles (shows up when your run help on the command prompt

function [r1,r2]=Circles(L,T)
    eqs=@(x) [x(1)+x(2)-L; (x(1)^2+x(2)^2)*pi-T];
    R=fsolve(eqs,[1,3]);
    r1=R(1); ...
    r2=R(2);
end