load('Detector.mat');

camera=webcam;
vidPlayer = vision.DeployableVideoPlayer;
i = 1;
while true
    I = camera.snapshot;
    [bboxes, scores] = detect(detector,I)
    results = struct('Boxes',[],'Scores',[]);
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
     I=insertText(I, [1, 300],  "No Mask", 'FontSize', 35, 'BoxColor', 'r');
     annotation = sprintf(str ,detector.ModelName,scores);
 end
 step(vidPlayer,I);
i =i+1;

end
results = struct2table(results);