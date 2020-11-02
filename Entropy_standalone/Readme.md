## Computing entropy for a set of DEseq2 output files

General usage: 
```
Rscript entropy.R [inputdirectory] [outputfilename]
```

The script `entropy.R` takes in 2 arguments, an input directory and the name of an output file. It reads all `.csv` files within the input directory, computes transcriptomic entropy for each file, and generates a summary table including the filename and entropy value for each file in the input directory.     

Say the RNA-Seq results are in the directory `/store/data/ExpOut/200813_NS500751_0168_AH5FYGBGXF/Out/Rep/Charts`, and we want to produce an output summary table `/store/home/surujon/RNAseq/aerobio_0168_entropy.csv`, the command would be: 

```
Rscript entropy.R /store/data/ExpOut/200813_NS500751_0168_AH5FYGBGXF/Out/Rep/Charts /store/home/surujon/RNAseq/aerobio_0168_entropy.csv
```

**Make sure that the only csv files in the input directory are DEseq2 output!**


## Computing category-specific standard deviation (as a surrogate for entropy)
General usage:
```
Rscript category_specific_SD.R [inputfile] [outputfile] [fill NA (T/F)]
```

The script `category_specific_SD.R` takes 3 arguments: 
* `inputfile`: csv file with annotation and RNAseq data. The first 18 columns MUST be the annotation, and the remaining columns must be the differential expression data (one column per experiment). Each row is a gene. 
* `outputfile`: csv file name for the output. For each category (rows) the SD of Differential expression in each experiment (columns) is reported. 
* `fill NA`: True or False. If True, missing (or NA) values will be replaced with 0 (i.e. no differential expression)
