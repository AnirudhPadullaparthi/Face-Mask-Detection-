
load('Detector.mat');
i=1;
I=imread('C:\Program Files\MATLAB\with_mask_955.jpg');

results = struct('Boxes',[],'Scores',[]);

[bboxes, scores] = detect(detector,I)
%[~,idx] = max(scores);
results(i).Boxes = bboxes;
results(i).Scores = scores;
 if results(i).Scores>0
     str='Mask_Present';
     I=insertText(I, [300 1],  "Mask Present", 'FontSize', 35, 'BoxColor', 'g');
     annotation = sprintf(str ,detector.ModelName,scores);
    I = insertObjectAnnotation(I,'rectangle',bboxes,annotation);
 
 else
     results(i).Scores<=0
     str='No_Mask';
     I=insertText(I, [1 300],  "No Mask", 'FontSize', 35, 'BoxColor', 'r');
 end

results = struct2table(results);
imshow(I)