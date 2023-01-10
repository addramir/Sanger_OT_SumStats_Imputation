import pandas as pd
from pyspark.sql import DataFrame, SparkSession
import pyspark.sql.functions as f
from pyspark.sql.types import *
from pyspark.sql.window import Window
import numpy as np

spark = SparkSession.builder.getOrCreate()


gwas=spark.read.parquet("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/FINNGEN_R6_E4_LIPOPROT.parquet")
gwas=gwas.filter(f.col('chrom')=='19')

g=gwas.toPandas()

g.to_csv("/home/yt4/projects/ss_imp/03_chr19_gnomad/Yakov_chr19_LD/FINNGEN_R6_E4_LIPOPROT_chr19.csv",index=None)