clc
clear

dataDir = uigetdir(pwd,'find files');
if exist('dataDir')~=1; 
    dataDir = uigetdir(pwd,'findfiles'); 
end
dataFiles=dir([dataDir,'/711cell3_a_b_005Data.out']);

%711cell3_a_b_005Data

storagearray = [] ;%can put phases, mean phases, vector strength
structData = [];
avg_phase = [];
filenames= [];
for i = 1:length(dataFiles)  
    fname = dataFiles(i).name;
    fname2= convertCharsToStrings(fname);
    filenames=[filenames fname2];
    fname3=convertStringsToChars(filenames);
    sorteddata = importdata([dataDir,filesep,fname]); 
    speakt = sorteddata.data(:,1); %speakt (hpeakt) = spike times
    stimpeakt = sorteddata.data(:,3); %stimpeakt (wpeakt) = stimulus peak times
    [phivalues] = find1phase(stimpeakt,speakt);
    avg_phase = [avg_phase circ_mean(phivalues'*pi/100)];
    structData = [structData sorteddata];
end

meanavgphase = mean(avg_phase)
catgname=categorical(filenames)
bar(avg_phase,filenames)

% [phivalues] = find1phase(stimpeakt,speakt)%calls function

 %does this convert from deg to radian?
    avg_deg = avg_phase*180/pi
    if avg_deg < 0, avg_deg = avg_deg + 360; end
    storagearray = [storagearray avg_deg];
    disp([fname(1:10), 'Avg phase = ',num2str(avg_deg)]);


