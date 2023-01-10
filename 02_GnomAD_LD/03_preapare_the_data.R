library(data.table)

gwas=fread("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/FINNGEN_R6_E4_LIPOPROT_chr19.csv",data.table=F,sep=",")
ld=fread("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/LD_l.csv",data.table=F,header=T)
vi=fread("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/vi.csv",data.table=F,header=T)

snps_vi=paste(vi[,1],vi[,2],sep="_")
start1=min(vi[,2])
start2=max(vi[,2])

gwas=gwas[((gwas$pos>=start1) & (gwas$pos<=start2)),]


snps_gwas=paste(gwas[,"chrom"],gwas[,"pos"],sep="_")
gwas=gwas[snps_gwas%in%snps_vi,]
snps_gwas=paste(gwas[,"chrom"],gwas[,"pos"],sep="_")
gwas=gwas[!duplicated(snps_gwas),]
snps_gwas=paste(gwas[,"chrom"],gwas[,"pos"],sep="_")
#ind=match(snps_vi,snps_gwas)
#gwas=gwas[ind,]
#snps_gwas=paste(gwas[,"chrom"],gwas[,"pos"],sep="_")
#snps_gwas[snps_gwas=="NA_NA"]=NA
#table(snps_gwas==snps_vi)
#table(gwas$alt==vi[,4])
#table(gwas$ref==vi[,3])


z=gwas[,c("pos","ref","alt")]
colnames(z)=c("pos","A0","A1")
z=cbind(rsID=snps_gwas,z,Z=gwas$beta/gwas$se)

ref=cbind(chr=19,snps_vi,T=0,vi[,2],vi[,3],vi[,4])

indA=match(ld$SNP_A,snps_vi)
indB=match(ld$SNP_B,snps_vi)
ld=cbind(CHR_A=vi[indA,1],BP_A=vi[indA,2],SNP_A=ld$SNP_A,
    CHR_B=vi[indB,1],BP_B=vi[indB,2],SNP_B=ld$SNP_B,R=ld$R)
ind=apply(ld[,c("SNP_A","SNP_B")],MAR=1,FUN=function(x){x=sort(x);paste(x,collapse="_")})
ld=ld[!duplicated(ind),]


path_out="~/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/test_out/"
fwrite(x=z,file=paste0(path_out,"z_tmp_chr19.txt"),sep="\t",col.names=T)
fwrite(x=ref,file=paste0(path_out,"chr19.bim"),sep="\t",col.names=F)
fwrite(x=ld,file=paste0(path_out,"chr19_",start1,"_",start2,".ld"),sep="\t",col.names=T)


imp_out=fread("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/test_out//z_tmp_chr19.txt")

#250->365 R2>=0.9
#250->374 R2>=0.7 




