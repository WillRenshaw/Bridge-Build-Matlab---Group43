%This program calculates the failure load for the bridge built as part of
%group project 3.


%Clear console and workspace
clear
clc
%Precalculated values for sin and cos theta
s = sin(atan(1.25));
c = cos(atan(1.25));

%The names of all unknown forces
names = ["F1";"F2";"F3";"F4";"F5";"F6";"F7";"F8";"F9";"F10";"F11";"F12";"F13";"F14";"F15";"F16";"F17";"F18";"F19";"F20";"F21";"Rx1";"Ry1";"Rx2";"Ry2"];


af = 29;%Failure load for members in tension
bf = 58.6;%Failure load for 10x6x125
cf = 78.6;%Failure load for 10x10x100
df = 70.2;%Failure load for 10x10x160

af = 2* af; %members are doubled up
breakingLoads = [df,af,bf,cf,af,af,bf,cf,af,af,bf,cf,af,af,bf,cf,af,af,bf,df,af,99999999,9999999,99999999,9999999]; %Vector containing all failure loads for all members
%Matrix containing all simultaneous equations

A = [c	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0
s	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0
-c	0	0	1	c	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
-s	0	-1	0	-s	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	-1	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	-1	0	0	0	1	c	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	-1	0	-s	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	-c	-1	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	s	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	-1	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	-c	-1	0	0	c	1	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	s	0	1	0	s	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	-1	-c	0	0	1	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	-s	0	-1	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	-1	0	0	c	1	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	s	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	-c	0	0	c	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-s	0	-1	-s	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	0	0	1	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-c	-1	0	0	-1	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	s	0	0	0	0	1];


%Initial variable set up
solved = false;
load = 0;
step = 0.1;
while (solved == false) %Loop through until solved
    load = load + step; %increment load on each loop iteration
    IL = load/10; %Calculate the individual load of each loading point
    b = [0;0;0;0;0;IL;0;0;0;IL;0;0;0;IL;0;0;0;IL;0;0;0;IL;0;0]; %Output vector
    x = A\b; %solve for unknown forces
    if(max(max(x > abs(breakingLoads))) ~= 0) %calculate if any values exceed the relevant breaking load
        solved = true; %If so stop the loop
        [val, idx] = max(max(x > abs(breakingLoads))); %get the index of the broken member
        disp(["Broken Member is ", names(idx), ' at a load of ',num2str(load), 'N']); %display to user
    end
end

