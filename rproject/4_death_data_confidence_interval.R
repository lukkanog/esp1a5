##### Intervalos de Confiança
conf_level <- 0.9  # Nível de confiança desejado

for (i in 1:nrow(death_data_pre_pandemic)) {
  region <- death_data_pre_pandemic$region_name[i]
  homicide <- death_data_pre_pandemic$homicideCount[i]
  total <- death_data_pre_pandemic$totalDeaths[i]
  
  # Cálculo da proporção
  proportion <- homicide / total
  
  # Cálculo do intervalo de confiança usando prop.test()
  conf_interval <- prop.test(x = homicide, n = total, conf.level = conf_level)$conf.int
  
  # Exibição do resultado
  cat("Região:", region, "\n")
  cat("Intervalo de Confiança: (", conf_interval[1], ", ", conf_interval[2], ")\n\n")
}


for (i in 1:nrow(death_data_during_pandemic)) {
  region <- death_data_during_pandemic$region_name[i]
  homicide <- death_data_during_pandemic$homicideCount[i]
  total <- death_data_during_pandemic$totalDeaths[i]
  
  # Cálculo da proporção
  proportion <- homicide / total
  
  # Cálculo do intervalo de confiança usando prop.test()
  conf_interval <- prop.test(x = homicide, n = total, conf.level = conf_level)$conf.int
  
  # Exibição do resultado
  cat("Região:", region, "\n")
  cat("Intervalo de Confiança: (", conf_interval[1], ", ", conf_interval[2], ")\n\n")
}

###
proportions <- rbind(death_data_pre_pandemic[, c("region_name", "homicideCount", "totalDeaths")], 
                     death_data_during_pandemic[, c("region_name", "homicideCount", "totalDeaths")])
proportions$period <- rep(c("Antes da pandemia", "Durante a pandemia"), each = nrow(death_data_pre_pandemic))
proportions$proportion <- proportions$homicideCount / proportions$totalDeaths

ggplot(proportions, aes(x = period, y = proportion, color = region_name, group = region_name)) +
  geom_line() +
  geom_point() +
  xlab("Período") +
  ylab("Proporção de Homicídios") +
  ggtitle("Proporção de Homicídios antes e durante a pandemia por região") +
  theme_minimal() +
  scale_color_manual(values = c("#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#FF00FF")) +
  labs(color = "Região")

