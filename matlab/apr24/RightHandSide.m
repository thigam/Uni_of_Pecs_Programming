function out=RightHandSide(~,u) %since t is not used
    global w0 %for omega
    out=zeros(size(u));
    out(1)=u(2);
    out(2)=-w0^2*u(1);
end