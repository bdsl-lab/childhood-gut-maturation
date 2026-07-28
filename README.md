## Childhood gut maturation 

This repository contains the datasets and analysis workflows used to investigate microbiome maturation-associated changes in gut microbial organization during childhood using healthy Italian pediatric cohorts.

**Manuscript**: *Microbial community organization characterizes relative gut microbiota maturation during childhood* (On preparation.)

## Study overview

### Datasets
- Healthy controls (n=94)
- PIBD (n=49)
	- Crohn's disease (n=12)
	- Ulcerative colitis (n=37)

### Data type
- 16S rRNA gene amplicon sequencing (V3-V4 region)
  

### Analyses
- Construction of a Microbial Maturity Index(MMI) using a random forest regression model trained on healthy children 
- Prediction of MMI and stratification of healthy children into microbiota maturation groups 
  - MMI-high (n=51)
  - MMI-low (n=43)
- Characterization of maturation-associated microbial signatures
- Construction of genus-genus association networks and network analysis for each MMI group
- Network comparison of among MMI groups 

## Data availability
- Raw sequencing data are publicly available in the NCBI Sequence Read Archive (SRA)
	- Study accessions: PRJNA280490, PRJNA1136812, and PRJNA935155.
- Sample metadata and preprocessing files are available in `data/1-preprocessing`

## Analysis pipeline (summary)

### 1. Preprocessing

- Sequence denoising using DADA2 in QIIME2
- Taxonomy assignment using a Naïve Bayes classifier trained on the V3-V4 region of the Greengenes2 database (2024.09)
- Alpha- and beta-diversity analyses in QIIME2

### 2. Microbiome age model

- Random forest regression
- Hyperparameter optimization using GridSearchCV
- Five-fold cross-validation 
- Feature importance analysis (SHAP analysis)
- Prediction of microbial maturation in the PIBD cohort 

### 3. Microbiota maturation stratification 

- Quadratic regression between MMI and chronological age
- Classification of healthy children into MMI-high and MMI-low groups according to their relative microbiota maturation status
 
### 4. Diversity analysis 

- Alpha-diversity analysis 
- Beta-diversity analysis
- Data visualization using Matplotlib and Seaborn 

### 5. Differential abundance analysis 
	
- Differential abundance analysis using ANCOM-BC

### 6. Microbial association network analysis

- Association inference using SparCC implemented in the NetCoMi package 
- Network visualization using Cytoscape
- Community detection and network topology analysis
