library(ggplot2)
library(gganimate)
theme_set(theme_bw())

df <- read.csv('Year_Downhill_Results_1.csv', header = TRUE, sep = ";")
head(df)
country <- c("SUI" = "red", "USA" = "blue", "ITA" = "green", "NOR" = "grey", "SLO" = "yellow", "LIE" = "orange", 
             "CAN" = "black", "AUT" = "pink", "SWE" = "beige", "FRA" = "brown", "GER" = "cyan" )
p <- ggplot(
  df, 
  aes(x = Rank , y= Points, size = Rank , colour = Nationality)
) +
  geom_point(show.legend = TRUE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 10)) +
  scale_x_log10() +
  labs(x = "Rank", y = "Total Points") 
p
p + transition_time(Year) +
  labs(title = "Year: {frame_time}")

