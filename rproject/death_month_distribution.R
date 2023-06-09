# Carregando a biblioteca ggplot2
library(ggplot2)

# Convertendo a coluna DTOBITO para o formato de data
MORTALIDADE_PRE_PANDEMIA_SAMPLE$DTOBITO <- as.Date(as.character(MORTALIDADE_PRE_PANDEMIA_SAMPLE$DTOBITO), format = "%d%m%Y")

# Extraindo o mês da coluna DTOBITO
MORTALIDADE_PRE_PANDEMIA_SAMPLE$MES <- format(MORTALIDADE_PRE_PANDEMIA_SAMPLE$DTOBITO, "%m")

# Criando o histograma com ggplot
ggplot(MORTALIDADE_PRE_PANDEMIA_SAMPLE, aes(x = MES)) +
  geom_histogram(stat = "count", fill = "steelblue", color = "black") +
  scale_x_discrete(labels = c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
                              "Jul", "Ago", "Set", "Out", "Nov", "Dez")) +
  labs(x = "Mês", y = "Número de Mortes", title = "Distribuição de Mortes por Mês")


MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$DTOBITO <- as.Date(as.character(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$DTOBITO), format = "%d%m%Y")

# Extraindo o mês da coluna DTOBITO
MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$MES <- format(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$DTOBITO, "%m")

# Criando o histograma com ggplot
ggplot(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE, aes(x = MES)) +
  geom_histogram(stat = "count", fill = "steelblue", color = "black") +
  scale_x_discrete(labels = c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
                              "Jul", "Ago", "Set", "Out", "Nov", "Dez")) +
  labs(x = "Mês", y = "Número de Mortes", title = "Distribuição de Mortes por Mês")


ggplot(MORTALIDADE_PRE_PANDEMIA_SAMPLE, aes(x = ANOS_DE_IDADE)) +
  geom_histogram(binwidth = 5, boundary = 0, fill = "steelblue", color = "black") +
  labs(title = "Distribuição de Idades",
       x = "Anos de Idade",
       y = "Contagem") +
  theme_minimal()

ggplot(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE, aes(x = ANOS_DE_IDADE)) +
  geom_histogram(binwidth = 5, boundary = 0, fill = "steelblue", color = "black") +
  labs(title = "Distribuição de Idades",
       x = "Anos de Idade",
       y = "Contagem") +
  theme_minimal()


ggplot(MORTALIDADE_PRE_PANDEMIA_SAMPLE, aes(y = ANOS_DE_IDADE)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "Boxplot de Idades",
       y = "Anos de Idade") +
  theme_minimal()

ggplot(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE, aes(y = ANOS_DE_IDADE)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "Boxplot de Idades",
       y = "Anos de Idade") +
  theme_minimal()
