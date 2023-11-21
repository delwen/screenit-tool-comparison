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

#LOCATION BARPLOT - BESSER

# Select only the three columns of interest
location <- data[, c("id_in_abstract", "id_in_methods", 
                     "id_in_other_location")]

# Count TRUE values for each selected variable
count_true <- colSums(location)

#call plot.new()
plot.new()

#select custom colors
custom_palette <- colorRampPalette(c("#4EA8DE", "#48BFE3", "#56CFE1"))

#create barplot
barplot(count_true, 
        names.arg = colnames(location), 
        col = custom_palette(length(count_true)), 
        main = "General location of IDs", 
        ylab = "Count",
        ylim = c(0, max(count_true) + 15))

# Calculate the midpoints of the bars
bar_midpoints <- barplot(count_true, plot = FALSE)

# Add total count labels on each column (centered)
text(bar_midpoints, count_true, 
     labels = count_true, 
     pos = 3, 
     col = "black", 
     cex = 0.8)
