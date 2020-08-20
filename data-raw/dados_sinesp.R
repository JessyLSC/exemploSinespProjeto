## code to prepare `dados_sinesp` dataset goes here

usethis::use_data(dados_sinesp, overwrite = TRUE)

caminho <- "data-raw/indicadoressegurancapublicamunicmar20.xlsx"
abas <- readxl::excel_sheets(caminho)
dados_sinesp <- purrr::map_dfr(
  abas,
  ~readxl::read_excel(
    path = caminho,
    sheet = .x,
    col_types = c("text", "text", "text", "date", "numeric")
  )
)

dados_sinesp <- dplyr::bind_rows(dados_sinesp)

library(tidyverse)
install.packages("janitor")
library(janitor)

dados_sinesp <- dados_sinesp %>%
  janitor::clean_names()

readr::write_rds(dados_sinesp, "data-raw/dados_sinesp.rds", compress = "gz")
