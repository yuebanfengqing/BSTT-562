########################### estimation for the lower concentrations ######################
##################################### sigma_e2, alpha_i###################################
low <- p1.data[p1.data$Concentration == 0,]

ave <- 0
for (i in 1:max(low$Lab)) {
  ave[i] <- mean(low$Real[low$Lab == i])
}

low$y_mean <- rep(ave, each = max(low$Lab))

sigma_e2 <- 0
for (i in 1:max(low$Lab)) {
  sigma_i <- sum(sum((low$Real[low$Lab == i] - low$y_mean[low$Lab == i])^2) / 4) / 5
  sigma_e2 <- sigma_e2 + sigma_i
}

sigma_e2 # estimate of sigma_e2
alpha_i <- ave # estimates of alpha_i


########################### estimation for the higher concentrations ######################
##################################### beta_i, sigma_eta2 ##################################

medium <- p1.data[p1.data$Concentration == 20,]

aveh <- 0
for (i in 1:max(medium$Lab)) {
  aveh[i] <- mean(medium$Real[medium$Lab == i])
}

high$y_mean <- rep(aveh, each = maxmed$Lab))
