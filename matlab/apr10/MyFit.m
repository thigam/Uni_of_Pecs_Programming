function out=MyFit(x,a,b,c,d)
    out=a*sin(b*x).*exp(c*x)+d*x;
end