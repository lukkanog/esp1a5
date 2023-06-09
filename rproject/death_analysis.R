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
  new_row$percentual = (new_row$homicideCount/new_row$totalDeaths)*100;
  death_data_pre_pandemic <- rbind(death_data_pre_pandemic, new_row)
  
}

for (i in 1:5) {
  
  new_row <- data.frame(region_code = i,
                        region_name = nome_regiao(i),
                        totalDeaths = sum(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CODMUNRES == i),
                        untreatedDeaths = sum(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CODMUNRES == i & MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$ASSISTMED == 2, na.rm = TRUE),
                        homicideCount = sum(MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CODMUNRES == i & MORTALIDADE_DURANTE_PANDEMIA_SAMPLE$CIRCOBITO == 3, na.rm = TRUE))
  new_row$percentual = (new_row$homicideCount/new_row$totalDeaths)*100;
  death_data_during_pandemic <- rbind(death_data_during_pandemic, new_row)
  
}


View(death_data_during_pandemic)
View(death_data_pre_pandemic)


sum(death_data_during_pandemic$homicideCount)
ggplot(death_data_pre_pandemic, aes(x=region_name, y= homicideCount ))+ geom_bar(stat = "summary", fun = "median") +
  xlab("Região") +
  ylab("Homicidios 2018-2019");

ggplot(death_data_during_pandemic, aes(x=region_name, y= homicideCount ))+ geom_bar(stat = "summary", fun = "median") +
  xlab("Região") +
  ylab("Homicidios 2020-2021");


conf_level <- 0.9  # Nível de confiança desejado

cat("Homicidios em 2019\n");
for (i in 1:nrow(death_data_pre_pandemic)) {
  region <- death_data_pre_pandemic$region_name[i]
  homicides <- death_data_pre_pandemic$homicideCount[i]
  n <- death_data_pre_pandemic$totalDeaths[i]
  
  # Cálculo da média e do desvio padrão
  mean_homicides <- homicides / n
  sd_homicides <- sqrt(homicides * (1 - homicides/n) / n)
  
  # Cálculo do intervalo de confiança usando qnorm()
  z_value <- qnorm((1 - conf_level) / 2)
  lower_bound <- mean_homicides - z_value * sd_homicides
  upper_bound <- mean_homicides + z_value * sd_homicides
  
  # Exibição do resultado
  cat("Região:", region, "\n")
  cat("Intervalo de Confiança: (", lower_bound, ", ", upper_bound, ")\n\n")
}


cat("Homicidios em 2020\n");
for (i in 1:nrow(death_data_during_pandemic)) {
  region <- death_data_during_pandemic$region_name[i]
  homicides <- death_data_during_pandemic$homicideCount[i]
  n <- death_data_during_pandemic$totalDeaths[i]
  
  # Cálculo da média e do desvio padrão
  mean_homicides <- homicides / n
  sd_homicides <- sqrt(homicides * (1 - homicides/n) / n)
  
  # Cálculo do intervalo de confiança usando qnorm()
  z_value <- qnorm((1 - conf_level) / 2)
  lower_bound <- mean_homicides - z_value * sd_homicides
  upper_bound <- mean_homicides + z_value * sd_homicides
  
  # Exibição do resultado
  cat("Região:", region, "\n")
  cat("Intervalo de Confiança: (", lower_bound, ", ", upper_bound, ")\n\n")
}


cat("Mortes por condições não tratadas em 2019\n");
for (i in 1:nrow(death_data_pre_pandemic)) {
  region <- death_data_pre_pandemic$region_name[i]
  untreated <- death_data_pre_pandemic$untreatedDeaths[i]
  n <- death_data_pre_pandemic$totalDeaths[i]
  
  # Cálculo da média e do desvio padrão
  mean_untreated <- untreated / n
  sd_untreated <- sqrt(untreated * (1 - untreated/n) / n)
  
  # Cálculo do intervalo de confiança usando qnorm()
  z_value <- qnorm((1 - conf_level) / 2)
  lower_bound <- mean_untreated - z_value * sd_untreated
  upper_bound <- mean_untreated + z_value * sd_untreated
  
  # Exibição do resultado
  cat("Região:", region, "\n")
  cat("Intervalo de Confiança: (", lower_bound, ", ", upper_bound, ")\n\n")
}


cat("Mortes por condições não tratadas em 2020\n");
for (i in 1:nrow(death_data_during_pandemic)) {
  region <- death_data_during_pandemic$region_name[i]
  untreated <- death_data_during_pandemic$untreatedDeaths[i]
  n <- death_data_during_pandemic$totalDeaths[i]
  
  # Cálculo da média e do desvio padrão
  mean_untreated <- untreated / n
  sd_untreated <- sqrt(untreated * (1 - untreated/n) / n)
  
  # Cálculo do intervalo de confiança usando qnorm()
  z_value <- qnorm((1 - conf_level) / 2)
  lower_bound <- mean_untreated - z_value * sd_untreated
  upper_bound <- mean_untreated + z_value * sd_untreated
  
  # Exibição do resultado
  cat("Região:", region, "\n")
  cat("Intervalo de Confiança: (", lower_bound, ", ", upper_bound, ")\n\n")
}



