function [C_header,Data,String] = lireDataPosition(filename)

%function that read a data.txt and give 5 vector, 3 positions 1 number of target and 1 condition done 

%% opening 
fileID = fopen(filename);  

%% position of the centers

%% header
formatSpec = '%s';
N = 19;
C_header = textscan(fileID,formatSpec,N,'Delimiter',';');
%% reading of the data in str
C = textscan(fileID, '%s %s %s %s %s %s %s %s %s %s %s %s %s','Delimiter',';');
ExperimentID = str2double(C{1});

participantID = str2double(C{2});

posHandReelXstr = strrep(C{3},',','.');
posHandReelX = str2double(posHandReelXstr);

posHandReelYstr = strrep(C{4},',','.');
posHandReelY = str2double(posHandReelYstr);

TimeSinceBeginningstr = strrep(C{5},',','.');
TimeSinceBeginning = str2double(TimeSinceBeginningstr);


posHandReelZstr = strrep(C{6},',','.');
posHandReelZ = str2double(posHandReelZstr);

TimeSinceStartstr = strrep(C{7},',','.');
TimeSinceStart = str2double(TimeSinceStartstr);

posVirtualHandXstr = strrep(C{8},',','.');
posVirtualHandX = str2double(posVirtualHandXstr);

posVirtualHandYstr = strrep(C{9},',','.');
posVirtualHandY = str2double(posVirtualHandYstr);

posVirtualHandZstr = strrep(C{10},',','.');
posVirtualHandZ = str2double(posVirtualHandZstr);

FirstExperiment = C{11};
SecondExperiment = C{12};
TargetHold = C{13};

Data = [ExperimentID,participantID,posHandReelX,posHandReelY,TimeSinceBeginning,posHandReelZ,TimeSinceStart,posVirtualHandX,posVirtualHandY,posVirtualHandZ];
String = [FirstExperiment,SecondExperiment,TargetHold];




