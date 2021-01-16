# CollapseDataset (v2.0.x)

Gene Set Enrichment Analysis

**Author:** Aravind Subramanian, Pablo Tamayo, David Eby; Broad
Institute

**Contact:**

gp-help@broadinstitute.org
http://software.broadinstitute.org/cancer/software/genepattern/contact

## Description

Collapses all probe set values for a gene into a single vector of values

## Summary

CollapseDataset creates a new data set by collapsing all probe set expression values for
a given gene into a single expression value. It does this for all probe sets in the original
data set. You can choose the method of determining which value will represent all
probes in a probe set for a given gene: the maximum expression value for the probe set
or the median. The new data set uses gene symbols as the gene identifier format.
Collapsing the probe sets eliminates multiple probes, which can inflate gene set
enrichment scores, and facilitates the biological interpretation of the gene set enrichment
analysis results.

## References

This version of the module is based on the GSEA v4.1.x code base. See the 
[GSEA Website](https://www.gsea-msigdb.org/gsea/) for more details.

## Parameters 
<span style="color:red;">*</span> - _required_

1\. dataset file <span style="color:red;">*</span>

This is a file in either [GCT](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GCT:_Gene_Cluster_Text_file_format_.28.2A.gct.29")
or [RES](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#RES:_ExpRESsion_.28with_P_and_A_calls.29_file_format_.28.2A.res.29)
format that contains the expression dataset.
[GSEA-specific TXT format](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#TXT:_Text_file_format_for_expression_dataset_.28.2A.txt.29) files are also accepted.

2\. chip platform <span style="color:red;">*</span>

This drop-down allows you to specify the chip annotation file, which lists each probe on a chip
and its matching HUGO gene symbol, used for the expression array.  The chip files listed here
are from the [GSEA website](https://www.gsea-msigdb.org/gsea/downloads.jsp).  If you used a file
not listed here, you will need to provide it 
(in [CHIP](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#CHIP:_Chip_file_format_.28.2A.chip.29) format) 
using 'Upload your own file'

Please see the [MSigDB 7.0 Release Notes](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/MSigDB_v7.0_Release_Notes)
for information about symbol remapping.

3\. collapse mode <span style="color:red;">*</span>

Collapsing mode for sets of multiple probes for a single gene. Selects the expression values to
use for the single probe that will represent all probe sets for the gene. Options are:
- Max_probe (default): For each sample, use the maximum expression value for the probe set.  That is, if there are three probes that map to a single gene, the expression value that will represent the collapsed probe set will be the maximum expression value from those three probes.
- Median_of_probes: For each sample, use the median expression value for the probe set.
- Mean_of_probes: For each sample, use the mean expression value for the probe set.
- Sum_of_probes: For each sample, sum all the expression values of the probe set.
- Remap_only: Remap symbols from one namespace to another without collapsing (an error will occur if multiple source genes map to a single destination gene).

4\. omit features with no symbol match <span style="color:red;">*</span>

By default (*true*), the new dataset excludes probes/genes that have no gene symbols. Set 
to *false* to have the new dataset contain all probes/genes that were in the original dataset.


## Input Files

1\. *dataset file:* 

This file contains the expression dataset in [GCT](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GCT:_Gene_Cluster_Text_file_format_.28.2A.gct.29") 
or [RES](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#RES:_ExpRESsion_.28with_P_and_A_calls.29_file_format_.28.2A.res.29) format that contains the 
expression dataset.  
[GSEA-specific TXT format](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#TXT:_Text_file_format_for_expression_dataset_.28.2A.txt.29) files are also accepted.

2\. *chip platform:* 

This file defines symbol-to-gene mappings for a platform, possibly along with annotations, in 
[CHIP](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#CHIP:_Chip_file_format_.28.2A.chip.29) format.
The drop-down provides files from the [MSigDB project](https://www.gsea-msigdb.org) for common platforms, but custom files may also be provided.

## Output Files

1\. The collapsed data set (GCT)

After collapsing, the resulting files are always produced in GCT format even if they had a different input format. 

### Known Issues

Input expression datasets with the spaces in their file names may cause errors.

## Platform Dependencies

**Task Type:**  
Gene List Selection

**CPU Type:**  
any

**Operating System:**  
any

**Language:**  
Java

## Version Comments

|Version|Release Date|Description|
|  :--  |     :--    |   :--     |
|2.0.0  |2021-01-14  |Switched to the GSEA code base.  Added new collapse.mode options and omit.features.with.no.symbol.match parameter.|


Copyright © 2003-2021 Broad Institute, Inc., Massachusetts Institute of
Technology, and Regents of the University of California. All rights
reserved.

