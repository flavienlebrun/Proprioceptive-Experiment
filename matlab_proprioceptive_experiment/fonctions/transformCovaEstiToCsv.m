COVABeste = load('Data/COVAESTIFull','COVABest');
COVABesteAme = load('Data/COVAESTISAmelio','CovaBeste');
covaesti =COVABeste.COVABest;
covaamelio = COVABesteAme.CovaBeste; 

%% export data to CSV
cHeader = {'cova1'}

for i=2:1:42
    covaName = strcat('cova',i);
    cHeader = {cHeader{1,:} covaName};
end
commaHeader = [cHeader;repmat({','},1,numel(cHeader))]; %insert commaas
commaHeader = commaHeader(:)';
textHeader = cell2mat(commaHeader); %cHeader in text with commas
textHeader = textHeader(1:end-1);%delet the last comma of the header


%write header to file
fid = fopen('Data1stExpTraitees.csv','w'); 
fprintf(fid,'%s\n',textHeader)
fclose(fid)
%write data to end of file
writematrix(covaesti,'Data1stExpTraitees.csv')
% cswwrite("DataToFit",