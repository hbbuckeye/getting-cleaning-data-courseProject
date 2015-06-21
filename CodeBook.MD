## Experimental Design and Data Collection

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

## Attributes Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Code Break-down

* The text files include x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt, acitivty_labels.txt, and features.txt
* The files are read using read.table and stored in the coresponding names (lines 7-14 of the code)
* The similar datasets are bound together using rbin (lines 17 - 19)
* Use regular expression to extract the names that contain mean and std by grep function (line 24)
* Use indices from the grep function to subset xdata (line 27)
* Assign activity name to each value in ydata (line 37)
* Assign colum names to activities column
* Name subject data column (line 48)
* Bind all the data by using cbind function (line 52)
* Create a second, independent tidy data set with the average of each variable for each activity and each subject using ddply (line 59)
* Write the tidy data to a txt file (line 61)
