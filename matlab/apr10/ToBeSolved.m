function out=ToBeSolved(in)
    x=in(1);
    y=in(2);
    z=in(3);
    out=zeros(3,1);
    out(1)=sin(x*y)-0.95+exp(-x*z);
    out(2)=z*sqrt(x^2+y^2)-6.7;
    out(3)=tan(y/x)+cos(z)-3.15;
end