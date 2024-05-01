clear; clc;
c = 3E8;
g=9.81;
fprintf('c = %e\t g = %g\n',c,g)

%%
L=514;
S=sprintf('The value of the wavelength: \\lambda = %d nm', L);
Options.Interpreter = 'tex';
Options.WindowStyle = 'modal';
msgbox(S, Options);

%% Saving variables and data into files:
MyFile = fopen('MyFile.dat', 'w');
fprintf(MyFile, 'Standard, formatted string, %d\t %g\n', 10, pi);
fclose(MyFile);

%%
A=[(0:10)' sin(0:10)'];
writematrix(A, 'MyNewFile2.txt', 'Delimiter', 'tab');

%%
M=magic(6);
x=linspace(pi,exp(1),10);
save('MyNewMatFile', 'M', 'x')%Extension is always .mat

%% Read data from files:
%This is a comment
%{
This section is about reading datza from files
We discuss three commands:
-load
-readmatrix
-fread
%}
clear;
load('MyNewMatFile.mat');
A=readmatrix('MyNewFile2.txt');

Fid=fopen('MyFile.dat', 'r');
S=fread(Fid,'*char')';% ' transposes
fclose(Fid);

%%
[FileName,Path]=uigetfile({'*.txt; *.dat', 'Text files (*.txt, *.dat)'; ...
'*.*', 'All files (*.*)'}, 'Selecton of text files');

%%
M=[1 2 3
4 5 6
7 8 9];
c=3E8; % propagaton of the speed of light in vacuum

%% Useful commands:
who
whos
what % returns all the matlab compatible files (code files and mat files)
% pause(5)
% break command
% error('This is my nice error message...'); execution stops
warning('There is global warming!...') %execution continues
A=5
clear;

%%
clear; clc;
try
A=randi(20);
if A<10
error('A is less than 10');
end
catch
warning('A was less than 10, but you cannot see the error message');
end

%%
errordlg('This is an error'); %This doesn't stop the execution of the code
warndlg('This is a warning');
helpdlg('This is a help dialog');

%% Loops and conditionals
% Calculating the cosine of a number (using a 'for' loop):
clear; clc;
x=pi/7
a=0
for z = 0:30
a = a + (((-1)^z)*((pi/7)^(2*z)/factorial(2*z)))
end
format long
disp([cos(x),a]);
disp(cos(x)==a);
disp(cos(x)-a);
format short

%You shoudl avoid using loops
tic
k=0:30;
xcos=sum((-1).^k.*(x.^(2*k))./factorial(2*k));
toc
xcos

%% Example 2: matrix multiplication
clear; clc;
A=randi(20,400,500);
B=randi(10,500,600);

A*B;
tic
C=zeros(size(A,1),size(B,2));
for k1=1:size(A,1)
for k2=1:size(B,2)
for k3=1:size(A,2)
C(k1,k2)=C(k1,k2)+A(k1,k3)*B(k3,k2);
end
end
end
toc
C1=C;
tic
C=zeros(size(A,1),size(B,2));
for k1=1:size(A,1)
for k2=1:size(B,2)
C(k1,k2)=A(k1,:)*B(:,k2);
end
end
toc
C2=C;
tic
C=zeros(size(A,1),size(B,2));
for k1=1:size(A,1)
C(k1,:)=A(k1,:)*B;
end
toc
C3=C;
tic
C=zeros(size(A,1),size(B,2));
C=A*B;
toc
C3=C;

%%
clear; clc;
x=pi/7
a=0
z = 0
while abs(cos(x)-a) > 10^(-7)
a = a + (((-1)^z)*((pi/7)^(2*z)/factorial(2*z)));
z=z+1;
end
a
z=z-1