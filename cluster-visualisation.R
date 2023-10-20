library(wordcloud)
library(RColorBrewer)
library(readr)
library(dplyr)
library(ggplot2)
library(ggwordcloud)
library(here)

data <- read_csv(here("testing", "mock-data.csv"))

# wordcloud(words = data$id_type, freq = data$freq_id_type_overall, min.freq = 0,
#           max.words=200, colors=data$id_type_group, rot.per=0.35,
#           colors=brewer.pal(8, "Dark2"))

#Wordcloud
# set.seed(42)
# p <- ggplot(
#   data, 
#   aes(
#     label = id_type, 
#     size = freq_id_type_overall,
#     color = id_type_group,
#   )) + geom_text_wordcloud() + theme_minimal()


p <- ggplot(
  data,
  aes(
    label = id_type,
    size = freq_id_type_overall,
    color = id_type_group,
    angle = 0
  )
) +
  geom_text_wordcloud_area(eccentricity = 0.05) +
  scale_size_area(max_size = 30) +
  theme_minimal()

