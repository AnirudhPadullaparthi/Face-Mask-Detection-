# Face-Mask-Detection-
Face Mask Detection using ACF Object Detector in MATLAB
% Face Mask Detection Steps :-
% 1.Image labelling
Any Dataset on Kaggle or online to train the images

Label the masked images from any dataset by using the image labeller present in the matlab. 

% 2.Training

% 3.Testing

load('FaceMaskdataset.mat');  
%  1. Load labelled data file ,which created through image labelling

FaceMaskdetect = selectLabels(gTruth,'Mask');

% 2. Creating Variable FaceGtruth in which will store labels 'Face'

if isfolder(fullfile('TrainingData'))    
cd TrainingData
else 
mkdir TrainingData
end
addpath('TrainingData');

% 3. if else condition, if means 'if full name TrainingData exist ,locate that file ' else here if TrainingData Files doesnt exits Make one and 
%         it to the MATLAB Path

trainingData = objectDetectorTrainingData(FaceMaskdetect,,1,'writeLocation','TrainingData');

% Make variable trainingData in which will store and passing Parameters like FaceGtruth that is labels , Sampling factor means Examples Face images
% if sampling factor is 2 than 2times negative images taken, Writing location = as TrainingData Folder

detector = trainACFObjectDetector(trainingData,'NumStages',20);

% detector is variable storing data of ACF Object Detector Neural network , Numstages= Number of Training stages,
% More stages like 10,20 takes long time to train but with higher Accuracy

save('Detector.mat','detector');

% saving Detector file , so once ACF detector trained ,it can be used to detect Faces 
rmpath('TrainingData');
% Saving detector file in TrainingData Folder  
% Upto this 13 lines of Code , It needs to run Only Once .
% once we have save Our Neural Network 'Detector.mat' file which detects faces . one Have saved in TrainingData folder ,
% So to use it whenever we just need to load it by specfying  its path 

load('Detector.mat');
Load Detector file , it is Pretrained Neural network for face detection
vidReader = VideoReader('wearingmask.mp4');

% VideoReader is for reading Video

vidPlayer = vision.DeployableVideoPlayer;
i = 1;
results = struct('Boxes',[],'Scores',[]);
while(hasFrame(vidReader))
I = readFrame(vidReader);
[bboxes, scores] = detect(detector,I);
[~,idx] = max(scores);
results(i).Boxes = bboxes;
results(i).Scores = scores;
annotation = sprintf('MASK' ,detector.ModelName,scores(idx));
I = insertObjectAnnotation(I,'rectangle',bboxes(idx,:),annotation);
step(vidPlayer,I);
i =i+1;
end
results = struct2table(results);

####### Alternative #########

Step 1: train the datasets.

Step 2: 

RUN-1::::
FaceMaskdetect = selectLabels(gTruth,'Mask');


RUN-2::::
if isfolder(fullfile('TrainingData'))    
cd TrainingData
else 
mkdir TrainingData
end
addpath('TrainingData');

RUN3:::::
trainingData = objectDetectorTrainingData(FaceMaskdetect,'SamplingFactor',1,'writeLocation','TrainingData');
detector = trainACFObjectDetector(trainingData,'NumStages',8);
save('Detector.mat','detector');
rmpath('TrainingData');


Half job is completed>>>....



Now new file.

STEP3::
load('Detector.mat'); 
%%u can also give the whole path like load('E://akshay/project/major/Detector.mat')


I=imread('E:\New folder\Akshay\MINI AND MAJOR Project\kcrn.jpg');

results = struct('Boxes',[],'Scores',[]);

[bboxes, scores] = detect(detector…
