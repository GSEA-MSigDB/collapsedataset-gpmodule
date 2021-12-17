# CollapseDataset (v2.1.x)

**Author:** Aravind Subramanian, Pablo Tamayo, David Eby; Broad
Institute

**Contact:**

- gp-help@broadinstitute.org
- [http://software.broadinstitute.org/cancer/software/genepattern/contact](http://software.broadinstitute.org/cancer/software/genepattern/contact)

## Description

Collapses expression values from multiple input ids that map to a single target gene to a single value on a per-sample basis.

## Summary

CollapseDataset utilizes Probe Set ID to Gene Symbol mappings from a CHIP file to create 
a new data set where all probe set expression values for a given gene have been collapsed 
into a single expression value for each sample. It does this for all probe sets in the 
original data set. You can choose the method of determining which value will represent all 
probes in a probe set for a given gene: the maximum expression value for the probe set, the 
median value, or the sum of all values. The new data set uses gene symbols as the gene 
identifier format. Collapsing the probe sets eliminates multiple probes, which can inflate 
gene set enrichment scores, and facilitates the biological interpretation of the gene set 
enrichment analysis results.

## References

This version of the module is based on the GSEA v4.2.x code base. See the 
[GSEA Website](https://www.gsea-msigdb.org/gsea/) for more details.

## Parameters 
<span style="color:red;">*</span> - _required_

1. *dataset file* <span style="color:red;">*</span>:  This is a file in either 
 [GCT](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GCT:_Gene_Cluster_Text_file_format_.28.2A.gct.29")
 or [RES](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#RES:_ExpRESsion_.28with_P_and_A_calls.29_file_format_.28.2A.res.29)
 format that contains the expression dataset.
 [GSEA-specific TXT format](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#TXT:_Text_file_format_for_expression_dataset_.28.2A.txt.29) files are also accepted.
2. *chip platform* <span style="color:red;">*</span>: This drop-down allows you to specify 
 the chip annotation file, which lists each probe on a chip and its matching HUGO gene symbol, 
 used for the expression array.  The chip files listed here are from the 
 [GSEA website](https://www.gsea-msigdb.org/gsea/downloads.jsp).  If you used a file not listed 
 here, you will need to provide it 
 (in [CHIP](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#CHIP:_Chip_file_format_.28.2A.chip.29) format) 
 using 'Upload your own file'.  Please see the [MSigDB 7.0 Release Notes](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/MSigDB_v7.0_Release_Notes)
 for information about symbol remapping.
3. *collapse mode* <span style="color:red;">*</span>: Collapsing mode for sets of multiple probes for a single gene. Selects the expression values to use for the single probe that will represent all probe sets for the gene. Options are:
   - Max_probe (default): For each sample, use the maximum expression value for the probe set.  That is, if there are three probes that map to a single gene, the expression value that will represent the collapsed probe set will be the maximum expression value from those three probes.
   - Median_of_probes: For each sample, use the median expression value for the probe set.
   - Mean_of_probes: For each sample, use the mean expression value for the probe set.
   - Sum_of_probes: For each sample, sum all the expression values of the probe set.
   - Abs_max_of_probes: For each sample, use the expression value for the probe set with the maximum **absolute value**.  Note that each value retains its original sign but is chosen based on absolute value.
     In other words, the largest magnitude value is used.  While this method is useful with computational-based input datasets it is generally **not recommended** for use with quantification-based expression 
     measures such as counts or microarray fluorescence.
   - Remap_only: Remap symbols from one namespace to another without collapsing (an error will occur if multiple source genes map to a single destination gene).

## Advanced Parameters 

4. *output.file.name*:
 Optionally, rename the result file to a user-supplied name.  By default, this will be &lt;dataset.file_basename&gt;_collapsed (for any of the collapsing modes) or 
 &lt;dataset.file_basename&gt;_remapped (for Remap_only). 

5. *omit features with no symbol match*: 
 By default (*true*), the new dataset excludes probes/genes that have no gene symbols. Set to *false* 
 to have the new dataset contain all probes/genes that were in the original dataset.


## Input Files

1. *dataset file:*  This file contains the expression dataset in [GCT](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GCT:_Gene_Cluster_Text_file_format_.28.2A.gct.29") 
or [RES](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#RES:_ExpRESsion_.28with_P_and_A_calls.29_file_format_.28.2A.res.29) format that contains the 
expression dataset.  
[GSEA-specific TXT format](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#TXT:_Text_file_format_for_expression_dataset_.28.2A.txt.29) files are also accepted.
2. *chip platform:* This file defines symbol-to-gene mappings for a platform, possibly along with annotations, in 
[CHIP](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#CHIP:_Chip_file_format_.28.2A.chip.29) format.
The drop-down provides files from the [MSigDB project](https://www.gsea-msigdb.org) for common platforms, but custom files may also be provided.

## Output Files

1. *The collapsed data set (GCT):* After collapsing, the resulting files are always produced in GCT format even if they had a different input format. 

## Known Issues

Input files with spaces or special characters in their file names may cause errors.

## Platform Dependencies

**Task Type:**  Gene List Selection

**CPU Type:**  any

**Operating System:**  any

**Language:**  Java

## Version Comments

|Version|Release Date|Description|
|  :--  |     :--    |   :--     |
|2.0.0  |2021-01-14  |Switched to the GSEA code base.  Added new collapse.mode options and omit.features.with.no.symbol.match parameter.|
|2.0.1  |2021-03-22  |Minor doc updates.|
|2.0.2  |2021-03-22  |Fixed minor typo.|
|2.1.0  |2021-12-17   |Updated with the GSEA Desktop 4.2.0 code base with numerous bug fixes. Adds the Abs_max_of_probes collapse mode. Fixes some issues handling datasets with missing values. Improved warnings and logging. Adds an output file name parameter. Fixed bugs in weighted_p1.5 scoring.|


Copyright © 2003-2021 Broad Institute, Inc., Massachusetts Institute of
Technology, and Regents of the University of California. All rights
reserved.

