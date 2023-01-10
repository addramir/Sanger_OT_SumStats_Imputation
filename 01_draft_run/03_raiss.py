import raiss

# path to the Region file
region_berisa = "/home/yt4/projects/ss_imp/02_chr19/Region_LD.csv"
# Path to the reference panel
ref_folder="/home/yt4/projects/ss_imp/02_chr19/ref/chr19_reg"
# path to the folder to store the results
ld_folder_out = "/home/yt4/projects/ss_imp/02_chr19/ld"
raiss.LD.generate_genome_matrices(region_berisa,ref_folder,ld_folder_out,prefix='')


#/home/yt4/projects/ss_imp/02_chr19/ld/chr19_45357938_45458213
#rsID pos  A0 A1 Z
#/home/yt4/projects/ss_imp/02_chr19$ head chr19_reg_raiss.txt

module load Python/3.6.0

output_folder="/home/yt4/projects/ss_imp/02_chr19/out"
ref_folder="/home/yt4/projects/ss_imp/02_chr19/ref/chr19_reg"
zscore_folder="/home/yt4/projects/ss_imp/02_chr19/zfiles"
ld_folder="/home/yt4/projects/ss_imp/02_chr19/ld/"



chrom="chr19"
#quick fix to access entry point on tars
alias impute_jass="python3 /home/yt4/.local/lib/python3.6/site-packages/impute_jass/__main__.py"
study="tmp"
#chrom="chr22"

echo "Study: ${study}; Chrom: ${chrom}"

#time impute_jass --chrom ${chrom} --gwas ${study} --ref-folder ${ref_folder} --ld-folder ${ld_folder} --zscore-folder ${zscore_folder} --output-folder ${output_folder}
time python3 ~/tmp/raiss/__main__.py \
--chrom ${chrom} --gwas ${study} --ref-folder ${ref_folder} --ld-folder ${ld_folder} --zscore-folder ${zscore_folder} --output-folder ${output_folder}
