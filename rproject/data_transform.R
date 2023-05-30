library(dplyr)

MORTALIDADE_2019_SAMPLE['CODMUNRES'] <- apply(MORTALIDADE_2019_SAMPLE['CODMUNRES'], 1, regiao_por_codigo_uf)  
MORTALIDADE_2021_SAMPLE['CODMUNRES'] <- apply(MORTALIDADE_2021_SAMPLE['CODMUNRES'], 1, regiao_por_codigo_uf)                    
