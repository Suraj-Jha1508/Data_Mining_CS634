# Data_Mining_CS634
This Repository contain all Assignments and Projects, i completed during my Data Mining Course at NJIT

# Assignment 1:

In this exercise, we will look at descriptive statistics and how to explore and summarize data sets. For this, we use the Heart Disease dataset from the UCI data repository. This dataset consists of 4 small datasets of people with heart disease admitted to 4 hospitals.

For now, we only work with the file processed.cleveland.data (attached) , this data consists of 271 instances with 7 attributes. The attributes are described as below:

Age: age in years
sex: 1 = male; 0 = female
cp: chest pain type
Value 1: typical angina
Value 2: atypical angina
Value 3: non-anginal pain
Value 4: asymptomatic
Trestbps: resting blood pressure
Chol: cholesterol level
Thalach: maximum heart rate achieved
heart_problem: 1= have heart problem; 0=No heart problem
 

Instruction: Use R-studio to do the work.

Using the attached data, answer the following questions:

1. How many patients have heart disease? (0.5)

2. What is the average Cholesterol level of people with heart disease and without heart disease? What is the standard deviation? (1)

3. What is the median and average age of people with cholesterol higher than 240.0, higher than 240.0 with heart disease, higher than 240.0 without heart disease? (1.5)

4. Create a histogram of resting blood pressure. (1)

5. Create boxplots based on the sex of the patients for the following attributes:
  1. cholesterol level (1.5)
  2. maximum heart rate achieved (1.5)

6. For each Box plot, answer the following questions:
  1. What is the H-Spread (Q3-Q1) of cholesterol level for male and females? (0.5)
  2. What are the Lower Hinge and Upper Hinge values for maximum heart rate for male and female? (0.5)

7. In order to find if two attributes are related and their values change together, we can use Scatter plot. Follow the instruction below and answer the questions:
  1. Create two scatter plots of age and resting blood pressure for people with heart disease and without heart disease. Is there any visual correlation? (1+1)
  2. Calculate the average resting blood pressure of each age (HINT : Use Group by for age) for people with heart disease.  Calculate the average resting blood pressure of each age (HINT : Use Group by for age) for people without heart disease. (1)
  3. Now create two scatter plots using the previous results. Do you see a pattern now? Do people without heart disease have higher blood pressure as they age than people with heart disease? (1)

8. Compare the resting blood pressure of people with heart disease and without. (1)

# Assignment 2:


Use the following  car evaluation dataset (http://archive.ics.uci.edu/ml/datasets/Car+Evaluation) to answer the following questions.

1. Find the set of cars that have the highest similarity with each other.(2)

2. Find the set of cars that have the highest dissimilarity with each other. (2)

3. Find the two categorical attributes that have the highest positive/negative correlation. Draw a scatter plot of these two attributes. Analyze the correlation using the following significance levels:

0.01, 0.05, 0.001 (5)

4. Present the dissimilarity matrix for the very good cars.  (3)

Please submit.

1. Your R-code ( as an R-script)

3. Output and a documentation describing your solution. (as a single pdf)

# Assignment 3:

The data set Preview the document contains plant lists from 246 nemoral forests in the Southern Finland. All 206 attributes are plant species. The data is confidental, and therefore the species corresponding to number codes and cannot be revealed.

1. Find out the pattern of all plant species (i.e., ids) in the forests with support  threshold = 50%

(3)

2. Find out the max-frequent-plant species with the same support threshold.(2)

3. With a confidence threshold of 70% (and support threshold 40%), find out all strong association rules.

(3)

# Assignment 4:

This data studies student achievement in secondary education of two Portuguese schools. The data attributes include student grades, demographic, social and school related features) and it was collected by using school reports and questionnaires. The dataset contains students performance in Mathematics and final grade (G3).

Important note: the target attribute G3 has a strong correlation with attributes G2 and G1. This occurs because G3 is the final year grade (issued at the 3rd period), while G1 and G2 correspond to the 1st and 2nd period grades.

 

Here is the description of the attributes:

1. school - student's school (binary: 'GP' - Gabriel Pereira or 'MS' - Mousinho da Silveira)
2. sex - student's sex (binary: 'F' - female or 'M' - male)
3. age - student's age (numeric: from 15 to 22)
4. address - student's home address type (binary: 'U' - urban or 'R' - rural)
5. famsize - family size (binary: 'LE3' - less or equal to 3 or 'GT3' - greater than 3)
6. Pstatus - parent's cohabitation status (binary: 'T' - living together or 'A' - apart)
7. Medu - mother's education (numeric: 0 - none, 1 - primary education (4th grade), 2 â€“ 5th to 9th grade, 3 â€“ secondary education or 4 â€“ higher education)
8. Fedu - father's education (numeric: 0 - none, 1 - primary education (4th grade), 2 â€“ 5th to 9th grade, 3 â€“ secondary education or 4 â€“ higher education)
9. Mjob - mother's job (nominal: 'teacher', 'health' care related, civil 'services' (e.g. administrative or police), 'at_home' or 'other')
10. Fjob - father's job (nominal: 'teacher', 'health' care related, civil 'services' (e.g. administrative or police), 'at_home' or 'other')
11. reason - reason to choose this school (nominal: close to 'home', school 'reputation', 'course' preference or 'other')
12. guardian - student's guardian (nominal: 'mother', 'father' or 'other')
13. traveltime - home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)
14. studytime - weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)
15. failures - number of past class failures (numeric: n if 1<=n<3, else 4)
16. schoolsup - extra educational support (binary: yes or no)
17. famsup - family educational support (binary: yes or no)
18. paid - extra paid classes within the course subject (Math or Portuguese) (binary: yes or no)
19. activities - extra-curricular activities (binary: yes or no)
20. nursery - attended nursery school (binary: yes or no)
21. higher - wants to take higher education (binary: yes or no)
22. internet - Internet access at home (binary: yes or no)
23. romantic - with a romantic relationship (binary: yes or no)
24. famrel - quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
25. freetime - free time after school (numeric: from 1 - very low to 5 - very high)
26. goout - going out with friends (numeric: from 1 - very low to 5 - very high)
27. Dalc - workday alcohol consumption (numeric: from 1 - very low to 5 - very high)
28. Walc - weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)
29. health - current health status (numeric: from 1 - very bad to 5 - very good)
30. absences - number of school absences (numeric: from 0 to 93)

# these grades are related with the course subject Math:
31 G1 - first period grade (numeric: from 0 to 20)
31 G2 - second period grade (numeric: from 0 to 20)
32 G3 - final grade (numeric: from 0 to 20, output target)

 

Problems:

1. Build two classification models, one based on decision tree, other based on Naive Bayes' classifier that predicts if a student will pass or fail given the independent variables (student gets a failing grade if G3 <10).

Perform 70-30 holdout and present precision, recall, and accuracy of these two models. Which model has better predictive capability?  (6+6)=12

