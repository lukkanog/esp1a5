library(dplyr)

MORTALIDADE_PRE_PANDEMIA_SAMPLE['CODMUNRES'] <- apply(MORTALIDADE_PRE_PANDEMIA_SAMPLE['CODMUNRES'], 1, regiao_por_codigo_uf)  
MORTALIDADE_DURANTE_PANDEMIA_SAMPLE['CODMUNRES'] <- apply(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE['CODMUNRES'], 1, regiao_por_codigo_uf)                    

MORTALIDADE_PRE_PANDEMIA_SAMPLE['ANOS_DE_IDADE'] <- apply(MORTALIDADE_PRE_PANDEMIA_SAMPLE['IDADE'], 1, calcularIdadeEmAnos)  
MORTALIDADE_DURANTE_PANDEMIA_SAMPLE['ANOS_DE_IDADE'] <- apply(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE['IDADE'], 1, calcularIdadeEmAnos)  


MORTALIDADE_PRE_PANDEMIA_SAMPLE$DTOBITO <- as.Date(as.character(MORTALIDADE_PRE_PANDEMIA_SAMPLE$DTOBITO), format = "%d%m%Y")
MORTALIDADE_PRE_PANDEMIA_SAMPLE$MES_OBITO <- format(MORTALIDADE_PRE_PANDEMIA_SAMPLE$DTOBITO, "%m")

MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$DTOBITO <- as.Date(as.character(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$DTOBITO), format = "%d%m%Y")
MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$MES_OBITO <- format(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$DTOBITO, "%m")

summary(MORTALIDADE_PRE_PANDEMIA_SAMPLE$ANOS_DE_IDADE);
summary(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$ANOS_DE_IDADE);

sum(MORTALIDADE_PRE_PANDEMIA_SAMPLE$CIRCOBITO == 2, na.rm = TRUE)
sum(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CIRCOBITO == 2, na.rm = TRUE)
