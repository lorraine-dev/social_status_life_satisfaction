# Install reghelper from CRAN if not already installed
if (!require("reghelper")) {
    install.packages("reghelper", repos = "http://cran.us.r-project.org")
}
# Source the data import script (which contains the data import function)
source("data_import.R")

# Call the function to import and load the dataset
data <- import_and_save_data()

# Recode values for missing data (9, 999) in the whole dataset as NA
data <- data %>% mutate_all(~na_if(., -999))
data <- data %>% mutate_all(~na_if(., -9))

# Check the structure of the dataset to ensure the wrangling is done correctly
str(data)

# Optionally save the cleaned data to a new CSV file
# write_csv(data, "cleaned_stadyl_data.csv")
