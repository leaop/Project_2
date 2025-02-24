# plot5.R - Emissões de PM2.5 de veículos motorizados em Baltimore (1999-2008)

# Filtrar fontes de veículos
vehicle_scc <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case = TRUE), "SCC"]
vehicle_emissions_baltimore <- NEI %>%
  filter(fips == "24510" & SCC %in% vehicle_scc) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions, na.rm = TRUE))

# Criar o gráfico
png("plot5.png", width = 600, height = 400)
ggplot(vehicle_emissions_baltimore, aes(x = year, y = total)) +
  geom_line(color = "darkgreen", size = 1) +
  geom_point(size = 3) +
  labs(title = "Emissões de PM2.5 de Veículos Motorizados em Baltimore (1999-2008)",
       x = "Ano", y = "Emissões Totais (toneladas)") +
  theme_minimal()
dev.off()
