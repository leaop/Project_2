# plot2.R - Emissões de PM2.5 em Baltimore (1999-2008)

# Filtrar dados de Baltimore (fips == "24510")
baltimore_emissions <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(total = sum(Emissions, na.rm = TRUE))

# Criar o gráfico
png("plot2.png", width = 600, height = 400)
plot(baltimore_emissions$year, baltimore_emissions$total, type = "o", pch = 19, col = "red", 
     xlab = "Ano", ylab = "Emissões Totais (toneladas)", 
     main = "Total de Emissões de PM2.5 em Baltimore (1999-2008)")
grid()
dev.off()
