# plot4.R - Emissões de PM2.5 por queima de carvão nos EUA (1999-2008)

# Ler dados do SCC
SCC <- readRDS("/mnt/data/Source_Classification_Code.rds")

# Filtrar fontes de carvão
coal_scc <- SCC[grep("coal", SCC$EI.Sector, ignore.case = TRUE), "SCC"]
coal_emissions <- NEI %>%
  filter(SCC %in% coal_scc) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions, na.rm = TRUE))

# Criar o gráfico
png("plot4.png", width = 600, height = 400)
ggplot(coal_emissions, aes(x = year, y = total)) +
  geom_line(color = "brown", size = 1) +
  geom_point(size = 3) +
  labs(title = "Emissões de PM2.5 de Fontes de Combustão de Carvão nos EUA (1999-2008)",
       x = "Ano", y = "Emissões Totais (toneladas)") +
  theme_minimal()
dev.off()
