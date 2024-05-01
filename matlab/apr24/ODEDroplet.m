function out=ODEDroplet(x,y) 
    global A B 
    out=[y(2);(A-B*y(1))*(1+y(2)^2)^(3/2)-y(2)/x*(1+y(2)^2)]
end