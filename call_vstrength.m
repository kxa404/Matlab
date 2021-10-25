clc
clear
%gets data
dataDir = uigetdir(pwd,'find files');
    if exist('dataDir')~=1;
        dataDir = uigetdir(pwd,'findfiles'); 
    end
dataFiles=dir([dataDir,'/*.out']);

vstrength=[]; 
for i:length(dataFiles)
    
    