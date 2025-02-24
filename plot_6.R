# Carregar pacotes necessários
library(dplyr)
library(ggplot2)

# Ler os dados
NEI <- readRDS("~/summarySCC_PM25.rds")
SCC <- readRDS("~/Source_Classification_Code.rds")

# Filtrar fontes relacionadas a veículos motorizados
vehicle_scc <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case = TRUE), "SCC"]
vehicle_emissions <- NEI %>%
  filter(fips %in% c("24510", "06037") & SCC %in% vehicle_scc) %>%
  group_by(year, fips) %>%
  summarise(total = sum(Emissions, na.rm = TRUE)) %>%
  mutate(city = ifelse(fips == "24510", "Baltimore", "Los Angeles"))

# Criar o gráfico
png("plot6.png", width = 600, height = 400)
ggplot(vehicle_emissions, aes(x = year, y = total, color = city)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(title = "Comparação das Emissões de Veículos Motorizados (1999-2008)",
       x = "Ano", y = "Emissões Totais (toneladas)", color = "Cidade") +
  theme_minimal()
dev.off()
