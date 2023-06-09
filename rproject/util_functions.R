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

calcularIdadeEmAnos <- function(idade) {
  # Verifica se a idade é maior que 100 anos
  if (substr(idade, 1, 1) == "5") {
    return(as.numeric(substr(idade, 2, 3)))
  }
  
  # Verifica a unidade da idade
  unidade <- as.numeric(substr(idade, 1, 1))
  
  # Verifica a quantidade de unidades
  quantidade <- as.numeric(substr(idade, 2, 3))
  
  # Calcula a idade em anos
  if (unidade == 1) {
    # Idade em minutos
    return(quantidade / 525600)
  } else if (unidade == 2) {
    # Idade em horas
    return(quantidade / 8760)
  } else if (unidade == 3) {
    # Idade em meses
    return(quantidade / 12)
  } else if (unidade == 4) {
    # Idade em anos
    return(quantidade)
  } else {
    # Idade desconhecida ou ignorada
    return(NA)
  }
}
