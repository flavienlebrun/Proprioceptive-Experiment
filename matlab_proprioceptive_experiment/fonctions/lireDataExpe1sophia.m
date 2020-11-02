function [C_header,C_posCenter,Data] = lireDataExpe1sophia(filename)

%function that read a data.txt and give 5 vector, 3 positions 1 number of target and 1 condition done 

%% opening 
fileID = fopen(filename);  

%% header
formatSpec = '%s';
N = 16;
C_header = textscan(fileID,formatSpec,N,'Delimiter',';');

%% position of the centers
formatSpec = '%s';
N = 8;
C_posCenter = textscan(fileID,formatSpec,N,'Delimiter',';');

%% reading of the data in str
C = textscan(fileID, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s','Delimiter',';');

%% separation of the 6 column matrix in 6 vector column
% the strrep is used to replace (,) by (.) used in matlab
% Numéro de l'experience, numéro du participant, date en seconde
ExperimentID = str2double(C{1});

participantID = str2double(C{2});

datestr = strrep(C{3},',','.');
date = str2double(datestr);

% 3 vector position of the finger
PosXstr = strrep(C{4},',','.');
PosRx = str2double(PosXstr);

PosYstr = strrep(C{5},',','.');
PosRy = str2double(PosYstr);

PosZstr = strrep(C{6},',','.');
PosRz = str2double(PosZstr);

% 4 Quaternion that represent the orientation of the participant finger
QuaternionRotwstr = strrep(C{7},',','.');
QuaternionRotw = str2double(QuaternionRotwstr);

QuaternionRotxstr = strrep(C{8},',','.');
QuaternionRotx = str2double(QuaternionRotxstr);

QuaternionRotystr = strrep(C{9},',','.');
QuaternionRoty = str2double(QuaternionRotystr);

QuaternionRotzstr = strrep(C{10},',','.');
QuaternionRotz = str2double(QuaternionRotzstr);

% target number, condition number and aim number that help sort the data
targetNumber = str2double(C{11});

condition = str2double(C{12});

aim_number = str2double(C{13});
%time
time_elapsedstr = strrep(C{14},',','.');
time_elapsed = str2double(time_elapsedstr);
% 3 vector position of the target
PosTargetxstr = strrep(C{15},',','.');
PosTargetx = str2double(PosTargetxstr);

PosTargetystr = strrep(C{16},',','.');
PosTargety = str2double(PosTargetystr);

PosTargetzstr = strrep(C{17},',','.');
PosTargetz = str2double(PosTargetzstr);

fclose(fileID);

% concatenation
Data = [ExperimentID,participantID,date,PosRx,PosRy,PosRz,QuaternionRotw,QuaternionRotx,QuaternionRoty,QuaternionRotz,targetNumber,condition,aim_number,time_elapsed,PosTargetx,PosTargety,PosTargetz];
end