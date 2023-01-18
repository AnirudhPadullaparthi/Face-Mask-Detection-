Face Mask Detection Steps :-

Step 1: Image labelling

Label the masked images from any dataset by using the image labeller present in the MATLAB. 

Step 2: Training

Once the labelling of the images is complete.You will have to train the ACFobject Detector. For training you will have to run the sample.m file. This will save the trained data to a new folder named TrainingData in the specified directory


Step 3:Testing

The testing of the project is done in 3 stages

1.Image testing

Run the Image.m file by giving any image as input and check the output. If the output for the image testing is wrong then it would mean that the training is not done properly and you would have to train the ACF Obejct Detector once again by deleting the  previous TrainingData folder.
Make sure to run the test for more than 10 images. Once the output is accurate. We move on to the video testing.

2. Video testing

Run the Video.m file by giving any video as input and check the output. The output is mostly accurate since we have an accurate image testing output. If the output for the image testing is wrong then it would mean that the training is not done properly and you would have to train the ACF Obejct Detector once again by deleting the  previous TrainingData folder.
Make sure to run the test for more than 3 videos. Once the output is accurate. We move on to the Webcam testing.

3. Live feed test

Run the Webcam.m file and MATLAB will output the live video feed from your webcam and tell whether there is mask or not.
