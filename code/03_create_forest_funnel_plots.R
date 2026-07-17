###########################################################################
# forest plots for k3 ------------------------------------------------------------
###########################################################################

library(tidyverse)
library(showtext)
library(grid)
library(meta)


graphics.off()


### load data -------------------------------------------------------------

### load table with k = 3
meta_k3 <- read_rds("processed_data/meta_k3.rds")

### prepare data for plots
meta_k3 <- meta_k3 |> 
  rename(
    Region = region,
    `Age group` = age_group
  )

### set Times New Roman as font -------------------------------------------

### define TNR as Times New Roman based on win system files
font_add(
  family = "TNR",
  regular = "C:/Windows/Fonts/times.ttf",
  bold = "C:/Windows/Fonts/timesbd.ttf",
  italic = "C:/Windows/Fonts/timesi.ttf",
  bolditalic = "C:/Windows/Fonts/timesbi.ttf"
)

showtext_auto()
showtext_opts(dpi = 600)

### overall ---------------------------------------------------------------
meta_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k3,
  sm = "OR",
  common = F,
  random = T,
)

summary(meta_plot)

### define file for png
png(
  filename = "results/figures/overall_forest_k3.png",
  width = 10,
  height = 5,
  units = "in",
  type = "cairo-png",
  res = 600
)

### select 
par(family = "TNR")

### forest plot
forest(
  meta_plot,
  backtransf = T,
  xlab = "Relative effect",
  
  leftcols = c("studlab"),
  leftlabs = c("Study"),
  
  rightcols = c("effect", "ci", "w.random"),
  rightlabs = c("Effect", "95% CI", "Weight"),
  
  text.random = "Random-effects model",
  
  print.I2 = T,
  print.tau2 = T,
  print.pval.Q = T,
  
  digits = 3,
  digits.pval = 3,
  digits.pval.Q = 3,
  digits.I2 = 1,
  digits.tau2 = 4,
  digits.weight = 1,
  
  squaresize = 0.6,
  lwd.square = 0.8,
  lwd.diamond = 0.8,
  plotwidth = "5.5cm",
  colgap.left = "0.6cm",
  colgap.right = "0.4cm",
  colgap.studlab = "0.5cm",
  
  at = c(0.5, 1, 1.5, 2),
  
  addrows.below.overall = 4,
  
  col.square = "grey30",
  col.square.lines = "grey30",
  col.diamond = "grey60",
  col.diamond.lines = "black",
  
  fontsize = 10,
  fontfamily = "TNR",
  
  smlab = ""
)

grid.text(
  "A. Overall meta-analysis",
  x = unit(0.194, "npc"),
  y = unit(0.83, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)

dev.off()

### subgroup country  ----------------------------------------------------

meta_region_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k3,
  common = F,
  random = T,
  sm = "OR",
  subgroup = Region
)

summary(meta_region_plot)

### define file for png
png(
  filename = "results/figures/region_forest_k3.png",
  width = 10,
  height = 5,
  units = "in",
  type = "cairo-png",
  res = 600
)

par(family = "TNR")

### forest plot
forest(
  meta_region_plot,
  backtransf = T,
  xlab = "Relative effect",
  
  leftcols = c("studlab"),
  leftlabs = c("Study"),
  
  rightcols = c("effect", "ci", "w.random"),
  rightlabs = c("Effect", "95% CI", "Weight"),
  
  text.random = "Random-effects model",
  
  print.I2 = T,
  print.tau2 = T,
  print.pval.Q = T, 
  
  digits = 3,
  digits.pval = 3,
  digits.pval.Q = 3,
  digits.I2 = 1,
  digits.tau2 = 4,
  digits.weight = 1,
  
  squaresize = 0.6,
  lwd.square = 0.8,
  lwd.diamond = 0.8,
  plotwidth = "5.5cm",
  colgap.left = "0.6cm",
  colgap.right = "0.4cm",
  colgap.studlab = "0.5cm",
  
  at = c(0.5, 1, 1.5, 2),
  
  addrows.below.overall = 4,
  
  col.square = "grey30",
  col.square.lines = "grey30",
  col.diamond = "grey60",
  col.diamond.lines = "black",
  
  fontsize = 10,
  fontfamily = "TNR",
  
  smlab = ""
)

grid.text(
  "B. Region subgroup analysis",
  x = unit(0.194, "npc"),
  y = unit(0.94, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)


dev.off()



### age subgroup  -------------------------------------------------------

meta_age_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k3,
  common = F,
  random = T,
  sm = "OR",
  subgroup = `Age group`
)

summary(meta_age_plot)

### define file for png
png(
  filename = "results/figures/age_forest_k3.png",
  width = 10,
  height = 5,
  units = "in",
  type = "cairo-png",
  res = 600
)

par(family = "TNR")

