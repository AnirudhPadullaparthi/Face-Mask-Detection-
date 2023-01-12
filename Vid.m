load('Detector.mat');

vidReader = VideoReader('C:\Program Files\MATLAB\Vid.mp4');


% VideoReader is for reading Video

vidPlayer = vision.DeployableVideoPlayer;
i = 1;
results = struct('Boxes',[],'Scores',[]);
while(hasFrame(vidReader))
I = readFrame(vidReader);
[bboxes, scores] = detect(detector,I);
%[~,idx] = max(scores);
results(i).Boxes = bboxes;
results(i).Scores = scores;
 if results(i).Scores>0
     str='Mask_Present';
     I=insertText(I, [300, 1],  "Mask Present", 'FontSize', 35, 'BoxColor', 'g');
     annotation = sprintf(str ,detector.ModelName,scores);
    I = insertObjectAnnotation(I,'rectangle',bboxes,annotation);
 else 
     str='No_Mask';
     I=insertText(I, [300, 1],  "No Mask", 'FontSize', 35, 'BoxColor', 'r');
 end
 step(vidPlayer,I);
i =i+1;
end
results = struct2table(results);