# Data folder description

This directory contains the data used in this study, organized by preprocessing stage and analyses purpose.

## Downstream analyses sample counts
- HC: 94
- PIBD: 49

## Directories

- `1-preprocessing`: Raw data. Note that raw FASTQ files have been deposited in the NCBI Sequence Read Archive (SRA) and preprocessed data for amplicon sequencing analyses.
- `2-preprocessed`: Processed and intermediate data generated during preprocessing and downstream analyses.
- `3-results`: Results files, including outputs from statistical analyses and machine learning models, differential abundance, network analysis, cluster analysis.


## Frequently used files

Files that are frquently reference across analyses are placed in the root of the data directory for convenience.

### manifest file
- `pre_manifest.tsv`:  Sample-id table use by imported at QIIME2.

### Metadata file
- `metadata.tsv`: Overall datasets metadata before preprocessing(n=183).
- `pre_metadata.tsv`: After preprocessed datasets metadata(n=143).


### MMI file
- `model.tsv`: Inferred mmi results of the control group and the inferred mmi results of the PIBD group were merged.
- `mmi_fit_sepa.tsv`: MMI-based sample group information, including host status, mmi, chronological age.