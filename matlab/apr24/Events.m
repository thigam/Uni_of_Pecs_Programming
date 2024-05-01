function [value,exit,direction]=Events(t,u)
    value(1,1)=u(1); %==0
    value(2,1)=u(2);
    exit=[0;0];
    direction=[1;-1];
end