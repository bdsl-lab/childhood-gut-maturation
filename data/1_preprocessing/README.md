# Preprocessing

## FASTQ Files

* The 16S rRNA gene amplicon sequencing datasets targeting the V3-V4 region are publicly available in the NCBI Sequence Read Archive (SRA).
* The datasets used in this study include the BioProjects **PRJNA280490**, **PRJNA1136812**, and **PRJNA935155**.
* The raw FASTQ files are not included in this repository.

## Directory

* `amplicon`: Preprocessed data files for 16S rRNA gene amplicon sequencing analyses.

## Data Preprocessing

The detailed preprocessing workflow is provided in the shell scripts.

The preprocessing pipeline consists of the following steps:

* Generation of ASV feature tables
* Construction of a phylogenetic tree using representative sequences
* Taxonomic assignment using a Naïve Bayes classifier trained on V3-V4 fragments from the Greengenes2 database (2024.09)
* Taxonomic aggregation at the genus level
* Alpha- and beta-diversity analyses using QIIME2

## Raw data files 

The following QIIME 2 artifacts are not tracked in the Git repository because of their large file sizes.

* `demux-paired.qza`
* `trim-demux.qza`