### forest plot
forest(
  meta_age_plot,
  backtransf = T,
  xlab = "Relative effect",
  
  leftcols = c("studlab"),
  leftlabs = c("Study"),
  
  rightcols = c("effect", "ci", "w.random"),
  rightlabs = c("Effect", "95% CI", "Weight"),
  
  text.random = "Random-effects model",
  
  print.I2 = T,
  print.tau2 = T,
  print.pval.Q = T, 
  
  digits = 3,
  digits.pval = 3,
  digits.pval.Q = 3,
  digits.I2 = 1,
  digits.tau2 = 4,
  digits.weight = 1,
  
  squaresize = 0.6,
  lwd.square = 0.8,
  lwd.diamond = 0.8,
  plotwidth = "5.5cm",
  colgap.left = "0.6cm",
  colgap.right = "0.4cm",
  colgap.studlab = "0.5cm",
  
  at = c(0.5, 1, 1.5, 2),
  
  addrows.below.overall = 4,
  
  col.square = "grey30",
  col.square.lines = "grey30",
  col.diamond = "grey60",
  col.diamond.lines = "black",
  
  fontsize = 10,
  fontfamily = "TNR",
  
  smlab = ""
)

grid.text(
  "C. Age subgroup analysis",
  x = unit(0.194, "npc"),
  y = unit(0.94, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)


dev.off()



###########################################################################
# forest plots for k4 -----------------------------------------------------
###########################################################################

### load data ------------------------------------------------------------
meta_k4 <- read_rds("processed_data/meta_k4.rds")

### prepare data for plots
meta_k4 <- meta_k4 |> 
  rename(
    Region = region,
    `Age group` = age_group
  )

### overall ---------------------------------------------------------------
meta_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k4,
  sm = "OR",
  common = F,
  random = T,
)

summary(meta_plot)

### define file for png
png(
  filename = "results/figures/overall_forest_k4.png",
  width = 10,
  height = 5,
  units = "in",
  type = "cairo-png",
  res = 600
)

### select 
par(family = "TNR")

### forest plot
forest(
  meta_plot,
  backtransf = T,
  xlab = "Relative effect",
  
  leftcols = c("studlab"),
  leftlabs = c("Study"),
  
  rightcols = c("effect", "ci", "w.random"),
  rightlabs = c("Effect", "95% CI", "Weight"),
  
  text.random = "Random-effects model",
  
  print.I2 = T,
  print.tau2 = T,
  print.pval.Q = T,
  
  digits = 3,
  digits.pval = 3,
  digits.pval.Q = 3,
  digits.I2 = 1,
  digits.tau2 = 4,
  digits.weight = 1,
  
  squaresize = 0.6,
  lwd.square = 0.8,
  lwd.diamond = 0.8,
  plotwidth = "5.5cm",
  colgap.left = "0.6cm",
  colgap.right = "0.4cm",
  colgap.studlab = "0.5cm",
  
  at = c(0.5, 1, 1.5, 2),
  
  addrows.below.overall = 4,
  
  col.square = "grey30",
  col.square.lines = "grey30",
  col.diamond = "grey60",
  col.diamond.lines = "black",
  
  fontsize = 10,
  fontfamily = "TNR",
  
  smlab = ""
)

grid.text(
  "A. Overall meta-analysis",
  x = unit(0.194, "npc"),
  y = unit(0.83, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)

dev.off()


### subgroup country  ----------------------------------------------------

meta_region_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k4,
  common = F,
  random = T,
  sm = "OR",
  subgroup = Region
)

summary(meta_region_plot)

### define file for png
png(
  filename = "results/figures/region_forest_k4.png",
  width = 10,
  height = 5,
  units = "in",
  type = "cairo-png",
  res = 600
)

par(family = "TNR")

### forest plot
forest(
  meta_region_plot,
  backtransf = T,
  xlab = "Relative effect",
  
  leftcols = c("studlab"),
  leftlabs = c("Study"),
  
  rightcols = c("effect", "ci", "w.random"),
  rightlabs = c("Effect", "95% CI", "Weight"),
  
  text.random = "Random-effects model",
  
  print.I2 = T,
  print.tau2 = T,
  print.pval.Q = T, 
  
  digits = 3,
  digits.pval = 3,
  digits.pval.Q = 3,
  digits.I2 = 1,
  digits.tau2 = 4,
  digits.weight = 1,
  
  squaresize = 0.6,
  lwd.square = 0.8,
  lwd.diamond = 0.8,
  plotwidth = "5.5cm",
  colgap.left = "0.6cm",
  colgap.right = "0.4cm",
  colgap.studlab = "0.5cm",
  
  at = c(0.5, 1, 1.5, 2),
  
  addrows.below.overall = 4,
  
  col.square = "grey30",
  col.square.lines = "grey30",
  col.diamond = "grey60",
  col.diamond.lines = "black",
  
  fontsize = 10,
  fontfamily = "TNR",
  
  smlab = ""
)

grid.text(
  "B. Region subgroup analysis",
  x = unit(0.194, "npc"),
  y = unit(0.97, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)


dev.off()



### age subgroup  -------------------------------------------------------

meta_age_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k4,
  common = F,
  random = T,
  sm = "OR",
  subgroup = `Age group`
)

summary(meta_age_plot)

### define file for png
png(
  filename = "results/figures/age_forest_k4.png",
  width = 10,
  height = 5,
  units = "in",
  type = "cairo-png",
  res = 600
)

