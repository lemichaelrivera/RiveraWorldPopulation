data1 <- read_excel('data-raw/World_Population.xlsx')
data2 <- read_excel('data-raw/World_Population.xlsx', sheet=1, skip = 16)
data3 <- data2 %>%
  select(3, 8:78)
data4 <- data3 %>%
  slice(27:289)

WorldPopulation <- rename(data4, 'CountryName' = 'Region, subregion, country or area *')

usethis::use_data(WorldPopulation)
