#Import the table into R
marks <- read.csv("C:/Users/Caine/Documents/ICT2_CNF/ICE262S/R_Elective/Results.csv"
                  ,header=TRUE
                  ,sep=","
                  ,row.names = 1)
marks

#Summary of statistics for all marks
summary(marks)

#Mean for appdev1
segmentedMarks <- split.data.frame(x=marks, f=c('CNF', 'ADF', 'BPR'))
segmentedMarks$ADF[1,5]
marksADF <- c(segmentedMarks$ADF[1,1], segmentedMarks$ADF[1,2]
              ,segmentedMarks$ADF[1,3]
              ,segmentedMarks$ADF[1,4]
              ,segmentedMarks$ADF[1,5])
marksADF
meanADF <- mean(marksADF)
meanADF

#Linear regression
marks <- read.csv("C:/Users/Caine/Documents/ICT2_CNF/ICE262S/R_Elective/Results.csv"
                  ,header=TRUE
                  ,sep=","
                  ,stringsAsFactors = FALSE)
warmMarks <- melt(marks, id.vars = 'SubjectName')
head(warmMarks)

linearMod <- lm(variable ~ value, data=warmMarks)

#Histogram for term 5
marks <- read.csv("C:/Users/Caine/Documents/ICT2_CNF/ICE262S/R_Elective/Results.csv"
                  ,header=TRUE
                  ,sep=","
                  ,row.names = 1)
marksT5 <- marks$Term5
marksT5
hist(marksT5, main='Term 5 Marks'
     , col='black'
     , border='white'
     , xlab = 'Subjects')

#Create a boxplot for term 3
boxplot(marks$Term3)

#Use ggplot function to display a graph with all results for first year
ggplot(warmMarks, aes(variable, value, color=SubjectName))+geom_point(size=2)
