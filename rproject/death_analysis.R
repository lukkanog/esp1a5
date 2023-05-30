library(ggplot2)

untreated_deaths_by_region_2019 <- data.frame(region_code = numeric(),
                                              region_name = c(),
                                              totalDeaths = numeric(),
                                              untreatedDeaths = numeric())
for (i in seq_len(5)) {

  new_row <- data.frame(region_code = i,
                        region_name = nome_regiao(i),
                        totalDeaths = sum(MORTALIDADE_2019_SAMPLE$CODMUNRES == i),
                        untreatedDeaths = sum(MORTALIDADE_2019_SAMPLE$CODMUNRES == i & MORTALIDADE_2019_SAMPLE$ASSISTMED == 2, na.rm = TRUE))

  untreated_deaths_by_region_2019 <- rbind(untreated_deaths_by_region_2019, new_row)
  
}

View(untreated_deaths_by_region_2019)


untreated_deaths_by_region_2021 <- data.frame(region_code = numeric(),
                                              region_name = c(),
                                              totalDeaths = numeric(),
                                              untreatedDeaths = numeric())

for (i in 1:5) {
  
  new_row <- data.frame(region_code = i,
                        region_name = nome_regiao(i),
                        totalDeaths = sum(MORTALIDADE_2021_SAMPLE$CODMUNRES == i),
                        untreatedDeaths = sum(MORTALIDADE_2021_SAMPLE$CODMUNRES == i & MORTALIDADE_2021_SAMPLE$ASSISTMED == 2, na.rm = TRUE))
  untreated_deaths_by_region_2021 <- rbind(untreated_deaths_by_region_2021, new_row)
  
}

View(untreated_deaths_by_region_2021)


barplot(untreated_deaths_by_region_2019$untreatedDeaths, untreated_deaths_by_region_2019$region_code)    
barplot(untreated_deaths_by_region_2021$untreatedDeaths, untreated_deaths_by_region_2021$region_code)  

ggplot(untreated_deaths_by_region_2019, aes(x=region_name, y = untreatedDeaths))+ geom_bar(stat = "summary", fun = "median") +
  xlab("Região") +
  ylab("Mortes não tratadas");

ggplot(untreated_deaths_by_region_2021, aes(x=region_name, y = untreatedDeaths))+ geom_bar(stat = "summary", fun = "median") + xlab("Região") + ylab("Mortes não tratadas")
