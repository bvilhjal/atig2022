#Twin data simulation

#Parameters
h2 <- 0.7
c <- 0.1
mean_val <- 172
sd_val <- 8
n_sample <- 1000

#Simulating mz twins
mz_g <- rnorm(n_sample,0,sqrt(h2))
mz_c <- rnorm(n_sample,0,sqrt(c))
mz_e1 <- rnorm(n_sample,0,sqrt(1-h2-c))
mz_e2 <- rnorm(n_sample,0,sqrt(1-h2-c))
mz1 <-mz_g+mz_c+mz_e1
mz2 <-mz_g+mz_c+mz_e2
cor(mz1,mz2) # Should equal shared variance
mz1 <- sd_val*mz1+mean_val
mz2 <- sd_val*mz2+mean_val
plot(mz1,mz2)


#Simulating dz twins
dz_gs <- rnorm(n_sample,0,sqrt(0.5*h2))
dz_g1 <- rnorm(n_sample,0,sqrt(0.5*h2))
dz_g2 <- rnorm(n_sample,0,sqrt(0.5*h2))
dz_c <- rnorm(n_sample,0,sqrt(c))
dz_e1 <- rnorm(n_sample,0,sqrt(1-h2-c))
dz_e2 <- rnorm(n_sample,0,sqrt(1-h2-c))
dz1 <-dz_gs+dz_g1+dz_c+dz_e1
dz2 <-dz_gs+dz_g2+dz_c+dz_e2
cor(dz1,dz2) # Should equal shared variance
dz1 <- sd_val*dz1+mean_val
dz2 <- sd_val*dz2+mean_val
plot(mz1,mz2)

d <-data.frame(mz1,mz2,dz1,dz2)

write.csv(d,'~/REPOS/atig2022/data/twin_data.csv')

#Falconer's equation
2*(cor(mz1,mz2)-cor(dz1,dz2))

