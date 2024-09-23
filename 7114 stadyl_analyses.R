# Install reghelper from CRAN if not already installed
if (!require("reghelper")) {
    install.packages("reghelper", repos = "http://cran.us.r-project.org")
}
# Define the URL of the dataset
data_url <- "https://osf.io/r4wg2/download"

# Define the file path to save the downloaded file locally
file_path <- "StadyL_Study2.sav"

# Download the dataset from OSF if it doesn't exist locally
if (!file.exists(file_path)) {
    download.file(data_url, destfile = file_path, mode = "wb")
}

# Load the dataset (SPSS format) into R
data <- haven::read_sav(file_path)

# Recode values for missing data (9, 999) in the whole dataset as NA
data <- data %>% mutate_all(~na_if(., -999))
data <- data %>% mutate_all(~na_if(., -9))

# Check the structure of the dataset to ensure the wrangling is done correctly
str(data)

# Optionally save the cleaned data to a new CSV file
# write_csv(data, "cleaned_stadyl_data.csv")
