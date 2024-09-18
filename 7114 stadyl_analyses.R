# Install reghelper from CRAN if not already installed
if (!require("reghelper")) {
    install.packages("reghelper", repos = "http://cran.us.r-project.org")
}
# Recode values for missing data (9, 999) in the whole dataset as NA
data <- data %>% mutate_all(~na_if(., -999))
data <- data %>% mutate_all(~na_if(., -9))
