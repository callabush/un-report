packages <- c('tidyverse', 'rmarkdown')
pkgs_installed <- sapply(packages,
                         requireNamespace, quietly = TRUE)
if (!all(pkgs_installed)) {
    install.packages(packages)
}
library(dplyr, quietly = TRUE)
pkg_versions <- installed.packages() %>%
    dplyr::as_tibble() %>%
    filter(Package %in% packages) %>%
    select(Package, Version)

print(getwd())
print(system('git --version', intern = TRUE))
print(R.Version()$version.string)
print(pkg_versions)

co2_emissions_dirty %>% 
  select(country, year, series, value) %>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions",
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions"))
co2_emissions_dirty %>%
  select(country, year, series, value) %>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emission",
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emission")) %>%
  pivot_wider(names_from=series, values_from=value)
#Finally, let’s go ahead and assign the output of this code chunk, 
#which is the cleaned dataframe, to a variable name:
co2_emissions <- co2_emissions_dirty %>%
  select(country, year, series, value) %>%
  mutate(series = recode(series, 
                    "Emissions (thousand metric tons of carbon dioxide)" = 
                        "total_emission",
                    "Emissions per capita (metric tons of carbon dioxide)" = 
                        "per_capita_emission")) %>%
  pivot_wider(names_from=series, values_from=value) %>%
  filter(year==2005) %>%
  select(-year)

#Bringing in 2007 Population data
read_csv("data/gapminder_data.csv")%>%
  filter(year ==2007)%>%
  select(country, pop, lifeExp, gdpPercap)

