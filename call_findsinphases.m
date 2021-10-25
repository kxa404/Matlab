clc
clear
%gets data
dataDir = uigetdir(pwd,'find files');
    if exist('dataDir')~=1;
        dataDir = uigetdir(pwd,'findfiles'); 
    end
dataFiles=dir([dataDir,'/*.out']);

avg_phase=[];%can put phases, mean phases, vector strength (storage array)
Standarddev=[];
for i = 1:length(dataFiles)  
    fname = dataFiles(i).name; 
    sorteddata = importdata([dataDir,filesep,fname]); 
    speakt = sorteddata.data(:,1); %speakt (hpeakt) = spike times
    stimpeakt = sorteddata.data(:,3); %stimpeakt (wpeakt) = stimulus peak times
    phivalues = findsinphases(stimpeakt,speakt);%calls function
    avg_phase = [avg_phase circ_mean(phivalues')];%finds average phase
 % disp(sprintf(' The average phase of %s is %d',fname,avg_phase(i)));
    avg_deg = avg_phase*180/pi;%converts to degrees
    new_avgdeg=mod(avg_deg,360);%flips degrees from neg to pos
    S=std(phivalues);%finds standard deviation
    Standarddev=[Standarddev S];
    newSTD=Standarddev*180/pi;
end

figure 
xlabel('frequency (Hz)');
ylabel('phase(deg)');
hold on
set(gca,'ylim',[-50,500]);
errorbar(5:5:150,new_avgdeg,newSTD);
hold on
set(gca,'xtick',5:5:150)
hold on
