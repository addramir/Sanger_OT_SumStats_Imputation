import pandas as pd
import numpy as np

vi=pd.read_csv("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/Yakov_chr19_LD_variants/part-00000-42d4a16d-ffa6-49e0-a5e9-048b43e59e63-c000.csv",header=None)
LD=pd.read_csv("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/Yakov_chr19_ld_matrix.txt",header=None,sep=" ")

chr=pos=[str(x) for x in list(vi[0])]
pos=[str(x) for x in list(vi[1])]
snps=[x[0]+'_'+x[1] for x in zip(chr,pos)]
LD.columns=snps
LD.index=snps

LD_m=np.array(LD)
LD_m=LD_m+np.transpose(LD_m)
np.fill_diagonal(LD_m,val=1)
LD=pd.DataFrame(LD_m,columns=snps,index=snps)

LD_l=LD.stack().reset_index().set_axis('SNP_A SNP_B R'.split(), axis=1)

vi.to_csv("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/vi.csv",index=None)
LD_l.to_csv("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/LD_l.csv",index=None)
