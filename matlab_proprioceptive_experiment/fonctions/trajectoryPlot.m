function [PosxReelHand,PoszReelHand] = trajectoryPlot(filenamePosition,DateLog)



% Positionx,Positionz,PosTargetX,PosTargetY,



%% lire the data from the file

format long;
fileID = fopen(filenamePosition);  
C = textscan(fileID, '%s %s %s %s %s %s %s %s %s %s %s %s','Delimiter',';');




ExperimentID = str2double(C{1});

participantID = str2double(C{2});



PosxReelHandstr = strrep(C{3},',','.');
PosxReelHand = str2double(PosxReelHandstr);

PosyReelHandstr = strrep(C{4},',','.');
PosyReelHand = str2double(PosyReelHandstr);

datestr = strrep(C{5},',','.');
date = str2double(datestr);
date2 = C{5};
PoszReelHandstr = strrep(C{6},',','.');
PoszReelHand = str2double(PoszReelHandstr);

timestr = strrep(C{7},',','.'); 
time = str2double(timestr);


PosxVirtualHandstr = strrep(C{8},',','.');
PosxVirtualHand = str2double(PosxVirtualHandstr);

PosyVirtualHandstr = strrep(C{9},',','.');
PosyVirtualHand = str2double(PosyVirtualHandstr);

PoszVirtualHandstr = strrep(C{10},',','.');
PoszVirtualHand = str2double(PoszVirtualHandstr);

first_experiment = C{11};

second_experiment = C{12};


%% associating positionpoint to a target and a final point
PosTrajX = [];
PosTrajY = [];
for i = 1:1:length(DateLog)-1
    I = find(date > DateLog(i) & date < DateLog(i+1));
    PosTrajXi = PosxVirtualHand(I);
    PosTrajYi = PosyVirtualHand(I);
    PosTrajX = [PosTrajX;PosTrajXi];
    PosTrajY = [PosTrajY;PosTrajYi];
    
end



