library(stats)


for (i in 1:5) {
  region_name <- death_data_pre_pandemic$region_name[i];
  
  successes1 <- death_data_pre_pandemic$homicideCount[i];
  observations1 <- death_data_pre_pandemic$totalDeaths[i];
  
  # Amostra 2
  successes2 <- death_data_during_pandemic$homicideCount[i];
  observations2 <- death_data_during_pandemic$totalDeaths[i];
  
  prop.test.result <- prop.test(x = c(successes1, successes2), 
                                n = c(observations1, observations2),
                                alternative = "greater")
  cat("Valor p: ", prop.test.result$p.value, "\n Região: ", region_name, "\n\n")
  
}


successes1 <- sum(death_data_pre_pandemic$homicideCount);
observations1 <- sum(death_data_pre_pandemic$totalDeaths);

successes2 <- sum(death_data_during_pandemic$homicideCount);
observations2 <- sum(death_data_during_pandemic$totalDeaths);

prop.test.result <- prop.test(x = c(successes1, successes2), 
                              n = c(observations1, observations2),
                              alternative = "greater", conf.level = 1 - 0.05, correct = FALSE)

test_statistic <- prop.test.result$statistic
degrees_freedom <- prop.test.result$parameter
p_value <- prop.test.result$p.value

cat("Teste de Hipótese de Diferença entre Proporções Bilaterais\n")
cat("Estatística de teste: ", test_statistic, "\n")
cat("Graus de liberdade: ", degrees_freedom, "\n")
cat("Valor p: ", p_value, "\n")
cat("-------------------------------------------------------------------\n")


df <- data.frame(group = c("Antes da pandemia", "Durante a pandemia"),
                 proportion  = rbind( (successes1/observations1), (successes2/observations2) ))

# Criando o plot
ggplot(df, aes(x = group, y = proportion)) +
  geom_bar(stat = "identity", fill = "lightblue", color = "black") +
  geom_text(aes(label = proportion), vjust = -0.5) +
  labs(title = "Teste de Hipótese de Diferença entre Proporções",
       x = "Período",
       y = "Proporção") +
  theme_minimal()


##########################

p <- (successes1 + successes2) / (observations1 + observations2)
se <- sqrt(p * (1 - p) * (1 / observations1 + 1 / observations2))

lcl <- round(prop.test.result$conf.int[1], 3)
ucl <- round(prop.test.result$conf.int[2], 3)

data.frame(d = -1:1 / 10) %>%
  mutate(density = dnorm(x = d, mean = successes1/observations1 - successes2/observations2, sd = se)) %>%
  mutate(rr = ifelse(d < lcl | d > ucl, density, 0)) %>%
  ggplot() +
  geom_line(aes(x = d, y = density)) +
  geom_area(aes(x = d, y = rr), fill = "red", alpha = 0.5) +
  geom_vline(aes(xintercept = successes1/observations1 - successes2/observations2), color = "blue") +
  labs(title = bquote("Diferença entre proporções bilateral"),
       x = "d",
       y = "Densidade",
       fill = "Área destacada",
       color = "Linha vertical") +
  theme(legend.position = "right")
