%% Relation symbols, commands and functions:
% == eq()
% < lt()
% > gt()
% <= le()
% >= ge()
% ~= ne()
% & (&) and()
% | (||) or()
% ~ not()

%% Example: If you go outside without any rain gear or cover when it's pouring rain you will get wet"
clear; clc;
gos=true;
rg=false;
c=0;
pr=1;

gw=gos  & ~(rg | c) & pr
gw2=and(and(gos,not(or(rg, c))), pr)

%% Example
% "a" is a random integer (between 1 and 3)
% "b" is set to
% - 10, when "a" is 2
% - 5, when "a" is 1
% - 1 in any other case

clear; clc;
a=randi([1,3])

%{
if a==2
b=10;
elseif a==1
    b=5;
else
    b=1;
end
disp([a,b])
%}


%{
switch a
    case 2
        b=1;
    case 1
        b=5
    otherwise
        b=1
end
disp([a,b]);
%}

b=10*(a==2)+5*(a==1)+~(a==2 | a==1)

%% Grade calculator

clear; clc;
%{
0-40==>1
(40-55]==>2
(55-70]==>3 ...
(70-85]==>4
(85-100]==>5
%}


Score=inputdlg('Kindly enter the grade: ', 'Grade between 0-100');
Score=str2num(Score{1})
switch Score
    case le(40)
        Grade=1;
        Output="Fail"
    case and(gt(40),le(55))
        Grade=2
        Output="pass"
    case and(gt(55), le(70))
        Grade=3
        Output="satisfactory"
    case and(gt(70), le(85))
        Grade=4
        Output="good"
    case and(gt(85), le(100))
        Grade=5;
        Output="excellent"
    otherwise
        warndlg("Kindly enter a valid grade", "Invalid grade");
end
msgbox(sprintf("Your grade is %d", Grade));
Grade
Output


%%
MaxPoint=71;
Limits=[40,55,70,85,100]
Grades=1:5;
Names=["Fail", "Pass", "Satisfactory", "Good", "Excellent"];
N=inputdlg('Enter the achieved points', 'Points', [1,25], {'0'});
[N,status]=str2num(N{1});
if status~=1
    errordlg("what is it that you entered here?!?");
elseif (N<0 || MaxPoint<N)
    errordlg(sprintf("The entered value is outside the range [0,%d]", MaxPoint));
else
    N=N/MaxPoint*100;
    if N<=Limits(1)
        warndlg(sprintf('Your grade is %s (%d)',Names(1),Grades(1)));
    elseif N<=Limits(2)
        msgbox(sprintf('Your grade is %s (%d)', Names(2),Grades(2)));
    elseif N<=Limits(3)
        msgbox(sprintf('Your grade is %s (%d)', Names(3),Grades(3)));
    elseif N<=Limits(4)
        msgbox(sprintf('Your grade is %s (%d)', Names(4),Grades(4)));
    elseif N<=Limits(5)
        msgbox(sprintf('Your grade is %s (%d)' ,Names(5),Grades(5)));
    end
end


%% Adding modifications (using switch case)

MaxPoint=71;
Limits=[0,40,55,70,85,100]
Grades=1:5;
Names=["Fail", "Pass", "Satisfactory", "Good", "Excellent"];
N=inputdlg('Enter the achieved points', 'Points', [1,25], {'0'});
[N,status]=str2num(N{1});
if status~=1
    errordlg("what is it that you entered here?!?");
elseif (N<0 || MaxPoint<N)
    errordlg(sprint("The entered value is outside the range [0,%d]", MaxPoint));
else
    Grade=discretize(N/MaxPoint*100, Limits,Grades);
    switch Grade
        case 1
            warndlg(sprintf('Your grade is %s (%d)',Names(1),Grade));
        case {2,3,4,5}
            msgbox(sprintf('Your grade is %s (%d)', Names(Grade),Grade));
    end
end

%% Another version (using icons)

MaxPoint=71;
Limits=[0,40,55,70,85,100]
Grades=1:5;
Names=["Fail", "Pass", "Satisfactory", "Good", "Excellent"];
N=inputdlg('Enter the achieved points', 'Points', [1,25], {'0'});
[N,status]=str2num(N{1});
if status~=1
    errordlg("what is it that you entered here?!?");
elseif (N<0 || MaxPoint<N)
    errordlg(sprint("The entered value is outside the range [0,%d]", MaxPoint));
else
    Grade=discretize(N/MaxPoint*100, Limits,Grades);
    Icons={'warn', 'none'};
    msgbox(sprintf('Your result is %s (%d)', Names(Grade), Grade), '', Icons{(Grade~=1)+1});
end

%% Condition arrays
clear; clc;
a=[2<10 3==4];
b=0
if a
    b=11;
end
disp(b);
%by defaut, all() is applied

%%   Using any()
clear; clc;
a=[0 4.1,inf; 5.7 -6,0; -inf,4,5]
if any(a)
    b=12
end
disp(b);

%%
clear;
a=randi([0,7]);
if a>2
    if a<6
        b=10;
    else
        b=0;
    end
else
    b=12;
end

%b=10*all([a>2 a<6])+12*not(all([a>2 a<6]))

%{
if and(2<a,a<6)
    b=10;
elseif a>2
    b=0;
else
    b=12;
end
%}

%%
clear; clc;
A=NaN(4,6)

for k1=1:size(A,1)
    for k2=1:size(A,2)
        if k1==k2
            A(k1,k2)=2;
        elseif abs(k1-k2)==1
            A(k1,k2) = -1;
        else
            A(k1,k2) = 0;
        end
    end
end
disp(A);

%% (My version) with switch case
clear; clc;
A=NaN(4,6)

for k1=1:size(A,1)
    for k2=1:size(A,2)
        switch abs(k1-k2)
            case 0
                A(k1,k2)=2;
            case 1
                A(k1,k2) = -1;
            otherwise
                A(k1,k2) = 0;
        end
    end
end
disp(A);

%% (His version) with switch case
clear; clc;
A=nan(4,6)

for k1=1:size(A,1)
    for k2=1:size(A,2)
        switch abs(k1-k2)
            case 0
                A(k1,k2)=2;
            case 1
                A(k1,k2) = -1;
            otherwise
                A(k1,k2) = 0;
        end
    end
end
disp(A);

%% One-line solution

full(spdiags(repmat([-1,2,-1],8,1),[-1,0,1],4,6))

%%
clear; clc;
A=1;
N=20;
for n=2:N
    if mod(n,2)==0
        A=[A;n*ones(1,size(A,2))];
    else
        A=[A,n*ones(size(A,1),1)];
    end
end
disp(A);





