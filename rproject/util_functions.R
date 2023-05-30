regiao_por_codigo_uf <- function(codigo) {
  uf <- substr(codigo, 1, 2)
  
  if (uf %in% c("12", "16", "13", "15", "11", "14", "17")) {
    regiao <- 1  # Norte
  } else if (uf %in% c("27", "29", "23", "21", "25", "26", "22", "24", "28")) {
    regiao <- 2  # Nordeste
  } else if (uf %in% c("53", "52", "51", "50")) {
    regiao <- 3  # Centro-Oeste
  } else if (uf %in% c("32", "31", "33", "35")) {
    regiao <- 4  # Sudeste
  } else if (uf %in% c("41", "43", "42")) {
    regiao <- 5  # Sul
  } else {
    regiao <- 0  # UF não encontrada
  }
  
  return(regiao)
}

nome_regiao <- function(codigo) {
  regiao <- switch(codigo,
                   "1" = "Norte",
                   "2" = "Nordeste",
                   "3" = "Centro-Oeste",
                   "4" = "Sudeste",
                   "5" = "Sul",
                   "0" = "Região inválida")  # Código inválido
  return(regiao)
}
