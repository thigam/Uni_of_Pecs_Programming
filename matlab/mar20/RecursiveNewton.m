function [x,errval]=RecursiveNewton(f,df,x0,err,itermax)
    if itermax<1
        return;

    end
    itermax=itermax-1;
    x=x0-f(x0)/df(x0);
    errval=abs(x-x0);
    if errval<abs(err)
        return;
    else
        [x,errval]=RecursiveNewton(f,df,x,err,itermax)
    end
end