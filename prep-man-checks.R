# Prepare manual checks of TRNs found by different registration screening tools

library(readr)
library(dplyr)
library(here)

# Load the data arranged by found identifier
data <- read_csv(here("data", "all-data-by-id-updated.csv"))

# Each identifier is repeated for each time it was detected, therefore deduplicate

data_man_check <- data |>
  distinct(
    Identifier,
    PMCID,
    sciscore_hit,
    trialidentifier_hit,
    ctregistries_hit, 
    nct_hit,
    .keep_all = TRUE
  )

print(nrow(data_man_check))

# Add columns for variables to enter in manual check

data_man_check <- data_man_check |>
  mutate(
    
    # capture specific id type (e.g., “ctgov”, or “osf”, or “funder id”)
    id_type = " ",
    
    # capture  broader category for id type (e.g., “trn”, “protocol”, or “false positive”)
    id_type_group = " ",
    
    # boolean for whether found id in the abstract
    id_in_abstract = " ",
    
    # boolean for whether found id in the methods
    id_in_methods = " ",
    
    # boolean for whether found id in other section (either full text or specific section, e.g., acknowledgments, funding)
    id_in_other = " ",
    
    # boolean for whether the paper is a protocol
    paper_is_protocol = " ",
    
    # boolean for whether the paper is a review
    paper_is_review = " ",
    
    # any comments
    comments = " "
  )

write_csv(data_man_check, here("data", "reg_set_man_check.csv"))