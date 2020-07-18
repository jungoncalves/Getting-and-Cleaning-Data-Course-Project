## CodeBook - UCI HAR Dataset
=================

### Data description

- Recordings fo 30 volunteers (19-48 years)
- Each subject performed 6 activities wearing a smartphone:
	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING
- 562 signals:
	- 3-axial raw signals from a accelerometer and a gyroscope from the smartphone 
	- Estimated variables from the signals:
		- mean(): Mean value
		- std(): Standard deviation
		- mad(): Median absolute deviation 
		- max(): Largest value in array
		- min(): Smallest value in array
		- sma(): Signal magnitude area
		- energy(): Energy measure. Sum of the squares divided by the number of values. 
		- iqr(): Interquartile range 
		- entropy(): Signal entropy
		- arCoeff(): Autorregresion coefficients with Burg order equal to 4
		- correlation(): correlation coefficient between two signals
		- maxInds(): index of the frequency component with largest magnitude
		- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
		- skewness(): skewness of the frequency domain signal 
		- kurtosis(): kurtosis of the frequency domain signal 
		- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window
		- angle(): Angle between to vectors
	- Gravity acceleration signals
	- Jerk signals
	- Magnitude
	- Frequency domain signals

### Transformations 
- Labeled the data set with descriptive variable names (WALKING, WALKING_UPSTAIRS, ... )
- Created a new tidy data set with the average of each variable for each activity and each subject.
