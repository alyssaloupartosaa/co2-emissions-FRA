# CO2 Emissions Analysis: France
# Study Period: 1990-2024

# 1. Set country and study period
country_code <- "FRA"
start_year <- 1990
end_year <- 2024

# 2. Load required package
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
library(dplyr)

# 3. Read the original OWID dataset
co2_data <- read.csv("data/owid-co2-data.csv")

# 4. Filter France data
france_data <- co2_data %>%
  filter(
    iso_code == country_code,
    year >= start_year,
    year <= end_year
  ) %>%
  select(year, country, iso_code, population,
         gdp, cement_co2, co2, co2_per_capita)

# 5. Save France-only dataset
write.csv(
  france_data,
  "data/FRA_co2.csv",
  row.names = FALSE
)

# 6. Calculate summary statistics
summary_data <- data.frame(
  country = "France",
  iso_code = country_code,
  first_year = min(france_data$year, na.rm = TRUE),
  last_year = max(france_data$year, na.rm = TRUE),
  first_co2_mt = first(france_data$co2),
  last_co2_mt = last(france_data$co2),
  endpoint_change_percent =
    ((last(france_data$co2) - first(france_data$co2)) /
       first(france_data$co2)) * 100,
  peak_year = france_data$year[which.max(france_data$co2)],
  peak_co2_mt = max(france_data$co2, na.rm = TRUE),
  latest_co2_per_capita_t =
    last(france_data$co2_per_capita)
)

write.csv(
  summary_data,
  "results/FRA_summary.csv",
  row.names = FALSE
)

# 7. Calculate yearly changes
france_data <- france_data %>%
  arrange(year) %>%
  mutate(
    annual_change_percent =
      (co2 - lag(co2)) / lag(co2) * 100
  )

write.csv(
  france_data,
  "results/FRA_yearly_changes.csv",
  row.names = FALSE
)

# 8. Create figures
png("figures/FRA_annual_co2.png",
    width = 1000, height = 600)
plot(france_data$year, france_data$co2,
     type = "l", lwd = 2,
     main = "Annual CO2 Emissions in France",
     xlab = "Year",
     ylab = "CO2 Emissions (Million Tonnes)")
dev.off()

png("figures/FRA_per_capita.png",
    width = 1000, height = 600)
plot(france_data$year, france_data$co2_per_capita,
     type = "l", lwd = 2,
     main = "CO2 Emissions Per Capita in France",
     xlab = "Year",
     ylab = "Tonnes per Person")
dev.off()

png("figures/FRA_annual_change.png",
    width = 1000, height = 600)
plot(france_data$year, france_data$annual_change_percent,
     type = "l", lwd = 2,
     main = "Annual Percentage Change in France CO2 Emissions",
     xlab = "Year",
     ylab = "Annual Change (%)")
abline(h = 0, lty = 2)
dev.off()

# 9. Save session information
writeLines(
  capture.output(sessionInfo()),
  "results/session_info.txt"
)

# 10. Completion message
cat("Completed country analysis for France (FRA).",
    "Check data/, figures/, and results.")