par(family = "TNR")

### forest plot
forest(
  meta_age_plot,
  backtransf = T,
  xlab = "Relative effect",
  
  leftcols = c("studlab"),
  leftlabs = c("Study"),
  
  rightcols = c("effect", "ci", "w.random"),
  rightlabs = c("Effect", "95% CI", "Weight"),
  
  text.random = "Random-effects model",
  
  print.I2 = T,
  print.tau2 = T,
  print.pval.Q = T, 
  
  digits = 3,
  digits.pval = 3,
  digits.pval.Q = 3,
  digits.I2 = 1,
  digits.tau2 = 4,
  digits.weight = 1,
  
  squaresize = 0.6,
  lwd.square = 0.8,
  lwd.diamond = 0.8,
  plotwidth = "5.5cm",
  colgap.left = "0.6cm",
  colgap.right = "0.4cm",
  colgap.studlab = "0.5cm",
  
  at = c(0.5, 1, 1.5, 2),
  
  addrows.below.overall = 4,
  
  col.square = "grey30",
  col.square.lines = "grey30",
  col.diamond = "grey60",
  col.diamond.lines = "black",
  
  fontsize = 10,
  fontfamily = "TNR",
  
  smlab = ""
)

grid.text(
  "C. Age subgroup analysis",
  x = unit(0.194, "npc"),
  y = unit(0.97, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)


dev.off()

rm(list = ls())






###########################################################################
# combine forest plots k 4 ------------------------------------------------
###########################################################################

library(magick)

### read forest plots -----------------------------------------------------

forest_overall <- image_read("results/figures/overall_forest_k4.png")
forest_region  <- image_read("results/figures/region_forest_k4.png")
forest_age     <- image_read("results/figures/age_forest_k4.png")

### combine plots vertically ----------------------------------------------

forest_combined <- image_append(
  c(
    forest_overall,
    forest_region,
    forest_age
  ),
  stack = T
)

### save combined figure --------------------------------------------------

image_write(
  forest_combined,
  path = "results/figures/forest_plots_k4_combined.png",
  format = "png"
)


###########################################################################
# combine forest plots k 3 ------------------------------------------------
###########################################################################

### read forest plots ---------------------------------------------------------

forest_overall <- image_read("results/figures/overall_forest_k3.png")
forest_region  <- image_read("results/figures/region_forest_k3.png")
forest_age    <- image_read("results/figures/age_forest_k3.png")

### combine plots vertically --------------------------------------------------

forest_combined <- image_append(
  c(
    forest_overall,
    forest_region,
    forest_age
  ),
  stack = T
)

### save combined figure ------------------------------------------------------

image_write(
  forest_combined,
  path = "results/figures/forest_plots_k3_combined.png",
  format = "png"
)


###########################################################################
# funnel plot for k = 3 ----------------------------------------------------
###########################################################################

### load data for k 3
meta_k3 <- read_rds("processed_data/meta_k3.rds")

# create meta object
meta_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k3,
  sm = "OR",
  common = F,
  random = T,
)

summary(meta_plot)

### overall funnel plot ---------------------------------------------------

png(
  filename = "results/figures/overall_funnel_k3.png",
  width = 5.5,
  height = 5.5,
  units = "in",
  type = "cairo-png",
  res = 600
)

par(
  family = "TNR",
  mar = c(4.2, 4.2, 2.2, 1.2)
)

funnel(
  meta_plot,
  backtransf = T,
  xlab = "Relative effect",
  ylab = "Standard error",
  studlab = F,
  pch = 16,
  cex = 1.1,
  col = "grey30",
  lwd = 1
)

grid.text(
  "Overall meta-analysis",
  x = unit(0.10, "npc"),
  y = unit(0.97, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)

dev.off()


### clear env for next code section
rm(list = ls())


###########################################################################
# funnel plot for k = 4 ---------------------------------------------------
###########################################################################

### load data for k 4
meta_k4 <- read_rds("processed_data/meta_k4.rds")

# create meta object
meta_plot <- metagen(
  TE = ES,
  seTE = meanSE,
  studlab = paste0(Author, " (", Year, ")"),
  data = meta_k4,
  sm = "OR",
  common = F,
  random = T,
)

summary(meta_plot)

### overall funnel plot -------------------------------------------------------

png(
  filename = "results/figures/overall_funnel_k4.png",
  width = 5.5,
  height = 5.5,
  units = "in",
  type = "cairo-png",
  res = 600
)

par(
  family = "TNR",
  mar = c(4.2, 4.2, 2.2, 1.2)
)

funnel(
  meta_plot,
  backtransf = T,
  xlab = "Relative effect",
  ylab = "Standard error",
  studlab = F,
  pch = 16,
  cex = 1.1,
  col = "grey30",
  lwd = 1
)

grid.text(
  "Overall meta-analysis",
  x = unit(0.10, "npc"),
  y = unit(0.97, "npc"),
  just = c("left", "top"),
  gp = gpar(
    fontfamily = "TNR",
    fontsize = 12,
    fontface = "bold"
  )
)

dev.off()
