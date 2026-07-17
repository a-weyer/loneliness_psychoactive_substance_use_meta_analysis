
library(tidyverse)
library(flextable)
library(officer)
      
###########################################################################
# meta table k = 3 --------------------------------------------------------
###########################################################################

### load final data set
df <- read_rds("processed_data/meta_k3.rds")

### select and prepare data for table
df_edit <- df |> 
  select(Author, Year, Measure, Value, CIlow, CIup, age_code, country_code)

### rename all variable correctly
df_edit <- df_edit |> 
  rename(
    Study = Author,
    `Effect measure` = Measure,
    Estimate = Value,
    Region = country_code,
    `Age group` = age_code
  )

### rename Risk Ratio into RR
df_edit <- df_edit |>
  mutate(
    `Effect measure` = str_replace(`Effect measure`, "Risk Ratio", "RR")
  )

### create a single CI column
df_edit <- df_edit |> 
  mutate(
    Estimate = sprintf("%.3f", Estimate),
    `95% CI` = paste0(
      "[", 
      sprintf("%.3f", CIlow), 
      "; ", 
      sprintf("%.3f", CIup), "]"
      )
  ) 

### create final study col
df_edit <- df_edit |> 
  mutate(
    Study = paste0(Study, " (", Year, ")")
  )

### select and order final columns#
df_edit <- df_edit |> 
  select(Study, `Effect measure`, Estimate, `95% CI`, Region, `Age group`)


### create flex table based on this data selection -----------------------------
ft_meta <- flextable(df_edit) |>
  add_header_lines(
    values = "Table 1: Meta-analysis data table"
  ) |>
  add_footer_lines(
    values = c(
      "Abbreviations: OR = odds ratio; RR = risk ratio; PR = prevalence ratio; CI = confidence interval.",
      "Source: Own data extraction based on the studies included in the meta-analysis."
    )
  ) |> # adjust and edit header
  align(align = "left", part = "header") |>
  align(i = 2, align = "center", part = "header") |>
  align(j = "Study", align = "left", part = "header") |>
  align(j = "Study", align = "left", part = "body") |> 
  align( # adjust body of the table
    j = c("Effect measure", "Estimate", "95% CI", "Region", "Age group"),
    align = "center",
    part = "body"
  ) |> # adjust and edit foot note
  align(align = "left", part = "footer") |>
  valign(valign = "center", part = "all") |> 
  font(fontname = "Times New Roman", part = "all") |> # Font edits
  fontsize(size = 10, part = "all") |>
  fontsize(size = 9, part = "footer") |>
  italic(part = "footer") |>
  bold(i = 1, part = "header") |> 
  bold(i = 2, part = "header") |>
  padding( # padding in cells
    padding.top = 3,
    padding.bottom = 3,
    padding.left = 2,
    padding.right = 2,
    part = "all"
  ) |> # column size
  width(j = "Study", width = 2.25) |>
  width(j = "Effect measure", width = 0.75) |>
  width(j = "Estimate", width = 0.7) |>
  width(j = "95% CI", width = 1.00) |>
  width(j = "Region", width = 0.50) |>
  width(j = "Age group", width = 1.10) |>
  set_table_properties(layout = "fixed", width = 1)

### save as docx
save_as_docx(
  ft_meta,
  path = "results/tables/docx/t1_meta_table_k3.docx"
)

### save as png
save_as_image(
  ft_meta,
  path = "results/tables/png/t1_meta_table_k3.png",
  dpi = 600
)


###########################################################################
# meta table k = 4 --------------------------------------------------------
###########################################################################

### load final data set
df <- read_rds("processed_data/meta_k4.rds")

### select and prepare data for table
df_edit <- df |> 
  select(Author, Year, Measure, Value, CIlow, CIup, age_code, country_code)

### rename all variable correctly
df_edit <- df_edit |> 
  rename(
    Study = Author,
    `Effect measure` = Measure,
    Estimate = Value,
    Region = country_code,
    `Age group` = age_code
  )

### rename Risk Ratio into RR
df_edit <- df_edit |>
  mutate(
    `Effect measure` = str_replace(`Effect measure`, "Risk Ratio", "RR")
  )

### create a single CI column
df_edit <- df_edit |> 
  mutate(
    Estimate = sprintf("%.3f", Estimate),
    `95% CI` = paste0(
      "[", 
      sprintf("%.3f", CIlow), 
      "; ", 
      sprintf("%.3f", CIup), "]"
    )
  ) 

### create final study col
df_edit <- df_edit |> 
  mutate(
    Study = paste0(Study, " (", Year, ")")
  )

### select and order final columns#
df_edit <- df_edit |> 
  select(Study, `Effect measure`, Estimate, `95% CI`, Region, `Age group`)


