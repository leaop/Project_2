# plot1.R - Total de emissões de PM2.5 nos EUA (1999-2008)

# Carregar pacotes necessários
library(dplyr)

# Ler os dados
NEI <- readRDS("/mnt/data/summarySCC_PM25.rds")

# Agregar emissões por ano
total_emissions <- NEI %>%
  group_by(year) %>%
  summarise(total = sum(Emissions, na.rm = TRUE))

# Criar o gráfico
png("plot1.png", width = 600, height = 400)
plot(total_emissions$year, total_emissions$total, type = "o", pch = 19, col = "blue", 
     xlab = "Ano", ylab = "Emissões Totais (toneladas)", 
     main = "Total de Emissões de PM2.5 nos EUA (1999-2008)")
grid()
dev.off()
