library(ggplot2)

death_data_pre_pandemic <- data.frame(region_code = numeric(),
                                              region_name = c(),
                                              totalDeaths = numeric(),
                                              untreatedDeaths = numeric(),
                                              homicideCount = numeric())

death_data_during_pandemic <- data.frame(region_code = numeric(),
                                              region_name = c(),
                                              totalDeaths = numeric(),
                                              untreatedDeaths = numeric(),
                                              homicideCount = numeric())
for (i in seq_len(5)) {

  new_row <- data.frame(region_code = i,
                        region_name = nome_regiao(i),
                        totalDeaths = sum(MORTALIDADE_PRE_PANDEMIA_SAMPLE$CODMUNRES == i),
                        untreatedDeaths = sum(MORTALIDADE_PRE_PANDEMIA_SAMPLE$CODMUNRES == i & MORTALIDADE_PRE_PANDEMIA_SAMPLE$ASSISTMED == 2, na.rm = TRUE),
                        homicideCount = sum(MORTALIDADE_PRE_PANDEMIA_SAMPLE$CODMUNRES == i & MORTALIDADE_PRE_PANDEMIA_SAMPLE$CIRCOBITO == 3, na.rm = TRUE))
  death_data_pre_pandemic <- rbind(death_data_pre_pandemic, new_row)
  
}

for (i in 1:5) {
  
  new_row <- data.frame(region_code = i,
                        region_name = nome_regiao(i),
                        totalDeaths = sum(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CODMUNRES == i),
                        untreatedDeaths = sum(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CODMUNRES == i & MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$ASSISTMED == 2, na.rm = TRUE),
                        homicideCount = sum(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CODMUNRES == i & MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CIRCOBITO == 3, na.rm = TRUE))
  death_data_during_pandemic <- rbind(death_data_during_pandemic, new_row)
  
}


View(death_data_during_pandemic)
View(death_data_pre_pandemic)


ggplot(death_data_pre_pandemic, aes(x=region_name, y= homicideCount ))+ geom_bar(stat = "summary", fun = "median") +
  xlab("Região") +
  ylab("Homicidios 2018-2019");

ggplot(death_data_during_pandemic, aes(x=region_name, y= homicideCount ))+ geom_bar(stat = "summary", fun = "median") +
  xlab("Região") +
  ylab("Homicidios 2020-2021");


# Gráficos de setores
ggplot(death_data_pre_pandemic, aes(x = "", y = homicideCount, fill = region_name)) +
  geom_bar(stat = "identity") +
  coord_polar("y", start = 0) +
  xlab("") +
  ylab("") +
  ggtitle("Distribuição de Mortes por Homicídio (Período Pré-pandemia)") +
  theme_void() +
  labs(fill = "Região")

ggplot(death_data_during_pandemic, aes(x = "", y = homicideCount, fill = region_name)) +
  geom_bar(stat = "identity") +
  coord_polar("y", start = 0) +
  xlab("") +
  ylab("") +
  ggtitle("Distribuição de Mortes por Homicídio (Período durante a Pandemia)") +
  theme_void() +
  labs(fill = "Região")

# Grafico de barras empilhadas
homicide_counts <- rbind(death_data_pre_pandemic[, c("region_name", "homicideCount")], 
                         death_data_during_pandemic[, c("region_name", "homicideCount")])
homicide_counts$period <- rep(c("Antes da pandemia", "Durante a pandemia"), each = nrow(death_data_pre_pandemic))

ggplot(homicide_counts, aes(x = region_name, y = homicideCount, fill = period)) +
  geom_bar(stat = "identity", position = "stack") +
  xlab("Região") +
  ylab("Contagem de Homicídios") +
  ggtitle("Contagem de Homicídios antes e durante a pandemia por região") +
  labs(fill = "Período")
  theme_minimal()

