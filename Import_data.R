# Load necessary libraries
if (!require("haven")) {
    install.packages("haven", repos = "http://cran.us.r-project.org")
}
if (!require("httr")) {
    install.packages("httr", repos = "http://cran.us.r-project.org")
}

# Function to download and save the dataset
import_and_save_data <- function(file_path = "data/StadyL_Study2.sav") {
    # Create data directory if it doesn't exist
    if (!dir.exists("data")) {
        dir.create("data")
    }

    # Define the URL of the dataset
    data_url <- "https://osf.io/r4wg2/download"

    # Download the dataset if not already saved
    if (!file.exists(file_path)) {
        download.file(data_url, destfile = file_path, mode = "wb")
        message("Data has been downloaded and saved to: ", file_path)
    } else {
        message("Data already exists at: ", file_path)
    }

    # Load the dataset into R and return it
    data <- haven::read_sav(file_path)
    return(data)
}
