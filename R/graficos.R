criar_serie_municipio <- function(tab, munip) {
  tab %>%
    dplyr::filter(municipio == munip) %>%
    ggplot() +
    geom_line(aes(x = mes_ano, y = vitimas)) +
    labs(y = "Número de vítimas", x = "Mês", title = munip) +
    theme_minimal()
}
