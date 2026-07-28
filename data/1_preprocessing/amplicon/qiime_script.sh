qiime tools import \
--type 'SampleData[PairedEndSequencesWithQuality]' \
--input-path ../pre_manifest.tsv \
--output-path demux-paired.qza \
--input-format PairedEndFastqManifestPhred33

qiime cutadapt trim-paired \ 
--i-demultiplexed-sequences demux-paired.qza \
--p-cores 20 \ 
--p-front-f CCTACGGGNGGCWGCAG \ 
--p-front-r GACTACHVGGGTATCTAATCC \
--p-minimum-length 100 \ 
--p-discard-untrimmed \
--o-trimmed-sequences trim-demux.qza 


qiime dada2 denoise-paired \
--i-demultiplexed-seqs trim-demux.qza \
--p-n-threads 20 \
--p-trunc-len-f 233 \
--p-trunc-len-r 206 \
--o-table table.qza \
--o-representative-sequences rep-seqs.qza \
--o-denoising-stats stats.qza


qiime feature-table rarefy \
--i-table table.qza \
--p-sampling-depth 6279 \
--o-rarefied-table feature-table_rarefied.qza \
--output-dir output_rarefaction

qiime feature-classifier classify-sklearn \
--i-clssifier gg-v3v4-woo-classifier.qza \
--i-reads rep-seqs.qza \
--o-classification taxonomy.qza

qiime taxa collapse \
--i-table feature-table_rarefied.qza \
--i-taxonomy taxonomy.qza \
--p-level 6 \
--o-collapsed-table genus_table.qza

qiime diversity core-metrics-phylogenetic \
--i-phylogeny rooted-tree.qza \
--i-table genus_table.qza \
--p-sampling-depth 6279 \
--m-metadata-file ../../pre_metadata.tsv \
--output-dir level-6-metrics-results


qiime tools export \
--input-path level-6-table.qza \
--output-path exported-feature-table


qiime tools export \
--input-path taxonomy.qza \
--output-path exported-taxonomy 

qiime tools export \
--input-path level-6-metrics-results/bray_curtis_pcoa_results.qza \
--output-path diversity_export

qiime tools export \
--input-path level-6-metrics-results/shannon_vector.qza \
--output-path diversity_export