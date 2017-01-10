# Match row IDs in one file with Column IDs in another files to extract data pertaining only to file with required Column IDs. 
# Matching row with column instead of transposing data to match row with row.
# read in the index(Down) and the raw data(Across w/out transpose nor first column name)
Down <-read.delim("Down.csv",sep=",")

# header=FALSE prevents the loss or change of data.
Across <-read.delim("Across.csv", header=FALSE, sep=",")

# coerce to vectors
newAcross <- as.vector(Across)
newDown <- as.vector(Down)

# create a boolean table that finds what is wanted.
tryingData <- (Across[1,] %in% Down$StudyID)

# extract just the wanted from all data.
reducedBool <- Across[,tryingData]

# replace the Vn column names with nulls.
c1 = unname(reducedBool)

#save reduced file
write.csv(c1, file = "cl.csv")
