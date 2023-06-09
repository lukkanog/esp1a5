library(readr)

MORTALIDADE_2018 <- read_delim("data/Mortalidade_Geral_2018.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
MORTALIDADE_2018_SAMPLE <- MORTALIDADE_2018[sample(nrow(MORTALIDADE_2018), 200000), ]

MORTALIDADE_2019 <- read_delim("data/Mortalidade_Geral_2019.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
MORTALIDADE_2019_SAMPLE <- MORTALIDADE_2019[sample(nrow(MORTALIDADE_2019), 200000), ]

MORTALIDADE_2020 <- read_delim("data/Mortalidade_Geral_2020.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
MORTALIDADE_2020_SAMPLE <- MORTALIDADE_2020[sample(nrow(MORTALIDADE_2020), 200000), ]

MORTALIDADE_2021 <- read_delim("data/Mortalidade_Geral_2021.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
MORTALIDADE_2021_SAMPLE <- MORTALIDADE_2021[sample(nrow(MORTALIDADE_2021), 200000), ]


MORTALIDADE_PRE_PANDEMIA_SAMPLE <- rbind(MORTALIDADE_2019_SAMPLE, MORTALIDADE_2018_SAMPLE);
MORTALIDADE_DURANTE_PANDEMIA_SAMPLE <- rbind(MORTALIDADE_2020_SAMPLE, MORTALIDADE_2021_SAMPLE);
