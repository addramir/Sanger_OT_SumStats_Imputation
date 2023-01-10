cd ~/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/test_out/


output_folder="/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/test_out/"
ref_folder="/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/test_out/"
zscore_folder="/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/test_out/"
ld_folder="/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/test_out/"



chrom="chr19"
#quick fix to access entry point on tars
alias impute_jass="python3 /home/yt4/.local/lib/python3.6/site-packages/impute_jass/__main__.py"
study="tmp"
#chrom="chr22"

echo "Study: ${study}; Chrom: ${chrom}"

#time impute_jass --chrom ${chrom} --gwas ${study} --ref-folder ${ref_folder} --ld-folder ${ld_folder} --zscore-folder ${zscore_folder} --output-folder ${output_folder}
time python3 ~/tmp/raiss/__main__.py \
--chrom ${chrom} --gwas ${study} --ref-folder ${ref_folder} --ld-folder ${ld_folder} --zscore-folder ${zscore_folder} --output-folder ${output_folder}
