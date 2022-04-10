# PRAKTIKUM PROBSTAT MODUL 1 2022
- Nama  : Dawamul Fikri Aqil
- NRP   : 5025201025
- Kelas : Probstat E
------------------------------
## Soal 1
Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.
### 1.A
Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
```
> dgeom(3, 0.2)
[1] 0.1024
```
### 1.B
mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
```
> n = 10000
> p = 0.20
> x = mean(rgeom(n = 10000, p)==3)
> x
[1] 0.102
```
### 1.C
Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
```
Perbedaan poin a dan b yaitu pada poin A dilakukan distribusi geometrik yang tetap
sehingga mengakibatkan nilai peluang distribusi geometrik akan bernilai sama.
Sedangkan, pada poin B dilakukan distribusi geometrik yang acak
sehingga hasilnya akan berbeda-beda saat melakukan perhitungan.
```
### 1.D
Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
```
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

```
Hasil histogram:
![image](https://user-images.githubusercontent.com/102939348/162630331-0db521b9-e298-47ba-8f7c-0b1e1c746353.png)
### 1.E
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
```
> n <- 3
> p <- 0.2
> E <- n / p
> E #Rataan
[1] 15
> Var <- (n - p) / ("^" (p, 2))
> Var #Varians
[1] 70
```
Lampiran: ![image](https://user-images.githubusercontent.com/102939348/162630748-3a8c1e66-306a-4346-99db-023c4dafc334.png)

## Soal 2
Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
Kasus ini dapat diselesaikan dengan binomial distribution.
### 2.A
Peluang terdapat 4 pasien yang sembuh.
```
> dbinom(x = 4, size = 20, prob = 0.2)
[1] 0.2181994
```
### 2.B
Gambarkan grafik histogram berdasarkan kasus tersebut.
```
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

```
Hasil histogram:
![This is an image](https://r2.varisk.xyz/r/220410/-Rout-494936385.jpg)
### 2.C
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial
```
> n <- 20
> p <- 0.2
> E <- n * p 
> E #Rataan
[1] 4
> Var <- n * p * (1 - p)
> Var #Varians
[1] 3.2
```
Lampiran: ![image](https://user-images.githubusercontent.com/102939348/162630760-b9c80d38-cdcb-430b-bb49-c633844cea72.png)

## Soal 3
Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
### 3.A
Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
```
> dpois(6, 4.5)
[1] 0.1281201
```
### 3.B
simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)
```
set.seed(2)
baby <- data.frame('data' = rpois(365, 4.5))
baby %>% ggplot() +
  geom_histogram(aes(x = data, y = stat(count / sum(count)), fill = data == 6), binwidth = 1, color = 'black',) +
  scale_fill_manual(values = c("#FFCC66", "#669933")) +
  scale_x_continuous(breaks = 0:10) +
  labs(x = 'Jumlah bayi lahir per periode', y = 'Proporsi', title = 'Simulasi kelahiran selama setahun (n=365) di rumah sakit') +
  theme_bw()
```
Hasil histogram:
![image](https://user-images.githubusercontent.com/102939348/162630181-3ac01c28-b3f2-4664-9959-037ac890df73.png)
### 3.C
dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
```
# Perbandingan poin a dan poin b kurang lebih sama
# karena nilai proporsi yang didapatkan di poin A
# berada dalam range proporsi yang ada di poin B yaitu 0.10-0.15.
# Oleh karena itu, pengaruh perhitungan dengan estimasi selama 365 hari
# memberikan hasil yang mendekati dengan peluang bayi akan dilahirkan keesokan harinya
```
### 3.D
Nilai Rataan (μ) dan Varian ( σ² ) dari Distribusi Poisson.
```
> p <- 6
> E <- p
> E #Rataan
[1] 6
> Var <- p
> Var #Varians
[1] 6
```
Lampiran: ![image](https://user-images.githubusercontent.com/102939348/162630780-5f15a5c0-574c-46b2-ada6-015decf04d46.png)

## Soal 4
Diketahui nilai x = 2 dan v = 10. Tentukan:
### 4.A
Fungsi Probabilitas dari Distribusi Chi-Square.
```
> p <- 2
> q <- 10
> dchisq(p, q)
[1] 0.007664155
```
### 4.B
Histogram dari Distribusi Chi-Square dengan 100 data random.
```
> hist(rchisq(100, q))
```
![image](https://r3.varisk.xyz/r/220410/-Rout--407929211.jpg)
### 4.C
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.
```
> df <- 10
> E <- df
> E #Rataan
[1] 10
> Var <- 2 * df
> Var #Varians
[1] 20
```
Lampiran: ![image](https://user-images.githubusercontent.com/102939348/162630792-49989094-53ac-4379-913f-b9501dbb2d4b.png)

## Soal 5
Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan:
### 5.A
Fungsi Probabilitas dari Distribusi Exponensial
```
> set.seed(1)
> rexp(3)
[1] 0.7551818 1.1816428 0.1457067
```
### 5.B
Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
```
> hist(rexp(10))
```
![image](https://user-images.githubusercontent.com/102939348/162629583-ac4100c2-4a87-4aa6-866a-6424d248f906.png)

```
> hist(rexp(100))
```
![image](https://user-images.githubusercontent.com/102939348/162629594-fa542c65-1d34-4d97-aa63-afa423c44743.png)

```
> hist(rexp(1000))
```
![image](https://user-images.githubusercontent.com/102939348/162629603-7a698651-4bf9-430b-9318-8e290cc7d8d2.png)

```
> hist(rexp(10000))
```
![image](https://user-images.githubusercontent.com/102939348/162629607-bf538057-1513-4174-90c5-fa2cb087b889.png)
### 5.C
Nilai Rataan (μ) dan Varian ( σ² ) dari Distribusi Exponensial untuk n = 100 dan λ = 3
```
> L <- 3
> E <- 1 / L
> E #Rataan
[1] 0.3333333
> Var <- 1 / (L * L)
> Var #Varians
[1] 0.1111111
```
Lampiran: ![image](https://user-images.githubusercontent.com/102939348/162630804-cfc48b23-616a-43b4-8a84-a839f9a4a459.png)

## Soal 6
Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan
### 6.A
Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
Keterangan :
- X1 = Dibawah rata-rata
- X2 = Diatas rata-rata
- Contoh data : 11 1,2,4,2,6,3,10,11,5,3,6,8
- rata-rata = 5.083333
- X1 = 5
- X2 = 6
```
> E <- 50
> p <- 8
> n <- 100
> s <- rnorm(n, E, p)
> s
> plot(s)
[1] 39.91777 51.17373 54.79830 38.55211 51.89115 42.77417 55.24609 54.07671
[9] 60.74130 38.13450 54.12880 50.07593 43.80802 63.95291 51.59291 53.82751
[17] 39.35142 68.90828 60.44061 43.72362 52.35327 39.27775 50.40565 39.25376
[25] 45.11106 53.01269 43.75673 41.61015 55.37410 38.91624 50.06277 60.32792
[33] 43.97117 44.53648 42.94168 43.48636 41.89383 59.95857 54.17513 56.16866
[41] 50.62374 52.30691 53.36568 61.95016 45.56997 46.21366 58.16545 34.40530
[49] 46.83840 55.08655 37.50706 43.05663 43.58501 59.84372 39.39048 43.97342
[57] 46.17756 59.88676 48.51004 38.54231 62.86441 54.45774 52.78228 50.05642
[65] 50.38853 58.04448 36.17470 44.85917 49.16814 34.66089 38.40070 61.46830
[73] 46.83108 47.67828 41.94272 55.35799 47.71026 51.54761 52.32086 68.54145
[81] 40.05153 38.62246 45.42787 39.24245 45.93140 48.79437 39.87224 58.12198
[89] 45.76749 53.10189 42.59683 37.72100 66.58811 44.79504 57.78650 57.34775
[97] 64.42117 45.30316 51.66660 52.88808
```
Hasil Plot:
![image](https://user-images.githubusercontent.com/102939348/162629299-4b67c0c9-2018-4e1c-a54e-5518739b0742.png)
### 6.B
Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: NRPNama_Probstat{Nama Kelas}_DNhistogram
- Contoh : 312312312_Rola_Probstat_A_DNhistogram
![image](https://user-images.githubusercontent.com/102939348/162629320-3618fc16-6ccc-4d5d-8c62-237fef4817c3.png)
### 6.C
Nilai Varian ( ) dari hasil generate random nilai σ² Distribusi Normal.
```
> p <- 8
> Var <- p * p
> Var #Varians
[1] 64
```
Lampiran: ![image](https://user-images.githubusercontent.com/102939348/162630810-39ed44f9-6ffa-49e1-8daa-c8020c344719.png)
