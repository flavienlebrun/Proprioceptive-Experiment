function [C_header,Data] = lireDataExpe2(filename)
%function that read a data.txt and give 5 vector, 3 positions 1 number of target and 1 condition done 

%% opening 
fileID = fopen(filename);  
%% header
formatSpec = '%s';
N = 11;
C_header = textscan(fileID,formatSpec,N,'Delimiter',';');

%% reading of the data in str
C = textscan(fileID, '%s %s %s %s %s %s %s %s %s %s %s','Delimiter',';');
ExperimentID = str2double(C{1});

participantID = str2double(C{2});

datestr = strrep(C{3},',','.');
date = str2double(datestr);

%% reading the numerical data
choice = str2double(C{4});

angleOffsetstr = strrep(C{5},',','.');
angleOffset = str2double(angleOffsetstr);

target_number = str2double(C{6});

number_of_try = str2double(C{7});

timesincethebeginningstr = strrep(C{8},',','.');
time_since_the_beginning = str2double(timesincethebeginningstr);

time_Beginning_reachstr = strrep(C{9},',','.');
time_Beginning_reach = str2double(time_Beginning_reachstr);

time_Touching_Targetstr = strrep(C{10},',','.');
time_Touching_Target = str2double(time_Touching_Targetstr);

time_back_startingstr = strrep(C{11},',','.');
time_back_starting = str2double(time_back_startingstr);

fclose(fileID);

% concatenation
Data = [ExperimentID,participantID,date,choice,angleOffset,target_number,number_of_try,time_since_the_beginning,time_Beginning_reach,time_Touching_Target,time_back_starting];

%% export the data to a .csv file
FileCsvName = filename(1:end-4);
FileCsvName = strcat(FileCsvName,'.csv');
writematrix(Data,FileCsvName);