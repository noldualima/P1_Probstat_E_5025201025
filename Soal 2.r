# 2A
dbinom(x = 4, size = 20, prob = 0.2)

# 2B
x <- 3
p <- 0.2
prob <- dbinom(x = 0:10, size = 20, prob = 0.2)

library(dplyr)
library(ggplot2)

data.frame(heads = 0:10, prob) %>%
  mutate(Heads = ifelse(heads == 4, "4", "lainnya")) %>%
  ggplot(aes(x = factor(heads), y = prob, fill = Heads)) +
  geom_col(colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  geom_text(aes(label = round(prob, 2), y = prob + 0.01)) +
  labs(title = "Peluang jika X = 4 pasien sembuh.", x = "Sukses (x)", y = "Peluang") 

# 2C
n <- 20
p <- 0.2
E <- n * p 
E #Rataan
Var <- n * p * (1 - p)
Var #Varians
