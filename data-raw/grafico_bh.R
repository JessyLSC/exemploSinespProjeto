## code to prepare `grafico_bh` dataset goes here

usethis::use_data(grafico_bh, overwrite = TRUE)

dados_sinesp <- readr::read_rds("data/dados_sinesp.rds")

library(magrittr)
library(ggplot2)
library(dplyr)

dados_sinesp %>%
  dplyr::filter(municipio == "Belo Horizonte") %>%
  ggplot() +
  geom_line(aes(x = mes_ano, y = vitimas)) +
  labs(y = "Número de vítimas", x = "Mês", title = "Belo Horizonte") +
  theme_minimal()

usethis::use_r("graficos")

source("R/graficos.R")

criar_serie_municipio(dados_sinesp, "Belo Horizonte")
