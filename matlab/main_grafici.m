close all
clear all
clc

%loading file
%bag=rosbag('hw2_3c0.bag');
%bag=rosbag('hw2_3c1.bag');
%bag=rosbag('hw2_3c2v2.bag');
bag=rosbag('hw2_3c3v2.bag');

%loading info
bSel1 = select(bag,'Topic','/iiwa/iiwa_joint_1_effort_controller/command');
msgStructs = readMessages(bSel1,'DataFormat','struct');
eff1 = cellfun(@(m) double(m.Data),msgStructs);
bSel2 = select(bag,'Topic','/iiwa/iiwa_joint_2_effort_controller/command');
msgStructs = readMessages(bSel2,'DataFormat','struct');
eff2 = cellfun(@(m) double(m.Data),msgStructs);
bSel3 = select(bag,'Topic','/iiwa/iiwa_joint_3_effort_controller/command');
msgStructs = readMessages(bSel3,'DataFormat','struct');
eff3 = cellfun(@(m) double(m.Data),msgStructs);
bSel4 = select(bag,'Topic','/iiwa/iiwa_joint_4_effort_controller/command');
msgStructs = readMessages(bSel4,'DataFormat','struct');
eff4 = cellfun(@(m) double(m.Data),msgStructs);
bSel5 = select(bag,'Topic','/iiwa/iiwa_joint_5_effort_controller/command');
msgStructs = readMessages(bSel5,'DataFormat','struct');
eff5 = cellfun(@(m) double(m.Data),msgStructs);
bSel6 = select(bag,'Topic','/iiwa/iiwa_joint_6_effort_controller/command');
msgStructs = readMessages(bSel6,'DataFormat','struct');
eff6 = cellfun(@(m) double(m.Data),msgStructs);
bSel7 = select(bag,'Topic','/iiwa/iiwa_joint_7_effort_controller/command');
msgStructs = readMessages(bSel7,'DataFormat','struct');
eff7 = cellfun(@(m) double(m.Data),msgStructs);
t=0:0.005:10;

%graph
figure()
plot(t(1:length(eff1)),eff1)
hold on
plot(t(1:length(eff2)),eff2)
hold on
plot(t(1:length(eff3)),eff3)
hold on
plot(t(1:length(eff4)),eff4)
hold on
plot(t(1:length(eff5)),eff5)
hold on
plot(t(1:length(eff6)),eff6)
hold on
plot(t(1:length(eff7)),eff7)
legend('u1','u2','u3','u4','u5','u6','u7')
grid
axis ([0 6 -100 50])
xlabel('Time [s]')
ylabel('Torque [Nm]')
title ('Effort Control Input')
%subtitle('Linear trajectory with trapezoidal velocity profile')
%subtitle('Linear trajectory with cubic polynomial')
%subtitle('Circular trajectory with trapezoidal velocity profile')
subtitle('Circular trajectory with cubic polynomial')

