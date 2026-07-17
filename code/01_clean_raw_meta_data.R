
library(tidyverse)
library(readxl)

### load raw meta table as .xlsx file
raw_meta_table <- read_excel("master_table/meta_raw_extraction.xlsx")

### convert raw data into .csv file and save at input dir
write.csv(raw_meta_table, file = "input_data/raw_meta_table.csv")

### clear env
rm(list = ls())


### load raw data as csv
df <- read.csv("input_data/raw_meta_table.csv")


glimpse(df)

### sample size as character
## because read.csv couldn't handle different decimal marks
df$Sample_Size <- as.character(df$Sample_Size)

###########################################################################
# prepare data set with studies k = 3  ------------------------------------
###########################################################################

### remove Walsh & Schlauch and Yang et al.
meta_k3 <- df |> 
  filter(
    Author != "Walsh, B. & Schlauch, R.",
    Author != "Yang, T. et al."
    )

### remove empty rows in meta_k3
meta_k3 <- meta_k3[1:3, ]

### rename meta k3 columns correctly
meta_k3 <- meta_k3|> 
  rename(No      = `No.`,
         p_value = `p.value`)

str(meta_k3)

### create a clean labeled age subsgroup variable
meta_k3 <- meta_k3 |> 
  mutate(
    age_group = case_when(
      age_code == 1 ~ "Mixed adults",
      age_code == 2 ~ "Young adults",
      age_code == 3 ~ "Older adults"
    )
  )

### create a clean labeled region subsgroup variable
meta_k3 <- meta_k3 |> 
  mutate(
    region = case_when(
      country_code == 2 ~ "Asia",
      country_code == 1 ~ "USA"
    )
  )

### save data with k = 4
write_rds(meta_k3, "processed_data/meta_k3.rds")

##########################################################################
# prepare data set for studies k = 4 -------------------------------------
##########################################################################

### remove Walsh & Schlauch and Yang et al.l
meta_k4 <- df |> 
  filter(Author != "Walsh, B. & Schlauch, R.")

### remove empty rows in meta_k4
meta_k4 <- meta_k4[1:4, ]

### convert col names into R readable format
meta_k4 <- meta_k4|> 
  rename(No      = `No.`,
         p_value = `p.value`)

str(meta_k4)

### create a clean labeled age subsgroup variable
meta_k4 <- meta_k4 |> 
  mutate(
    age_group = case_when(
      age_code == 1 ~ "Mixed adults",
      age_code == 2 ~ "Young adults",
      age_code == 3 ~ "Older adults"
    )
  )

### create a clean labeled region subsgroup variable
meta_k4 <- meta_k4 |> 
  mutate(
    region = case_when(
      country_code == 2 ~ "Asia",
      country_code == 1 ~ "USA"
    )
  )

### save data set
write_rds(meta_k4, "processed_data/meta_k4.rds")
