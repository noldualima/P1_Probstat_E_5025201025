# 3A
dpois(6, 4.5)

# 3B
set.seed(2)
baby <- data.frame('data' = rpois(365, 4.5))
baby %>% ggplot() +
  geom_histogram(aes(x = data, y = stat(count / sum(count)), fill = data == 6), binwidth = 1, color = 'black',) +
  scale_fill_manual(values = c("#FFCC66", "#669933")) +
  scale_x_continuous(breaks = 0:10) +
  labs(x = 'Jumlah bayi lahir per periode', y = 'Proporsi', title = 'Simulasi kelahiran selama setahun (n=365) di rumah sakit') +
  theme_bw()

# 3C
# Perbandingan poin a dan poin b kurang lebih sama
# karena nilai proporsi yang didapatkan di poin A berada dalam
# range proporsi yang ada di poin B yaitu 0.10-0.15.
# Oleh karena itu, pengaruh perhitungan dengan estimasi selama 365 hari
# memberikan hasil yang mendekati dengan peluang bayi akan dilahirkan keesokan harinya

# 3D
p <- 6
E <- p
E #Rataan
Var <- p
Var #Varians
