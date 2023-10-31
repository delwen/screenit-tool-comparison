# Prepare manual checks of negative controls
# i.e., If none of the tools pull out an ID, is there indeed no ID (any registration id)?

library(readr)
library(dplyr)
library(here)

data <- read_csv(here("data", "negative_control.csv"))

# Add columns for variables to enter in manual check

data_man_check <- data |>
  mutate(
    
    # url of the paper to check
    paper_url = paste0("https://pubmed.ncbi.nlm.nih.gov/", PMCID, "/"),
    
    # boolean whether reg id found in paper (e.g., protocol, trial registration)
    reg_id_in_paper = " ",
    
    # if `reg_id_in_paper` is TRUE, enter reg id here (if multiple, separated by commas)
    reg_id = " ",
    
    # comments
    comments = " "
  )

write_csv(data_man_check, here("data", "nc_man_check.csv"))