### create flex table based on this data selection -----------------------------
ft_meta <- flextable(df_edit) |>
  add_header_lines(
    values = "Table 1: Meta-analysis data table"
  ) |>
  add_footer_lines(
    values = c(
      "Abbreviations: OR = odds ratio; RR = risk ratio; PR = prevalence ratio; CI = confidence interval.",
      "Source: Own data extraction based on the studies included in the meta-analysis."
    )
  ) |> # adjust and edit header
  align(align = "left", part = "header") |>
  align(i = 2, align = "center", part = "header") |>
  align(j = "Study", align = "left", part = "header") |>
  align(j = "Study", align = "left", part = "body") |> 
  align( # adjust body of the table
    j = c("Effect measure", "Estimate", "95% CI", "Region", "Age group"),
    align = "center",
    part = "body"
  ) |> # adjust and edit foot note
  align(align = "left", part = "footer") |>
  valign(valign = "center", part = "all") |> 
  font(fontname = "Times New Roman", part = "all") |> # Font edits
  fontsize(size = 10, part = "all") |>
  fontsize(size = 9, part = "footer") |>
  italic(part = "footer") |>
  bold(i = 1, part = "header") |> 
  bold(i = 2, part = "header") |>
  padding( # padding in cells
    padding.top = 3,
    padding.bottom = 3,
    padding.left = 2,
    padding.right = 2,
    part = "all"
  ) |> # column size
  width(j = "Study", width = 2.25) |>
  width(j = "Effect measure", width = 0.75) |>
  width(j = "Estimate", width = 0.7) |>
  width(j = "95% CI", width = 1.00) |>
  width(j = "Region", width = 0.50) |>
  width(j = "Age group", width = 1.10) |>
  set_table_properties(layout = "fixed", width = 1)

### save as docx
save_as_docx(
  ft_meta,
  path = "results/tables/docx/t1_meta_table_k4.docx"
)

### save as png
save_as_image(
  ft_meta,
  path = "results/tables/png/t1_meta_table_k4.png",
  dpi = 600
)






###########################################################################
# results table k = 3 -----------------------------------------------------
###########################################################################

### load table for pooled results
results_pool <- read_rds("processed_data/results_pool_k3.rds")

### clean data for final results table ------------------------------------
  
### convert I2 to percent if necessary
results_table <- results_pool |>
  mutate(
    I2 = if_else(!is.na(I2) & I2 <= 1, I2 * 100, I2)
  )

### back-transform pooled effect estimates
results_table <- results_table |>
  mutate(
    `Pooled effect` = sprintf("%.3f", exp(TE))
  )

### create single CI column
results_table <- results_table |>
  mutate(
    `95% CI` = paste0(
      "[",
      sprintf("%.3f", exp(lower)),
      "; ",
      sprintf("%.3f", exp(upper)),
      "]"
    )
  )

### format p-values
results_table <- results_table |>
  mutate(
    `p-value` = case_when(
      is.na(pval) ~ "",
      pval < .001 ~ "< .001",
      T ~ sub("^0", "", sprintf("%.3f", pval))
    ),
    `p subgroup` = case_when(
      is.na(p_subgroup) ~ "",
      p_subgroup < .001 ~ "< .001",
      T ~ sub("^0", "", sprintf("%.3f", p_subgroup))
    )
  )

### format heterogeneity statistics
results_table <- results_table |>
  mutate(
    `I² (%)` = case_when(
      is.na(I2) ~ "—",
      T ~ sprintf("%.1f", I2)
    ),
    `τ²` = case_when(
      is.na(tau2) ~ "—",
      T ~ sprintf("%.4f", tau2)
    )
  )

### select and order final columns
results_table <- results_table |>
  select(
    Analysis,
    Subgroup,
    k,
    `Pooled effect`,
    `95% CI`,
    `p-value`,
    `I² (%)`,
    `τ²`,
    `p subgroup`
  )

### create flex table based on this results table -----------------------------

ft_results <- flextable(results_table) |>
  add_header_lines(
    values = "Table 2: Summary of random-effects meta-analysis results"
  ) |>
  add_footer_lines(
    values = c(
      "Note: Pooled effects are back-transformed relative effects.",
      "Abbreviations: CI = confidence interval; I² = heterogeneity; τ² = between-study variance; p subgroup = test for subgroup differences.",
      "Source: Own calculations based on the studies included in the meta-analysis."
    )
  ) |> # adjust and edit header
  align(align = "left", part = "header") |>
  align(i = 2, align = "center", part = "header") |>
  align(j = "Analysis", align = "left", part = "header") |>
  align(j = c("Analysis", "Subgroup"), align = "left", part = "body") |> 
  align( # adjust body of the table
    j = c(
      "k",
      "Pooled effect",
      "95% CI",
      "p-value",
      "I² (%)",
      "τ²",
      "p subgroup"
    ),
    align = "center",
    part = "body"
  ) |> # adjust and edit foot note
  align(align = "left", part = "footer") |>
  valign(valign = "center", part = "all") |> 
  font(fontname = "Times New Roman", part = "all") |> # Font edits
  fontsize(size = 10, part = "all") |>
  fontsize(size = 9, part = "footer") |>
  italic(part = "footer") |>
  bold(i = 1, part = "header") |> 
  bold(i = 2, part = "header") |>
  padding( # padding in cells
    padding.top = 3,
    padding.bottom = 3,
    padding.left = 2,
    padding.right = 2,
    part = "all"
  ) |> # column size
  width(j = "Analysis", width = 0.75) |>
  width(j = "Subgroup", width = 1.05) |>
  width(j = "k", width = 0.30) |>
  width(j = "Pooled effect", width = 0.75) |>
  width(j = "95% CI", width = 0.95) |>
  width(j = "p-value", width = 0.55) |>
  width(j = "I² (%)", width = 0.55) |>
  width(j = "τ²", width = 0.45) |>
  width(j = "p subgroup", width = 0.70)

