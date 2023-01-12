% FaceMaskdetect = selectLabels(gTruth,'Mask');
% 
% if isfolder(fullfile('TrainingData'))    
% cd TrainingData
% else 
% mkdir TrainingData
% end
% addpath('TrainingData');

 trainingData = objectDetectorTrainingData(FaceMaskdetect,'SamplingFactor',1,'writeLocation','TrainingData');
 detector = trainACFObjectDetector(trainingData,'NumStages',20);
 save('Detector.mat','detector');
 rmpath('TrainingData');