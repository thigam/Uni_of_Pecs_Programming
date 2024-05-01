function [Value,Exit,Direction]=DropletEvent(t,x)
    Value=abs(x(2))-1E4;
    Exit=1;
    Direction=0;
end