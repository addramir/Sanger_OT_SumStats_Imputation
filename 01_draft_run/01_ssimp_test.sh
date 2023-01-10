
cd ~/projects/ss_imp/01_test

~/projects/ss_imp/ssimp_software/bin/ssimp \
--gwas ~/projects/ss_imp/01_test/gip1-comma.txt \
--ref ~/reference_panels/1000genomes/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf \
--impute.range 19:4442712-19:4642712 \
--out chr19.txt 



~/projects/ss_imp/ssimp_software/bin/ssimp \
--gwas ~/projects/ss_imp/01_test/tmp19.txt \
--ref ~/reference_panels/1000genomes/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf \
--out chr19.txt 

~/projects/ss_imp/ssimp_software/bin/ssimp \
--gwas ~/projects/ss_imp/01_test/tmp19.txt \
--ref chr19.bed \
--out chr19.txt 

~/projects/ss_imp/ssimp_software/bin/ssimp \
--gwas ~/projects/ss_imp/01_test/gip1-19-space.txt \
--ref chr19_snps.vcf.gz \
--out chr19.txt 

