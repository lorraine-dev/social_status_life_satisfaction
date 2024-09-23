# Load necessary libraries
library(haven)       # For reading SPSS files (.sav)
library(dplyr)       # For data wrangling
library(ggplot2)     # For visualization (if needed later)
library(httr)        # For making requests to download data
library(readr)       # For reading data if necessary

# Define the URL of the dataset
data_url <- "https://osf.io/r4wg2/download"

# Define the file path to save the downloaded file locally
file_path <- "StadyL_Study2.sav"

# Download the dataset from OSF
download.file(data_url, destfile = file_path, mode = "wb")

# Load the dataset (SPSS format) into R
data <- read_sav(file_path)

# Data wrangling: Recode missing values (9, 999) as NA
data <- data %>% 
  mutate_all(~na_if(., -999)) %>%
  mutate_all(~na_if(., -9))

# Check the structure of the dataset after transformation
str(data)

# Optional: Save the cleaned data to a new file
write_csv(data, "cleaned_stadyl_data.csv")

# Optional: Perform additional analysis or visualization
# Example: Simple plot
ggplot(data, aes(x = variable1, y = variable2)) + 
  geom_point() +
  labs(title = "Sample Plot", x = "Variable 1", y = "Variable 2")

# Save the plot to PDF
ggsave("plot2.pdf")
