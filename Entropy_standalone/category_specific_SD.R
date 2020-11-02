#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

inputfilename = args[1]
outputfilename = args[2]
fillNA = as.logical(args[3])

rnaseqdata <- read.csv(inputfilename, header=T, stringsAsFactors = F)
rnaseqdata['X'] <- NULL

rnaseqdata['Category1'][is.na(rnaseqdata['Category1'])] <- 'Unknown'
rnaseqdata_numeric <- rnaseqdata[,c(19:ncol(rnaseqdata))]
rnaseqdata_numeric <-  sapply(rnaseqdata_numeric, as.numeric)

if (fillNA == T){
  rnaseqdata_numeric[is.na(rnaseqdata_numeric)] <- 0
}

catSD <- aggregate(x=rnaseqdata_numeric, by=rnaseqdata['Category1'], FUN = sd)

write.csv(catSD, outputfilename, quote=T, row.names = F)