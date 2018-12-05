%This was written by JB at jamdatajam on Youtube
%Walkthrough is here: https://youtu.be/zXBfR2mtr4E
%This script tests the feasibility of of importing raw ECG/EKG tracing data
%into MATLAB for processing

%clear stuff
clf
clear
clc

%Load the ECG/EKG data
EKG = load('100m.mat')

EKG_1 = EKG.val(1,:);
EKG_2 = EKG.val(2,:);

%time step vector
ts = (0:10/length(EKG_1):10-10/length(EKG_1));

%plot data
plot(ts, EKG_1)
hold on;

title('EKG Data (Channel 1)')
xlabel('Time (in seconds)')
ylabel('EKG amplitude')

%[PkAmp, PkTime] = findpeaks(Displacement)
[PkAmp, PkTime] = findpeaks(EKG_1, 'MinPeakHeight', 1100);
Actual_Time = PkTime/length(EKG_1);