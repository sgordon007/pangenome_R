install.packages("tidyverse")
library(tidyverse)

unout_raw = read.table("data/PAC2_0.460-PAC2_0.378_5.tab.txt", sep = "\t", header = FALSE)

unout_raw$V3 = as.factor(unout_raw$V3)
unout_raw$V4 = as.factor(unout_raw$V4)

str(unout_raw)
factor(unout_raw$V3, levels = c(1, 2, 3))

g <- ggplot(unout_raw, aes(V3))
g + geom_bar()

g <- ggplot(unout_raw, aes(V4))
g + geom_bar()

unout_raw %>%
  group_by(V3) %>%
  summarise(no_rows = length(V3))

unout_raw %>%
  group_by(V1) %>%
  tally

ggplot(data = unout_raw, aes(x = V3, y = V1)) +    geom_bar(stat="count", alpha = 0) +    geom_jitter(alpha = 0.3, color = "tomato")

ggplot(data = unout_raw, aes(x = V4, y = V2)) +    geom_bar(stat="count", alpha = 0) +    geom_jitter(alpha = 0.3, color = "tomato")



my_plot <- ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  labs(title = 'Observed species in time',
       x = 'Year of observation',
       y = 'Number of species') +
  theme_bw() +
  theme(axis.text.x = element_text(colour="grey20", size=12, angle=90, hjust=.5, vjust=.5),
        axis.text.y = element_text(colour="grey20", size=12),
        text=element_text(size=16))
ggsave("name_of_file.png", my_plot, width=15, height=10)
