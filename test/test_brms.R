set.seed(1234)
dat <- data.frame(
  count = rpois(236, lambda = 20),
  visit = rep(1:4, each = 59),
  patient = factor(rep(1:59, 4)),
  Age = rnorm(236), 
  Trt = factor(sample(0:1, 236, TRUE)),
  AgeSD = abs(rnorm(236, 1)),
  Exp = sample(1:5, 236, TRUE),
  volume = rnorm(236),
  gender = factor(c(rep("m", 30), rep("f", 29)))
)
warmup <- 150
iter <- 200
chains <- 1
stan_model_args <- list(save_dso = FALSE)
library(brms)
fit <- brm(
  bf(count ~ Trt*Age + mo(Exp) + s(Age) +
       offset(Age) + (1+Trt|visit) + arma(visit, patient),
     sigma ~ Trt),
  data = dat, family = student(), 
  prior = set_prior("normal(0,2)", class = "b") +
    set_prior("cauchy(0,2)", class = "sd") +
    set_prior("normal(0,3)", dpar = "sigma"),
  sample_prior = TRUE, 
  warmup = warmup, iter = iter, chains = chains,
  stan_model_args = stan_model_args, rename = FALSE
)
print(fit)
