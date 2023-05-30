library(readr)
MORTALIDADE_2021 <- read_delim("data/Mortalidade_Geral_2021.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
MORTALIDADE_2021_SAMPLE <- MORTALIDADE_2021[sample(nrow(MORTALIDADE_2021), 100000), ]

MORTALIDADE_2019 <- read_delim("data/Mortalidade_Geral_2019.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
MORTALIDADE_2019_SAMPLE <- MORTALIDADE_2021[sample(nrow(MORTALIDADE_2019), 100000), ]
