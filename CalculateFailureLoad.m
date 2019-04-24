%This program calculates the failure load for the bridge built as part of
%group project 3.


%Clear console and workspace
clear
clc
%Precalculated values for sin and cos theta
s = sin(0.89605204);
c = cos(0.89605204);

%The names of all unknown forces
names = ["AB";"BC";"CD";"DE";"EF";"FG";"AI";"BI";"CI";"CJ";"DJ";"DK";"DL";"EL";"EM";"FM";"GM";"IJ";"JK";"KL";"LM";"RA";"RG"];

aF = 29;%Failure load for members in tension
bF = 58.6;%Failure load for 10x6x125
cF = 78.6;%Failure load for 10x10x100
dF = 70.2;%Failure load for 10x10x160
breakingLoads = [aF;aF;aF;aF;aF;aF;dF;aF;aF;bF;aF;bF;aF;bF;aF;aF;dF;cF;cF;cF;cF;99999;99999]; %Vector containing all failure loads for all members

A = [1	0	0	0	0	0	c	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	s	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0
-1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	-1	1	0	0	0	0	0	-c	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	s	1	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	-1	1	0	0	0	0	0	0	-c	0	c	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	s	1	s	0	0	0	0	0	0	0	0	0	0
0	0	0	-1	1	0	0	0	0	0	0	0	0	0	c	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	1	s	0	0	0	0	0	0	0	0
0	0	0	0	-1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0
0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	-c	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	s	0	0	0	0	0	1
0	0	0	0	0	0	-c	0	c	0	0	0	0	0	0	0	0	1	0	0	0	0	0
0	0	0	0	0	0	-s	-1	-s	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	c	0	0	0	0	0	0	-1	1	0	0	0	0
0	0	0	0	0	0	0	0	0	-1	-s	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	1	0	0	0
0	0	0	0	0	0	0	0	0	0	0	-1	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	-c	0	0	0	0	0	0	-1	1	0	0
0	0	0	0	0	0	0	0	0	0	0	0	-s	-1	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	-c	0	c	0	0	0	-1	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	-s	-1	-s	0	0	0	0	0	0]; %Matrix containing all simultaneous equations


%Initial variable set up
solved = false;
load = 0;
step = 0.1;
while (solved == false) %Loop through until solved
    load = load + step; %increment load on each loop iteration
    IL = load/10; %Calculate the individual load of each loading point
    b = [0;0;0;IL;0;IL;0;IL;0;IL;0;IL;0;0;0;0;0;0;0;0;0;0;0;0]; %Output vector
    x = A\b; %solve for unknown forces
    if(max(x > abs(breakingLoads)) ~= 0) %calculate if any values exceed the relevant breaking load
        solved = true; %If so stop the loop
        [val, idx] = max(x > abs(breakingLoads)); %get the index of the broken member
        disp(["Broken Member is ", names(idx), ' at a load of ',load - step, 'N']); %display to user
    end
end

