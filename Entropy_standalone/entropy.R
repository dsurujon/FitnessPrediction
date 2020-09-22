#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

inputdir = args[1]
myfiles <- list.files(inputdir, pattern = "\\.csv$")

H_df <- data.frame('File'=myfiles, 'Entropy'=NA)

for (i in c(1:length(myfiles))){
  file <- myfiles[i]
  fullfilename <- file.path(inputdir, file)
  RNAseq <- read.csv(fullfilename, header = T, stringsAsFactors = F)
  RNAseq$log2FoldChange<- as.numeric(as.character(RNAseq$log2FoldChange))
  H_df$Entropy[i] <- log(2*pi*exp(1)*var(RNAseq$log2FoldChange, na.rm=T))
}

outfilename <- args[2]
write.csv(H_df, outfilename)
