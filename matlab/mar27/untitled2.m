%% Linear Algebra Polynomials
% x + z = 4
% -x+y+z=4
% x-y+z=2
clear; clc; close all;
A=[1,0,1;-1,1,1;1,-1,1];
b=[4;4;2];
% Ax=b
x=A\b
x=mldivide(A,b)
x=linsolve(A,b)
% sparse matrix - matrix containing several zero elements

%% Matrix operations
clear; clc;
A=[1,0,1;-1,1,1;1,-1,1];
C=inv(A); %inverse
C*A;
A*C;
A=[1,2,3;4,5,6;7,8,9]
transpose(A); %transpose
A.'; %also gets the transpose
A=randi(10,2,2) +1i*randi(10,2,2)
A'; %not only transpose but also converts the complex numbers to their conjugates
A.'; %this one just transposes
A=[1,2,3;4,5,6;7,8,9]
fliplr(A) %flip left right
flipud(A) %flip up down
permute(A,[2,1]) %this only gives us the transpose for this dimension

%%
clear; clc;
M=5;
N=3;
A=rem(0:(M*N-1),N)
A=reshape(A,N,M)
A=permute(A,[2,1])

%%
clear; clc;
L=4;
M=5;
N=3;
A=rem(0:(M*N*L-1),N)'
A=reshape(A,N,M,L)
A=permute(A,[2,3,1]) %rearranges the order of the dimensions thus leading to the effect

%%
clear; clc;
A=randi(4,3,3);
det(A)
eig(A)
[V,E]=eig(A) %eigenvectors an eigenvalues

%% sparse matrices
clear; clc;
A=rand(1000,1000)>0.9999;
As=sparse(A); %only returns the non-zero elements and their indices ...
% Sometimes it occupies more space than the other matrix
spy(As) %helps us visiualize where these non-zero values are
full(As);

%% operations on vectors
clear; clc;
A=(1:3)+1i*(4:6)
dot(A,A)
A=(1:3)'+1i*(4:6)'
dot(A,A)
A'*A %also gives the scalar product
sum(conj(A).*A) %also another way

A=randi(3,3,3)
dot(A,A)
sum(A.*A,1) %multiply element wise and sum along the first dimension
A'*A
diag(A'*A)

A=1:3; 
B=4:6;
cross(A,B) %you cannot cross vectors longer than length 3

A=randi(10,7,3);
B=randi(8,7,3); % but somehow we can apply cross to this:...
% matlab will choose the first dimension that has 3 elements
cross(A,B)

%% Norm
clear; clc;
A=1:5;
p=7.1;
norm(A)
sqrt(sum(A.^2))

norm(A,p)
sum(A.^p)^(1/p)
% nthroot(sum(A.^p),p)

%% polynomials:
clear; clc;
% x^4+2x^3-13x^2-14x+24
P=[1,2,-13,-14,24];
R=roots(P)
P1=poly(R)
x=linspace(-5,5,100)
y=polyval(P,x);
plot(x,y,"b-",x,zeros(size(x)),'r-')
mypolyval=@(P,x) sum(P.*((x.').^((length(P)-1):-1:0)),2)
y1=mypolyval(P,x)
hold on
plot(x,y1,"g--")
hold off

%%
sum = 0
P=[1,2,-13,-14,24];
x=linspace(-5,5,100);
for x_value=1:length(x)
    sum=0;
    for idx=1:length(P)
        sum = sum + P(idx)*x(x_value)^(length(P)+1-idx);
    end
   disp(sum)
end

%% poly multiplication
clear;clc;
a=[1,0,1];
b=[1,0,-1];
c=conv(a,b) %convolution can be used to calculate the product
a=[1,1,1]
b=[1,1]
[q,r]=deconv(a,b) %quotient and reminder
isequal(a, conv(q,b) + r)

%% Poly derivative and integral
clear; clc;
a=[1,1,1,1];
ad=polyder(a) %poly differentiation
ai=polyint(ad) %poly integration

%% Curve fitting to data points:
clear; clc;
x=linspace(0,pi,50);
f=sin(x)+0.05*(rand(size(x))-0.5)
plot(x,f,'rx')
p=polyfit(x,f,4); %4 is the degree of the polynomial
y=polyval(p,x);
hold on
plot(x,y,'b-')
hold off
figure
fplot(poly2sym(p),[min(x),max(x)])
figure
fplot(@(x) polyval(p,x),[min(x),max(x)])

%% we will continue with finsert