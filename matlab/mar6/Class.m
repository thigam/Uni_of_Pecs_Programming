clear; clc;
[R1,R2]=Circles(4,80*pi/9)
R3=Circles(4,80*pi/9)
[~,R4]=Circles(4,80*pi/9)
%%
clear; clc;
[x0,err]=RecursiveNewton(@sin,@cos,6,1E-3,10) %no arguments sine it i s a function handéle

%%
clear; clc;
M=[1,2;3,4];
RecDet(M)
for ii=1:10
    %display(ii);
    A=randi(10,ii,ii);
    tic
    det(A);
    BuiltIn=toc;
    tic
    RecDet(A);
    SelfCode=toc;
    fprintf("Size: %dx%d, BuiltIn: %g, SelfCode: %g\n", ii, ii, BuiltIn, SelfCode);
end

%%
clear; clc;
RootFinder()
%%
clear; clc;
RootFinder(@sin)