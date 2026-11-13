CO2 Emissions Analysis: France

Individual Ecology Data Lab
Country-Level CO2 Emissions Analysis

Student: Alyssa Lou Partosa
Country: France
Country Code: FRA
Study Period: 1990–2024
Instructor: Mr. Abner Buco

Research Question

How did France's annual CO2 emissions and CO2 emissions per capita change from 1990 to 2024?

Data Source and Definitions

The data used in this analysis were obtained from the Our World in Data (OWID) CO2 and Greenhouse Gas Emissions dataset.

Dataset: https://github.com/owid/co2-data

The analysis focuses on France (FRA) from 1990 to 2024.

The following variables were used:

year – Year of observation

co2 – Annual CO2 emissions

co2_per_capita – CO2 emissions per person

population – Total population

gdp – Gross domestic product

cement_co2 – CO2 emissions from cement production

How to Reproduce the Analysis

Import the original OWID dataset into RStudio.

Filter the dataset to include France (FRA).

Select the required variables and study period (1990–2024).

Calculate summary statistics and annual percentage changes.

Generate the figures and save the results.

To reproduce the analysis, run:

source("scripts/analyze_co2.R")

Results

CO2 emissions in 1990: 395.75 million tonnes

CO2 emissions in 2024: 261.34 million tonnes

Overall percentage change: -33.96%

Peak emissions year: 1991

Peak emissions: 419.97 million tonnes

CO2 emissions per capita in 2024: 3.93 tonnes per person

The results show an overall decrease in France's annual CO2 emissions from 1990 to 2024.

Figures

Annual CO2 Emissions



CO2 Emissions Per Capita



Annual Percentage Change



Project Files

data/ – Contains the filtered France CO2 dataset.

scripts/ – Contains the R analysis script.

figures/ – Contains the generated graphs.

results/ – Contains summary statistics and yearly changes.

co2-emissions-FRA.Rproj – RStudio project file.

Limitations

This analysis focuses on fossil-fuel and industrial CO2 emissions. It does not establish the causes of changes in emissions.

References

Our World in Data. (n.d.). CO2 and greenhouse gas emissions. https://github.com/owid/co2-data