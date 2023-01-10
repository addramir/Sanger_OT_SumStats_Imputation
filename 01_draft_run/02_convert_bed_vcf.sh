plink \
--vcf ~/reference_panels/1000genomes/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz \
--make-bed \
--maf 0.0001 \
--geno 0 \
--out chr19

plink \
--bfile chr19 \
--recode vcf bgz \
--maf 0.0001 \
--geno 0 \
--out chr19

plink \
--bfile chr19 \
--recode vcf bgz \
--maf 0.0001 \
--extract snps.txt \
--geno 0 \
--out chr19_snps

cd ~/projects/ss_imp/02_chr19
plink \
--bfile ~/software/DEPICT/data/genotype_data_plink/CEU_GBR_TSI_unrelated.phase1_release_v3.20101123.snps_indels_svs.genotypes_noduplicates \
--recode vcf bgz \
--maf 0.0001 \
--extract snps.txt \
--geno 0 \
--out chr19_snps

plink \
--bfile ~/software/DEPICT/data/genotype_data_plink/CEU_GBR_TSI_unrelated.phase1_release_v3.20101123.snps_indels_svs.genotypes_noduplicates \
--maf 0.0001 \
--extract snps.txt \
--geno 0 \
--make-bed \
--out chr19_snps



plink \
--bfile ~/projects/ss_imp/02_chr19/ref/chr19 \
--recode vcf bgz \
--maf 0.0001 \
--chr 19 \
--from-bp 45357000 \
--to-bp 45459000 \
--geno 0 \
--out chr19_snps

plink \
--bfile ~/projects/ss_imp/02_chr19/ref/chr19 \
--make-bed \
--maf 0.0001 \
--chr 19 \
--from-bp 45357000 \
--to-bp 45459000 \
--geno 0 \
--out chr19_reg/chr19