ft_results

### save as docx
save_as_docx(
  ft_results,
  path = "results/tables/docx/t2_results_table_k3.docx"
)

### save as png
save_as_image(
  ft_results,
  path = "results/tables/png/t2_results_table_k3.png",
  dpi = 600
)


###########################################################################
# results table k = 4 -----------------------------------------------------
###########################################################################

### laod table for pooled results
results_pool <- read_rds("processed_data/results_pool_k4.rds")

### clean data for final results table ------------------------------------

### convert I2 to percent if necessary
results_table <- results_pool |>
  mutate(
    I2 = if_else(!is.na(I2) & I2 <= 1, I2 * 100, I2)
  )

### back-transform pooled effect estimates
results_table <- results_table |>
  mutate(
    `Pooled effect` = sprintf("%.3f", exp(TE))
  )

### create single CI column
results_table <- results_table |>
  mutate(
    `95% CI` = paste0(
      "[",
      sprintf("%.3f", exp(lower)),
      "; ",
      sprintf("%.3f", exp(upper)),
      "]"
    )
  )

### format p-values
results_table <- results_table |>
  mutate(
    `p-value` = case_when(
      is.na(pval) ~ "",
      pval < .001 ~ "< .001",
      T ~ sub("^0", "", sprintf("%.3f", pval))
    ),
    `p subgroup` = case_when(
      is.na(p_subgroup) ~ "",
      p_subgroup < .001 ~ "< .001",
      T ~ sub("^0", "", sprintf("%.3f", p_subgroup))
    )
  )

### format heterogeneity statistics
results_table <- results_table |>
  mutate(
    `I² (%)` = case_when(
      is.na(I2) ~ "—",
      T ~ sprintf("%.1f", I2)
    ),
    `τ²` = case_when(
      is.na(tau2) ~ "—",
      T ~ sprintf("%.4f", tau2) 
    )
  )

### select and order final columns
results_table <- results_table |>
  select(
    Analysis,
    Subgroup,
    k,
    `Pooled effect`,
    `95% CI`,
    `p-value`,
    `I² (%)`,
    `τ²`,
    `p subgroup`
  )

### create flex table based on this results table -----------------------------

ft_results <- flextable(results_table) |>
  add_header_lines(
    values = "Table 2: Summary of random-effects meta-analysis results"
  ) |>
  add_footer_lines(
    values = c(
      "Note: Pooled effects are back-transformed relative effects.",
      "Abbreviations: CI = confidence interval; I² = heterogeneity; τ² = between-study variance; p subgroup = test for subgroup differences.",
      "Source: Own calculations based on the studies included in the meta-analysis."
    )
  ) |> # adjust and edit header
  align(align = "left", part = "header") |>
  align(i = 2, align = "center", part = "header") |>
  align(j = "Analysis", align = "left", part = "header") |>
  align(j = c("Analysis", "Subgroup"), align = "left", part = "body") |> 
  align( # adjust body of the table
    j = c(
      "k",
      "Pooled effect",
      "95% CI",
      "p-value",
      "I² (%)",
      "τ²",
      "p subgroup"
    ),
    align = "center",
    part = "body"
  ) |> # adjust and edit foot note
  align(align = "left", part = "footer") |>
  valign(valign = "center", part = "all") |> 
  font(fontname = "Times New Roman", part = "all") |> # Font edits
  fontsize(size = 10, part = "all") |>
  fontsize(size = 9, part = "footer") |>
  italic(part = "footer") |>
  bold(i = 1, part = "header") |> 
  bold(i = 2, part = "header") |>
  padding( # padding in cells
    padding.top = 3,
    padding.bottom = 3,
    padding.left = 2,
    padding.right = 2,
    part = "all"
  ) |> # column size
  width(j = "Analysis", width = 0.75) |>
  width(j = "Subgroup", width = 1.05) |>
  width(j = "k", width = 0.30) |>
  width(j = "Pooled effect", width = 0.75) |>
  width(j = "95% CI", width = 0.95) |>
  width(j = "p-value", width = 0.55) |>
  width(j = "I² (%)", width = 0.55) |>
  width(j = "τ²", width = 0.45) |>
  width(j = "p subgroup", width = 0.70)

ft_results

### save as docx
save_as_docx(
  ft_results,
  path = "results/tables/docx/t2_results_table_k4.docx"
)

### save as png
save_as_image(
  ft_results,
  path = "results/tables/png/t2_results_table_k4.png",
  dpi = 600
)
