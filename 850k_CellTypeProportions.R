# R script to count cell proportions using ChAMP package, compatible with R-3.3.0 and above.

#important required R packages
require(minfi)
require(ChAMPdata)
require(ChAMP)

#read methylation dataset
mybeta<-load("beta_raw.Rdata")

#Remove missing values
mybeta<-na.omit(beta)

#champ.refbase() returns cell-type specific propotions, can specify methylation array type by using argument- arraytype="850k"
counts<-champ.refbase(beta=mybeta)

#Cellfraction of CHAMP package gives proportions for each cell type
estCellCount<- counts$CellFraction

#Combine IDs with data
Sample_Name<-read.delim("EPIC_sample_Name.csv", sep=",")
rownames(Sample_Name)<-Sample_Name[,2]
EPIC_counts<-cbind(Sample_Name,estCellCount)

#save cell counts
write.csv(EPIC_counts, file="cell_proportions_EPIC.csv", row.names=FALSE)
 
