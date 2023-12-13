#' Produce a graph for desired country of year vs population
#'
#'
#'
#'
#' @param a A valid country in string format 'country'
#' @return ggplot of desired country x = year y = population
#' @examples
#' CountryPopulation('Uganda')
#' CountryPopulation('United Kingdom)
#' @export
CountryPopulation <- function(country) {
  WorldPopulation.2 <- WorldPopulation %>%
    filter(CountryName == country)

  WorldPopulation.3 <- WorldPopulation.2 %>%
    pivot_longer(
      '1950':'2020',
      names_to = 'Year',
      values_to = 'Population'
    )
  WorldPopulation.3$Population <- as.numeric(WorldPopulation.3$Population)
  WorldPopulation.3$Year <- as.numeric(WorldPopulation.3$Year)

  CountryPlot <- ggplot(WorldPopulation.3, aes(x=Year, y=Population)) +
    geom_line() +
    labs(title = country)

  return(CountryPlot)
}
