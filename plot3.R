# plot3.R - Emissões de PM2.5 em Baltimore por tipo de fonte (1999-2008)

library(ggplot2)

# Filtrar dados de Baltimore por tipo
type_emissions <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(total = sum(Emissions, na.rm = TRUE))

# Criar o gráfico
png("plot3.png", width = 600, height = 400)
ggplot(type_emissions, aes(x = year, y = total, color = type)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(title = "Emissões de PM2.5 em Baltimore por Tipo de Fonte (1999-2008)",
       x = "Ano", y = "Emissões Totais (toneladas)") +
  theme_minimal()
dev.off()
