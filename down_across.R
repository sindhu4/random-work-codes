# Match row IDs in one file with Column IDs in another file to extract data pertaining only to files with required Column IDs. 
# Due to data files of extreme size, match rows with columns without transposing data to avoid data loss.

# read in the index(Down) and the raw data(Across)
Down <-read.delim("Down.csv",sep=",")

# header=FALSE prevents the loss or change of data.
Across <-read.delim("Across.csv", header=FALSE, sep=",")

# coerce to vectors
newDown <- as.vector(Down)
newAcross <- as.vector(Across)

# create a boolean table that finds what is wanted(TRUE indicates wanted).
testData <- (Across[1,] %in% Down$StudyID)

# extract just the wanted from all data.
reducedbool <- Across[,testData]

# replace the Vn column names with nulls.
reducedData = unname(reducedbool)

#save reduced file
write.csv(reducedData, file = "reducedData.csv")
