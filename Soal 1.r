# 1A
dgeom(3, 0.2)

# 1B
n <- 10000
p <- 0.20
x <- mean(rgeom(n = 10000, p) == 3)
x

# 1C
# Perbedaan poin a dan b yaitu pada poin A dilakukan distribusi geometrik yang tetap sehingga mengakibatkan nilai peluang distribusi geometrik
# akan bernilai sama. Sedangkan, pada poin B dilakukan distribusi geometrik yang acak sehingga hasilnya akan berbeda-beda saat melakukan perhitungan.

# 1D
install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)

x <- 3
p <- 0.2
prob <- dgeom(x = 0:5, p)

data.frame(x = 0:5, prob) %>% mutate(fail = ifelse(x == n, n, "lainnya")) %>%
ggplot(aes(x = factor(x), y = prob, fill = fail)) +
  geom_col(colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  geom_text(aes(label = round(prob, 2), y = prob - 0.01)) +
  labs(title = "Peluang X = 3 Gagal Sebelum Sukses Pertama", x = "Kegagalan sebelum kesuksesan pertama (x)", y = "Peluang") 

# 1E
n <- 3
p <- 0.2
E <- n / p
E #Rataan
Var <- (n - p) / ("^" (p, 2))
Var #Varians
