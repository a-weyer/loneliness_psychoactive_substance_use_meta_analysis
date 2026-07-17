
library(tidyverse)
library(PRISMA2020)

###########################################################################
# PRISMA-Flowchart for k = 3 ----------------------------------------------
###########################################################################

### check template
# template_path <- system.file(
#  "extdata",
#  "PRISMA.csv",
#  package = "PRISMA2020"
# )

# prisma_data <- read.csv(template_path)

### copy template 
# write.csv(
#  prisma_data,
#  "input_data/prisma_flow_data.csv",
#  row.names = FALSE
# )

### prisma csv
prisma_data <- read.csv(
  "input_data/prisma_flow_data.csv",
  stringsAsFactors = F
)

### specifc data for flowchart
prisma_data <- prisma_data |>
  mutate(
    n = case_when(
      data == "database_results" ~ "148",
      data == "register_results" ~ "0",
      data == "duplicates" ~ "0",
      data == "excluded_automatic" ~ "0",
      data == "excluded_other" ~ "0",
      data == "records_screened" ~ "148",
      data == "records_excluded" ~ "137",
      data == "dbr_sought_reports" ~ "11",
      data == "dbr_notretrieved_reports" ~ "0",
      data == "dbr_assessed" ~ "11",
      data == "dbr_excluded" ~
        "Not eligible after full-text assessment, 6; Not suitable for quantitative synthesis, 2",
      data == "new_studies" ~ "3",
      data == "new_reports" ~ "3",
      data == "total_studies" ~ "3",
      data == "total_reports" ~ "3",
      data == "total_studies_ma" ~ "3",
      data == "total_reports_ma" ~ "3",
      T ~ as.character(n)
    )
  )

### convert data.frame into PRISMA input list
prisma_input <- PRISMA_data(prisma_data)

### create flowchart
prisma_plot <- PRISMA_flowdiagram(
  data = prisma_input,
  interactive = F,
  previous = F,
  other = F,
  detail_databases = F,
  detail_registers = F,
  meta_analysis = T,
  fontsize = 11,
  font = "Roman"
)

prisma_plot

### save svg
PRISMA_save(
  prisma_plot,
  "results/figures/prisma_flowchart_k3.svg"
)

### save as png
PRISMA_save(
  prisma_plot,
  "results/figures/prisma_flowchart_k3.png"
)


###########################################################################
# create PRISMA-Flowchart for k = 4 ---------------------------------------
###########################################################################

### specifc data for flowchart
prisma_data <- prisma_data |>
  mutate(
    n = case_when(
      data == "database_results" ~ "148",
      data == "register_results" ~ "0",
      data == "duplicates" ~ "0",
      data == "excluded_automatic" ~ "0",
      data == "excluded_other" ~ "0",
      data == "records_screened" ~ "148",
      data == "records_excluded" ~ "137",
      data == "dbr_sought_reports" ~ "11",
      data == "dbr_notretrieved_reports" ~ "0",
      data == "dbr_assessed" ~ "11",
      data == "dbr_excluded" ~
        "Not eligible after full-text assessment, 6; Not suitable for quantitative synthesis, 1",
      data == "new_studies" ~ "4",
      data == "new_reports" ~ "4",
      data == "total_studies" ~ "4",
      data == "total_reports" ~ "4",
      data == "total_studies_ma" ~ "4",
      data == "total_reports_ma" ~ "4",
      T ~ as.character(n)
    )
  )

### convert data.frame into PRISMA input list
prisma_input <- PRISMA_data(prisma_data)

### create flowchart
prisma_plot <- PRISMA_flowdiagram(
  data = prisma_input,
  interactive = F,
  previous = F,
  other = F,
  detail_databases = F,
  detail_registers = F,
  meta_analysis = T,
  fontsize = 11,
  font = "Roman"
)

prisma_plot

### save svg
PRISMA_save(
  prisma_plot,
  "results/figures/prisma_flowchart.svg"
)

### save as png
PRISMA_save(
  prisma_plot,
  "results/figures/prisma_flowchart.png"
)
