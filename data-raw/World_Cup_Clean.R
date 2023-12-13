url = 'https://en.wikipedia.org/wiki/FIFA_World_Cup'

page <- read_html(url)

tablelist <- page %>%
  html_nodes('table')

wc.attendance <-
  page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header = FALSE, fill = TRUE)

wc.slice <- slice(wc.attendance, 3:24)

World_Cup <- wc.slice %>%
  select(1, 2, 4, 5, 6) %>%
  magrittr::set_colnames(c('Year', 'Hosts', 'Totalattendance', 'Matches', 'Averageattendance'))

World_Cup$Totalattendance <- as.numeric(str_remove_all(World_Cup$Totalattendance,','))
World_Cup$Averageattendance <- as.numeric(str_remove_all(World_Cup$Averageattendance,','))
World_Cup$Matches <- as.numeric(World_Cup$Matches)

World_Cup <- World_Cup %>%
  mutate(
    WorldCup = paste(World_Cup$Hosts, World_Cup$Year, sep = '')
  )

World_Cup <- World_Cup %>% select(3:6)

usethis::use_data(World_Cup)
