#### Visualization ScreenIT ####
data <- read_csv(here("testing", "regset.csv"))

##### WORDCLOUDS ####
#ID GROUP
# create a subset with id_type and its frequency
id_group <- as.data.frame(table(data$id_type_group))

#create wordcloud
library(wordcloud)
library(RColorBrewer)

wordcloud(words = id_group$Var1, 
          freq = id_group$Freq,
          min.freq = 0,
          max.words=200,
          random.order = FALSE,
          rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

# ID TYPE
# create a subset with id_type and its frequency
id_type <- as.data.frame(table(data$id_type))

#create wordcloud
wordcloud(words = id_type$Var1, 
          freq = id_type$Freq,
          min.freq = 0,
          max.words=200,
          random.order=FALSE,
          rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

#### OTHER VISUALIZATIONS ####



          