
library(tidyverse)
library(meta)

###########################################################################
# meta analysis for table with k = 3 --------------------------------------
###########################################################################

### load table with k = 3
meta_k3 <- read_rds("processed_data/meta_k3.rds")

### overall meta analysis -------------------------------------------------

### generic invers varianz random effects model/ meta analysis
meta <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k3,
  common = F,
  random = T,
)

summary(meta)

### extract values for results table
meta_overall_k3 <- summary(meta)$random |>
  as_tibble() |>
  mutate(
    Analysis = "Overall",
    Subgroup = "Total",
    k = meta$k,
    I2 = meta$I2,
    tau2 = meta$tau2,
    p_subgroup = NA
  ) |> 
  rename(
    pval = p
  ) |> 
  select(
    Analysis,
    Subgroup,
    k,
    TE,
    lower,
    upper,
    pval,
    I2,
    tau2,
    p_subgroup
  )


### country subgroup analysis ---------------------------------------------

### generic invers varianz random effects model/ meta analysis
meta_region <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k3,
  common = F,
  random = T,
  subgroup = region
)

summary(meta_region)

### extract values for results table
sub_region_k3 <- tibble(
  Analysis = "Region",
  Subgroup = meta_region$subgroup.levels,
  k = meta_region$k.w,
  TE = meta_region$TE.random.w,
  lower = meta_region$lower.random.w,
  upper = meta_region$upper.random.w,
  pval = meta_region$pval.random.w,
  I2 = meta_region$I2.w,
  tau2 = meta_region$tau2.w
) 

### add p value for sub groups for results table
sub_region_k3$p_subgroup <- NA
sub_region_k3$p_subgroup[1] <- meta_region$pval.Q.b.random


### age subgroup analysis -------------------------------------------------

### generic invers varianz random effects model/ meta analysis
meta_age <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k3,
  common = F,
  random = T,
  subgroup = age_group
)

summary(meta_age)

### extract values for results table
sub_age_k3 <- tibble(
  Analysis = "Age group",
  Subgroup = meta_age$subgroup.levels,
  k = meta_age$k.w,
  TE = meta_age$TE.random.w,
  lower = meta_age$lower.random.w,
  upper = meta_age$upper.random.w,
  pval = meta_age$pval.random.w,
  I2 = meta_age$I2.w,
  tau2 = meta_age$tau2.w
)

### add p value for sub groups for results table
sub_age_k3$p_subgroup <- NA
sub_age_k3$p_subgroup[1] <- meta_age$pval.Q.b.random


### create a single results table  ----------------------------------------

### combine tibbles
results_pool_k3 <- bind_rows(
  meta_overall_k3,
  sub_region_k3,
  sub_age_k3
)

### save as rds
write_rds(results_pool_k3, "processed_data/results_pool_k3.rds")

### clear env
# rm(list = ls())




###########################################################################
# meta analysis for table with k = 4 --------------------------------------
###########################################################################

### load meta table with k = 4
meta_k4 <- read_rds("processed_data/meta_k4.rds")

### overall meta analysis -------------------------------------------------

### generic invers varianz random effects model
meta <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k4,
  common = F,
  random = T,
)

summary(meta)

### extract values for results table
meta_overall_k4 <- summary(meta)$random |>
  as_tibble() |>
  mutate(
    Analysis = "Overall",
    Subgroup = "Total",
    k = meta$k,
    I2 = meta$I2,
    tau2 = meta$tau2,
    p_subgroup = NA
  ) |> 
  rename(
    pval = p
  ) |> 
  select(
    Analysis,
    Subgroup,
    k,
    TE,
    lower,
    upper,
    pval,
    I2,
    tau2,
    p_subgroup
  )


### country subgroup analysis ---------------------------------------------

### generic invers varianz random effects model/ meta analysis
meta_region <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k4,
  common = F,
  random = T,
  subgroup = region
)

summary(meta_region)

### extract values for results table
sub_region_k4 <- tibble(
  Analysis = "Region",
  Subgroup = meta_region$subgroup.levels,
  k = meta_region$k.w,
  TE = meta_region$TE.random.w,
  lower = meta_region$lower.random.w,
  upper = meta_region$upper.random.w,
  pval = meta_region$pval.random.w,
  I2 = meta_region$I2.w,
  tau2 = meta_region$tau2.w
)

### add p value for sub groups for results table
sub_region_k4$p_subgroup <- NA
sub_region_k4$p_subgroup[1] <- meta_region$pval.Q.b.random


### age subgroup analysis -------------------------------------------------

### generic invers varianz random effects model/ meta analysis
meta_age <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k4,
  common = F,
  random = T,
  subgroup = age_group
)

summary(meta_age)

### extract values for results table
sub_age_k4 <- tibble(
  Analysis = "Age group",
  Subgroup = meta_age$subgroup.levels,
  k = meta_age$k.w,
  TE = meta_age$TE.random.w,
  lower = meta_age$lower.random.w,
  upper = meta_age$upper.random.w,
  pval = meta_age$pval.random.w,
  I2 = meta_age$I2.w,
  tau2 = meta_age$tau2.w
) 

### add p value for sub groups for results table
sub_age_k4$p_subgroup <- NA
sub_age_k4$p_subgroup[1] <- meta_age$pval.Q.b.random


### create a single results table  ----------------------------------------

### combine tibbles
results_pool_k4 <- bind_rows(
  meta_overall_k4,
  sub_region_k4,
  sub_age_k4
)

### save as rds
write_rds(results_pool_k4, "processed_data/results_pool_k4.rds")

### clear env
# rm(list = ls())
