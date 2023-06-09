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
