function [Data] = lire_data(filename)
%function that read a data.txt and give 5 vector, 3 positions 1 number of target and 1 condition done 

%% opening and reading of the data in str
fileID = fopen(filename);  
C = textscan(fileID, '%s %s %s %s %s %s %s','Delimiter',';');


%% separation of the 6 column matrix in 6 vector column
% the strrep is used to replace (,) by (.) used in matlab

% 3 vector position
PosXstr = strrep(C{1},',','.');
PosX = str2double(PosXstr);

PosYstr = strrep(C{2},',','.');
PosY = str2double(PosYstr);

PosZstr = strrep(C{3},',','.');
PosZ = str2double(PosZstr);

% 2 vector number of the target aimed and condition of the try
Target = str2double(C{4});

Condition = str2double(C{5});

Aiming_number = str2double(C{6});
fclose(fileID);

% concatenation
Data = [PosX PosY PosZ Target Condition];