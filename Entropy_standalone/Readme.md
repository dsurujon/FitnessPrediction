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
